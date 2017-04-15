module Web::Views::TimeEntries
  class Index
    include Web::View

    def time_entries
      # WorkoutRepository.new.for_account(current_account.id)
      TimeEntryRepository.new.for_user(current_user.id)
    end

    def form
      form_for :time_entry, routes.time_entries_path do
        select :minutes, %w(25 40 60).map { |a| [a, a] }
        text_field :date, value: Date.today.to_s
        submit 'Create'
      end
    end
  end
end
