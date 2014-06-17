require 'spec_helper'
require 'organizing_data/replace_type_code_with_extract_module/mountain_bike'

describe ReplaceTypeCodeWithExtractModule::MountainBike do

  describe '#off_road_ability' do

    let(:tire_width) { 2 }
    let(:front_fork_travel) { 0 }
    let(:rear_fork_travel) { 0 }

    let(:mountain_bike) {
      ReplaceTypeCodeWithExtractModule::MountainBike.new(
        tire_width: tire_width,
        front_fork_travel: front_fork_travel,
        rear_fork_travel: rear_fork_travel
      )
    }

    subject { mountain_bike.off_road_ability }

    context 'rigid' do
      before {
        mountain_bike.type_code = ReplaceTypeCodeWithExtractModule::RigidMountainBike
      }

      it { should eq(6) }
    end

    context 'front suspension' do
      let(:front_fork_travel) { 3 }
      before {
        mountain_bike.type_code = ReplaceTypeCodeWithExtractModule::FrontSuspensionMountainBike
      }
      it { should eq(15) }
    end

    context 'full suspension' do
      let(:front_fork_travel) { 3 }
      let(:rear_fork_travel) { 4 }
      before {
        mountain_bike.type_code = ReplaceTypeCodeWithExtractModule::FullSuspensionMountainBike
      }
      it { should eq(27) }
    end

  end

  describe '#price' do

    let(:front_suspension_price) { 0 }
    let(:rear_suspension_price) { 0 }
    let(:mountain_bike) {
      ReplaceTypeCodeWithExtractModule::MountainBike.new(
        commission: 0.5,
        base_price: 200,
        front_suspension_price: front_suspension_price,
        rear_suspension_price: rear_suspension_price
      )
    }

    subject { mountain_bike.price }

    context 'rigid' do
      before {
        mountain_bike.type_code = ReplaceTypeCodeWithExtractModule::RigidMountainBike
      }

      it { should eq(300) }
    end

    context 'front suspension' do
      let(:front_suspension_price) { 200 }
      before {
        mountain_bike.type_code = ReplaceTypeCodeWithExtractModule::FrontSuspensionMountainBike
      }

      it { should eq(500) }
    end

    context 'rear suspension' do
      let(:front_suspension_price) { 200 }
      let(:rear_suspension_price) { 200 }
      before {
        mountain_bike.type_code = ReplaceTypeCodeWithExtractModule::FullSuspensionMountainBike
      }

      it { should eq(700) }
    end
  end

end