module Web::Views::TimeEntries
  class Index
    include Web::View

    def repo
      TimeEntryRepository.new
    end

    def date
      date = params[:date] && Rich::Date.safe_parse(params[:date], Date.today)
      date ||= Date.today
    end

    def time_entries
      # WorkoutRepository.new.for_account(current_account.id)
      repo.for_user_by_date(current_user.id, date)
    end

    def total_time
      minutes = repo.user_sum_for_date(current_user.id, date)
      hours_minutes(minutes)
    end

    def form
      form_for :time_entry, routes.time_entries_path do
        div(class: 'field') do
          span(class: 'select') do
            select :minutes, %w(25 40 60 120).map { |a| [a.to_s, a.to_s] } , options: { selected: session[:minutes].to_s }
          end
          hidden_field :date, value: date
          submit '+', class: 'button is-info', id: 'tomato-add'
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
