require_relative 'mountain_bike'

module ReplaceTypeCodeWithExtractModule
  module FullSuspensionMountainBike

    def off_road_ability
      @tire_width * MountainBike::TIRE_WIDTH_FACTOR +
        @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR +
        @rear_fork_travel * MountainBike::REAR_SUSPENSION_FACTOR
    end

    def price
      (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
    end

  end
end