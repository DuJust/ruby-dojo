require_relative 'domain_object'

module IntroduceExpressionBuilder
  class Person < DomainObject

    PERSON_URI = 'http://www.example.com/person'

    attr_accessor :first_name, :last_name, :ssn

    def save
      http.post([:first_name, :last_name, :ssn]).to(PERSON_URI)
    end

  end
end
