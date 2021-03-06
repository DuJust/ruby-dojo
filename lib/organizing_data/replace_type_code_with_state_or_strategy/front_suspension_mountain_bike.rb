module ReplaceTypeCodeWithStateOrStrategy
  class FrontSuspensionMountainBike

    def initialize(params)
      @tire_width = params[:tire_width]
      @front_fork_travel = params[:front_fork_travel]
      @commission = params[:commission]
      @base_price = params[:base_price]
      @front_suspension_price = params[:front_suspension_price]
    end

    def off_road_ability
      @tire_width * MountainBike::TIRE_WIDTH_FACTOR +
        @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR
    end

    def price
      (1 + @commission) * @base_price +
        @front_suspension_price
    end
  end
end