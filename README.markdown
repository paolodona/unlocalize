unlocalize
==========

unlocalize provides localized date/time and number parsing functionality for Rails.
this is a rip-off of delocalize: for the original source see: https://github.com/clemens/delocalize 

Installation
------------

### Rails 4

To use delocalize, put the following gem requirement in your `Gemfile`:

```ruby
gem "unlocalize"
```

What does it do? And how do I use it?
--------------------------------------

Unlocalize adds `parse_localized` methods to parse dates and numbers in different locales:

```ruby
I18n.with_locale('en-US') do
  Date.parse('01/25/2014')           #=> ArgumentError: invalid date
  Date.parse_localized('01/25/2014') #=> Sat, 25 Jan 2014
end

I18n.with_locale('it') do
  Numeric.parse_localized('10.000,50') #=> "10000.50"
end

I18n.with_locale('en') do
  Numeric.parse_localized('10,000.50') #=> "10000.50"
end
```

all you need is your regular translation data (as YAML or Ruby file) where you need Rails' standard translations:

```yml
de:
  number:
    format:
      separator: ','
      delimiter: '.'
  date:
    input:
      formats: [:default, :long, :short] # <- this and ...

    formats:
      default: "%d.%m.%Y"
      short: "%e. %b"
      long: "%e. %B %Y"
      only_day: "%e"

    day_names: [Sonntag, Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag]
    abbr_day_names: [So, Mo, Di, Mi, Do, Fr, Sa]
    month_names: [~, Januar, Februar, März, April, Mai, Juni, Juli, August, September, Oktober, November, Dezember]
    abbr_month_names: [~, Jan, Feb, Mär, Apr, Mai, Jun, Jul, Aug, Sep, Okt, Nov, Dez]
    order: [ :day, :month, :year ]

  time:
    input:
      formats: [:long, :medium, :short, :default, :time] # <- ... this are the only non-standard keys
    formats:
      default: "%A, %e. %B %Y, %H:%M Uhr"
      short: "%e. %B, %H:%M Uhr"
      long: "%A, %e. %B %Y, %H:%M Uhr"
      time: "%H:%M"

    am: "vormittags"
    pm: "nachmittags"
```

For dates and times, you have to define input formats which are taken from the actual formats. The important thing here is to define input formats sorted by descending complexity; in other words: the format which contains the most (preferably non-numeric) information should be first in the list because it can produce the most reliable match. Exception: If you think there most complex format is not the one that most users will input, you can put the most-used in front so you save unnecessary iterations.

Careful with formats containing only numbers: It's very hard to produce reliable matches if you provide multiple strictly numeric formats!


Un-localize parameters
----------------------

```ruby
class ApplicationController < ActionController::Base
  unlocalize /.*date/ => :date,
             /.*time/ => :time, 
             /.*amount/ => :numeric
end
```

This automatically unlocalize any parameters matching the regexps, eg:
