require 'unlocalize/ruby_ext'
require 'unlocalize/localized_date_time_parser'

if defined?(Rails::Railtie)
  require 'unlocalize/railtie'
  require 'unlocalize/unlocalize_params'
elsif defined?(Rails::Initializer)
  raise "This version of unlocalize is only compatible with Rails 3.0 or newer"
end
