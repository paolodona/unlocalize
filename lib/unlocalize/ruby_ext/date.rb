require 'unlocalize/localized_date_time_parser'

Date.class_eval do
  class << self
    def parse_localized(date)
      Unlocalize::LocalizedDateTimeParser.parse(date, self)
    end
  end
end
