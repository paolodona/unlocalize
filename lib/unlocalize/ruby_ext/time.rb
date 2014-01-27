require 'unlocalize/localized_date_time_parser'

Time.class_eval do
  class << self
    def parse_localized(time)
      Unlocalize::LocalizedDateTimeParser.parse(time, self)
    end
  end
end
