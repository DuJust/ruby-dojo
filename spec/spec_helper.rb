require 'rspec/core'
require 'rspec/its'
require 'webmock/rspec'

Dir['./lib/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end

