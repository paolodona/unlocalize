module Unlocalize
  class Railtie < Rails::Railtie
    initializer "unlocalize" do |app|
      require 'unlocalize/rails_ext/time_zone'
    end
  end
end
