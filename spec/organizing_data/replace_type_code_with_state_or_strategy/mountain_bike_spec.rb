require 'spec_helper'
require 'organizing_data/replace_type_code_with_state_or_strategy/mountain_bike'

describe ReplaceTypeCodeWithStateOrStrategy::MountainBike do

  describe '#off_road_ability' do

    let(:tire_width) { 2 }
    let(:front_fork_travel) { 0 }
    let(:rear_fork_travel) { 0 }

    subject {
      ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(type_code: type_code,
                                                        tire_width: tire_width,
                                                        front_fork_travel: front_fork_travel,
                                                        rear_fork_travel: rear_fork_travel
      ).off_road_ability
    }

    context 'rigid' do
      let(:type_code) { :rigid }
      it { should eq(6) }
    end

    context 'front suspension' do
      let(:type_code) { :front_suspension }
      let(:front_fork_travel) { 3 }
      it { should eq(15) }
    end

    context 'full suspension' do
      let(:type_code) { :full_suspension }
      let(:front_fork_travel) { 3 }
      let(:rear_fork_travel) { 4 }
      it { should eq(27) }
    end

  end

  describe '#price' do

    let(:commission) { 0.5 }
    let(:base_price) { 200 }
    let(:front_suspension_price) { 0 }
    let(:rear_suspension_price) { 0 }
    subject {
      ReplaceTypeCodeWithStateOrStrategy::MountainBike.new(type_code: type_code,
                                                        commission: commission,
                                                        base_price: base_price,
                                                        front_suspension_price: front_suspension_price,
                                                        rear_suspension_price: rear_suspension_price
      ).price
    }

    context 'rigid' do
      let(:type_code) { :rigid }
      it { should eq(300) }
    end

    context 'front suspension' do
      let(:type_code) { :front_suspension }
      let(:front_suspension_price) { 200 }
      it { should eq(500) }
    end

    context 'rear suspension' do
      let(:type_code) { :full_suspension }
      let(:front_suspension_price) { 200 }
      let(:rear_suspension_price) { 200 }
      it { should eq(700) }
    end
  end

end