Gem::Specification.new do |s|
  s.name = %q{unlocalize}
  s.version = "0.1.0"

  s.authors = ["Paolo Dona"]
  s.summary = %q{Localized date/time and number parsing}
  s.description = %q{Unlocalize is a tool for parsing localized dates/times and numbers, based on the original delocalize by Clemens Kofler.}
  s.email = %q{paolo.dona@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "Gemfile",
    "MIT-LICENSE",
    "VERSION",
    "lib/unlocalize.rb",
    "lib/unlocalize/localized_date_time_parser.rb",
    "lib/unlocalize/localized_numeric_parser.rb",
    "lib/unlocalize/rails_ext/time_zone.rb",
    "lib/unlocalize/railtie.rb",
    "lib/unlocalize/ruby_ext.rb",
    "lib/unlocalize/ruby_ext/date.rb",
    "lib/unlocalize/ruby_ext/datetime.rb",
    "lib/unlocalize/ruby_ext/numeric.rb",
    "lib/unlocalize/ruby_ext/time.rb"
  ]
  s.homepage = %q{http://github.com/paolodona/unlocalize}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '>= 4.0.0'
end
