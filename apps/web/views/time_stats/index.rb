module Web::Views::TimeStats
  class Index
    include Web::View

    def repo
      TimeEntryRepository.new
    end

    def user_stats
      # WorkoutRepository.new.for_account(current_account.id)
      # repo.for_user(current_user.id).sum(:minutes)
      repo.user_dates_minutes(current_user.id)
    end
  end
end
