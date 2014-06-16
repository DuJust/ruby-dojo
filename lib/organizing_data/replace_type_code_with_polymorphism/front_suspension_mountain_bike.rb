require_relative './mountain_bike'

module ReplaceTypeCodeWithPolymorphism
  class FrontSuspensionMountainBike
    include MountainBike

    def off_road_ability
      @tire_width * TIRE_WIDTH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR
    end

    def price
      (1 + @commission) * @base_price + @front_suspension_price
    end
  end
end