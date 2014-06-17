require 'spec_helper'
require 'organizing_data/replace_type_code_with_polymorphism/mountain_bike'

describe ReplaceTypeCodeWithPolymorphism::MountainBike do

  describe '#off_road_ability' do

    context 'rigid' do
      subject {
        ReplaceTypeCodeWithPolymorphism::RigidMountainBike.new(
          type_code: :rigid,
          tire_width: 2,
        ).off_road_ability
      }

      it { should eq(6) }
    end

    context 'front suspension' do
      subject {
        ReplaceTypeCodeWithPolymorphism::FrontSuspensionMountainBike.new(
          type_code: :front_suspension,
          tire_width: 2,
          front_fork_travel: 3
        ).off_road_ability
      }

      it { should eq(15) }
    end

    context 'full suspension' do
      subject {
        ReplaceTypeCodeWithPolymorphism::FullSuspensionMountainBike.new(
          type_code: :full_suspension,
          tire_width: 2,
          front_fork_travel: 3,
          rear_fork_travel: 4
        ).off_road_ability
      }

      it { should eq(27) }
    end

  end

  describe '#price' do

    context 'rigid' do
      subject {
        ReplaceTypeCodeWithPolymorphism::RigidMountainBike.new(
          type_code: :rigid,
          commission: 0.5,
          base_price: 200,
        ).price
      }

      it { should eq(300) }
    end

    context 'front suspension' do
      subject {
        ReplaceTypeCodeWithPolymorphism::FrontSuspensionMountainBike.new(
          type_code: :front_suspension,
          commission: 0.5,
          base_price: 200,
          front_suspension_price: 200,
        ).price
      }

      it { should eq(500) }
    end

    context 'rear suspension' do
      subject {
        ReplaceTypeCodeWithPolymorphism::FullSuspensionMountainBike.new(
          type_code: :full_suspension,
          commission: 0.5,
          base_price: 200,
          front_suspension_price: 200,
          rear_suspension_price: 200
        ).price
      }

      it { should eq(700) }
    end
  end

end