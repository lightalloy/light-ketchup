module Web::Views::TimeEntries
  class Index
    include Web::View

    def date
      date = params[:date] && Rich::Date.safe_parse(params[:date], Date.today)
      date ||= Date.today
    end

    def time_entries
      # WorkoutRepository.new.for_account(current_account.id)
      TimeEntryRepository.new.for_user_by_date(current_user.id, date)
    end

    def form
      form_for :time_entry, routes.time_entries_path do
        div(class: 'field') do
          span(class: 'select is-small') do
            select :minutes, %w(25 40 60 120).map { |a| [a, a] }
          end
          hidden_field :date, value: date
          submit '+', class: 'button is-small is-info'
        end
      end
    end

    def destroy_form(time_entry)
      form_for time_entry, routes.time_entry_path(id: time_entry.id), method: :delete, id: "time-entry-#{time_entry.id}" do
        submit '', class: 'delete is-small', 'data-entry-id' => time_entry.id
      end
    end
  end
end
