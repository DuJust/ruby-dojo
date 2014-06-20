require 'net/http'

module IntroduceExpressionBuilder
  class Gateway

    attr_accessor :subject, :attributes, :to, :authenticate

    def self.save
      gateway = self.new
      yield gateway
      gateway.execute
    end

    def execute
      request= build_request
      request.basic_auth('user', 'pass') if authenticate
      Net::HTTP.new(url.host, url.port).start do |http|
        http.request(request)
      end
    end

    def url
      @url ||= URI.parse(to)
    end
  end
end