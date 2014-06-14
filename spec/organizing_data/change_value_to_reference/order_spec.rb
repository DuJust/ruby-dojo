require 'organizing_data/change_value_to_reference/order'
require 'spec_helper'

describe ChangeValueToReference::Order do

  let(:customer) { ChangeValueToReference::Customer.new('customer') }
  subject { ChangeValueToReference::Order.new('customer') }

  its(:customer_name) { should eq(customer.name) }

end
