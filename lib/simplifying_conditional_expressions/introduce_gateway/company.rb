require 'net/http'

module IntroduceGateway
  class Company

    COMPANY_URI = 'http://www.example.com/company'

    attr_accessor :name, :tax_id

    def save
      url = URI.parse(COMPANY_URI)
      request = Net::HTTP::Get.new(url.path + "?name=#{name}&tax_id=#{tax_id}")
      Net::HTTP.new(url.host, url.port).start { |http| http.request(request) }
    end
  end
end