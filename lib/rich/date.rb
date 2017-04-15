# safe date parsing - http://stackoverflow.com/questions/5782699/graceful-date-parsing-in-ruby
module Rich
  class Date
    def self.safe_parse(value, default = nil)
      ::Date.parse(value.to_s)
    rescue ArgumentError
      default
    end
  end
end
