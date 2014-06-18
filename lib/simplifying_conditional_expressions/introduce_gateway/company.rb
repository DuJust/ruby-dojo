require_relative 'gateway/get_gateway'

module IntroduceGateway
  class Company

    COMPANY_URI = 'http://www.example.com/company'

    attr_accessor :name, :tax_id

    def save
      GetGateway.save do |persist|
        persist.subject = self
        persist.attributes = [:name, :tax_id]
        persist.to = COMPANY_URI
      end
    end
  end
end