require_relative 'mountain_bike'

module ReplaceTypeCodeWithExtractModule
  module RigidMountainBike

    def off_road_ability
      @tire_width * MountainBike::TIRE_WIDTH_FACTOR
    end

    def price
      (1 + @commission) * @base_price
    end

  end
end