require 'rspec/core'
require 'rspec/its'

Dir['./lib/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end

