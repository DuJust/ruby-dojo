require 'organizing_data/change_value_to_reference/order'
require 'spec_helper'

describe ChangeValueToReference::Order do

  context 'order with customer name' do
    let(:customer) { ChangeValueToReference::Customer.new('customer') }
    subject { ChangeValueToReference::Order.new('customer').customer_name }

    it { should eq(customer.name) }
  end

end
