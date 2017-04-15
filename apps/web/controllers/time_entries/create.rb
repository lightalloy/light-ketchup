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
      time_entry = create_time_entry
      session[:minutes] = time_entry.minutes if time_entry
      if self.format == :json
        render_json(time_entry)
      else
        redirect_to routes.root_path(date: time_entry.date)
      end
      # redirect_to routes.root_path(date: params[:time_entry][:date])
    end

    private

    def render_json(time_entry)
      self.status = 200
      self.body = time_entry.nil? ? failed_json : success_json(time_entry)
    end

    def failed_json
      { success: false }.to_json
    end

    def success_json(time_entry)
      {
        success: true,
        minutes: time_entry.minutes,
        id: time_entry.id
      }.to_json
    end

    def create_time_entry
      unless params.valid?
        flash[:error] = params.error_messages.join("\n")
        return
      end
      params[:time_entry][:date] ||= Date.today
      params[:time_entry][:user_id] = current_user.id
      TimeEntryRepository.new.create(params[:time_entry])
    end
  end
end
