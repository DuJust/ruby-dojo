require 'net/http'
require_relative 'gateway'

module IntroduceExpressionBuilder
  class GetGateway < Gateway

    def build_request
      attributes_array = attributes.collect do |attribute|
        "#{attribute}=#{subject.send attribute}"
      end

      Net::HTTP::Get.new(url.path + "?#{attributes_array.join('&')}")
    end
  end
end