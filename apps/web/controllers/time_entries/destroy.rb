module Web::Controllers::TimeEntries
  class Destroy
    include Web::Action
    before :authenticate!

    def repo
      TimeEntryRepository.new
    end

    def call(params)
      if destroy_time_entry
        flash[:notice] = 'Destroyed successfully'
      else
        flash[:error] = 'Failed to destroy'
      end
      redirect_to routes.root_path
      # self.status = 200
      # self.body = {
      #   success: destroy_time_entry
      # }.to_json
    end

    private

    def destroy_time_entry
      time_entry = repo.one_for_user_by_id(current_user.id, params[:id])
      return false unless time_entry
      destroyed = repo.delete(time_entry.id)
      !destroyed.nil?
    end
  end
end
