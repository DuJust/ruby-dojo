require 'net/http'
require_relative 'get_gateway'
require_relative 'post_gateway'

module IntroduceExpressionBuilder
  class GatewayExpressionBuilder

    attr_accessor :subject

    def initialize(subject)
      @subject = subject
    end

    def get(attributes)
      @attributes = attributes
      @gateway = GetGateway
      self
    end

    def post(attributes)
      @attributes = attributes
      @gateway = PostGateway
      self
    end

    def with_authentication
      @authentication = true
      self
    end

    def to(address)
      @gateway.save do |persist|
        persist.subject = @subject
        persist.attributes = @attributes
        persist.authenticate = @authentication
        persist.to = address
      end
    end
  end
end