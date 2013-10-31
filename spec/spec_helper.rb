$LOAD_PATH << File.dirname(__FILE__) + '/..'

require 'coveralls'
Coveralls.wear!

require 'rspec'
require 'bogus/rspec'
require 'bbq/spawn'
require 'bundler/bower'
require 'fileutils'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Bogus.configure do |c|
  c.search_modules << BowerRails
end
