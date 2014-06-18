require 'net/http'
require_relative 'gateway/post_gateway'

module IntroduceGateway
  class Laptop

    Laptop_URI = 'http://www.example.com/laptop_issue'

    attr_accessor :assigned_to, :serial_number

    def save
      PostGateway.save do |persist|
        persist.subject = self
        persist.attributes = [:assigned_to, :serial_number]
        persist.authenticate = true
        persist.to = Laptop_URI
      end
    end
  end
end