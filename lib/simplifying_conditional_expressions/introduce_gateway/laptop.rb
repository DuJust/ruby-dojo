require 'net/http'

module IntroduceGateway
  class Laptop

    Laptop_URI = 'http://www.example.com/laptop_issue'

    attr_accessor :assigned_to, :serial_number

    def save
      url = URI.parse(Laptop_URI)
      request = Net::HTTP::Post.new(url.path)
      request.set_form_data(
        assigned_to: assigned_to,
        serial_number: serial_number
      )
      Net::HTTP.new(url.host, url.port).start { |http| http.request(request) }
    end
  end
end