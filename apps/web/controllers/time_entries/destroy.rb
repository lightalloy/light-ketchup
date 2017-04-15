module Web::Controllers::TimeEntries
  class Destroy
    include Web::Action
    before :authenticate!

    def repo
      TimeEntryRepository.new
    end

    def call(params)
      success = destroy_time_entry
      if self.format == :json
        render_json(success)
      else
        flash[:error] = 'Failed to destroy' unless success
        redirect_to routes.root_path
      end
    end

    private

    def render_json(success)
      self.status = 200
      self.body = {
        success: success
      }.to_json
    end

    def destroy_time_entry
      time_entry = repo.one_for_user_by_id(current_user.id, params[:id])
      return false unless time_entry
      destroyed = repo.delete(time_entry.id)
      !destroyed.nil?
    end
  end
end
