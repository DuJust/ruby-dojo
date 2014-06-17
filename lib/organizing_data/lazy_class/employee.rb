require_relative 'employee_repository'

module LazyClass
  class Employee

    attr_accessor :id

    def initialize(options)
      self.id = options[:id]
    end

    def email
      EmployeeRepository.find_email_by_id(id)
    end

  end
end