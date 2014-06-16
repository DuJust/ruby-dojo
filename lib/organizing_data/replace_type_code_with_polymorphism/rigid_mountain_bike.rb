require_relative './mountain_bike'

module ReplaceTypeCodeWithPolymorphism
  class RigidMountainBike
    include MountainBike

    def off_road_ability
      @tire_width * TIRE_WIDTH_FACTOR
    end

    def price
      (1 + @commission) * @base_price
    end
  end
end