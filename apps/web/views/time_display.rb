module Web::Views
  module TimeDisplay
    def self.included(view)
      view.class_eval do
        # TODO - share code in a better way!
        # def active_by_date(link_date)
        #   link_date == date ? 'is-active' : 'is-inactive'
        # end
        def hours_minutes(minutes = 0)
          time = minutes >= 60 ? "#{minutes/60}h" : ''
          time += "#{minutes%60}min"
          time
        end
      end
    end
  end
end