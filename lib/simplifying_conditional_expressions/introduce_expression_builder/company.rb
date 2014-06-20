require_relative 'domain_object'

module IntroduceExpressionBuilder
  class Company < DomainObject

    COMPANY_URI = 'http://www.example.com/company'

    attr_accessor :name, :tax_id

    def save
      http.get([:name, :tax_id]).to(COMPANY_URI)
    end

  end
end
