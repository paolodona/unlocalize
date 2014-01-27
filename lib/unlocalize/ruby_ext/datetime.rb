require 'unlocalize/localized_date_time_parser'

DateTime.class_eval do
  class << self
    def parse_localized(datetime)
      Unlocalize::LocalizedDateTimeParser.parse(datetime, self)
    end
  end
end
