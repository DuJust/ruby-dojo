require 'spec_helper'
require 'organizing_data/replace_type_code_with_state_or_strategy/mountain_bike'

describe ReplaceTypeCodeWithStateOrStrategy::MountainBike do

  describe '#off_road_ability' do

    context 'rigid' do
      subject {
        ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(
          ReplaceTypeCodeWithStateOrStrategy::RigidMountainBike.new(
            tire_width: 2
          )).off_road_ability
      }
      it { should eq(6) }
    end

    context 'front suspension' do
      subject {
        ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(
          ReplaceTypeCodeWithStateOrStrategy::FrontSuspensionMountainBike.new(
            tire_width: 2,
            front_fork_travel: 3,
          )).off_road_ability
      }
      it { should eq(15) }
    end

    context 'full suspension' do
      subject {
        ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(
          ReplaceTypeCodeWithStateOrStrategy::FullSuspensionMountainBike.new(
            tire_width: 2,
            front_fork_travel: 3,
            rear_fork_travel: 4,
          )).off_road_ability
      }
      it { should eq(27) }
    end

  end

  describe '#price' do

    let(:commission) { 0.5 }
    let(:base_price) { 200 }

    context 'rigid' do
      subject {
        ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(
          ReplaceTypeCodeWithStateOrStrategy::RigidMountainBike.new(
            commission: commission,
            base_price: base_price
          )).price
      }
      it { should eq(300) }
    end

    context 'front suspension' do
      subject {
        ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(
          ReplaceTypeCodeWithStateOrStrategy::FrontSuspensionMountainBike.new(
            commission: commission,
            base_price: base_price,
            front_suspension_price: 200,
          )).price
      }
      it { should eq(500) }
    end

    context 'rear suspension' do
      subject {
        ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(
          ReplaceTypeCodeWithStateOrStrategy::FullSuspensionMountainBike.new(
            commission: commission,
            base_price: base_price,
            front_suspension_price: 200,
            rear_suspension_price: 200
          )).price
      }
      it { should eq(700) }
    end
  end

end