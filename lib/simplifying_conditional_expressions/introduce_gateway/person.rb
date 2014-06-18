require 'net/http'

module IntroduceGateway
  class Person

    PERSON_URI = 'http://www.example.com/person'

    attr_accessor :first_name, :last_name, :ssn

    def save
      url = URI.parse(PERSON_URI)
      request = Net::HTTP::Post.new(url.path)
      request.set_form_data(
        first_name: first_name,
        last_name: last_name,
        ssn: ssn
      )
      Net::HTTP.new(url.host, url.port).start { |http| http.request(request) }
    end
  end
end