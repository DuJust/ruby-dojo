module ReplaceTypeCodeWithPolymorphism
  module MountainBike

    TIRE_WIDTH_FACTOR = 3
    FRONT_SUSPENSION_FACTOR = 3
    REAR_SUSPENSION_FACTOR = 3

    def initialize(params)
      params.each { |key, value| instance_variable_set "@#{key}", value }
    end

  end
end