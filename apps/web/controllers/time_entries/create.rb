module Web::Controllers::TimeEntries
  class Create
    include Web::Action
    before :authenticate!

    params do
      required(:time_entry).schema do
        required(:minutes) { type?(Integer) & gteq?(0) }
        required(:minutes) { type?(Integer) & lteq?(240) }
        required(:date).filled(:date?)
      end
    end

    def call(params)
      create_time_entry
      redirect_to routes.root_path(date: params[:time_entry][:date])
    end

    private

    def create_time_entry
      unless params.valid?
        flash[:error] = params.error_messages.join("/n")
        return
      end
      params[:time_entry][:date] ||= Date.today
      params[:time_entry][:user_id] = current_user.id
      TimeEntryRepository.new.create(params[:time_entry])
    end
  end
end
