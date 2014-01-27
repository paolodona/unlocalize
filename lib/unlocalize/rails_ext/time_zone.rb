require 'active_support'
require 'active_support/time_with_zone'
require 'unlocalize/localized_date_time_parser'
ActiveSupport::TimeZone.class_eval do
  def parse_localized(time_with_zone)
    Delocalize::LocalizedDateTimeParser.parse(time_with_zone, self.class)
  end
end
