require 'unlocalize/ruby_ext'
require 'unlocalize/localized_date_time_parser'
require 'unlocalize/unlocalize_params'

if defined?(Rails::Railtie)
  require 'unlocalize/railtie'
elsif defined?(Rails::Initializer)
  raise "This version of unlocalize is only compatible with Rails 3.0 or newer"
end
