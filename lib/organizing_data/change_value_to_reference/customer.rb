module ChangeValueToReference
  class Customer

    attr_reader :name

    Instances = {}

    def self.with_name(name)
      Instances[name] ||= new(name)
    end

    private

    def initialize(name)
      @name = name
    end

  end
end
