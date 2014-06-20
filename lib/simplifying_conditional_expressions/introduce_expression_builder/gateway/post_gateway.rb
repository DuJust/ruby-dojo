require 'net/http'
require_relative 'gateway'

module IntroduceExpressionBuilder
  class PostGateway < Gateway

    def build_request
      request = Net::HTTP::Post.new(url.path)
      attributes_hash = attributes.inject({}) do |meta, attribute|
        meta[attribute] = subject.send(attribute)
        meta
      end
      request.set_form_data(attributes_hash)
      request
    end
  end
end