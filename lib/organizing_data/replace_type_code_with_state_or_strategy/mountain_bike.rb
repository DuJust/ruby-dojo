require_relative 'rigid_mountain_bike'
require_relative 'front_suspension_mountain_bike'
require_relative 'full_suspension_mountain_bike'

module ReplaceTypeCodeWithStateOrStrategy
  class MountainBike

    TIRE_WIDTH_FACTOR = 3
    FRONT_SUSPENSION_FACTOR = 3
    REAR_SUSPENSION_FACTOR = 3

    def initialize(mountain_bike)
      @mountain_bike = mountain_bike
    end

    def off_road_ability
      @mountain_bike.off_road_ability
    end

    def price
      @mountain_bike.price
    end
  end
end