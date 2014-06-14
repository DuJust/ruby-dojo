require 'spec_helper'
require 'organizing_data/change_reference_to_value/currency'

describe ChangeReferenceToValue::Currency do

  context 'when currency with same code' do
    subject { ChangeReferenceToValue::Currency.new('USD') }
    it { should eq(ChangeReferenceToValue::Currency.new('USD')) }
  end

  context 'value object should support hash' do
    let(:usd_currency) { ChangeReferenceToValue::Currency.new('USD') }
    subject { {usd_currency => 'usd'}[usd_currency] }

    it { should eq('usd') }
  end

end