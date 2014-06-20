require_relative 'domain_object'

module IntroduceExpressionBuilder
  class Laptop < DomainObject

    Laptop_URI = 'http://www.example.com/laptop_issue'

    attr_accessor :assigned_to, :serial_number

    def save
      http.post([:assigned_to, :serial_number]).with_authentication.to(Laptop_URI)
    end

  end
end
