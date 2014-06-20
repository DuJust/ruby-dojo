require 'net/http'
require_relative 'gateway/post_gateway'

module IntroduceExpressionBuilder
  class Person

    PERSON_URI = 'http://www.example.com/person'

    attr_accessor :first_name, :last_name, :ssn

    def save
      PostGateway.save do |persist|
        persist.subject = self
        persist.attributes = [:first_name, :last_name, :ssn]
        persist.to = PERSON_URI
      end
    end
  end
end
