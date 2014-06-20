require 'spec_helper'
require 'simplifying_conditional_expressions/introduce_gateway/company'

describe IntroduceExpressionBuilder::Company do
  context '#save' do

    let(:name) { 'company name' }
    let(:tax_id) { 'company tax id' }

    before do
      stub_request(:get, IntroduceExpressionBuilder::Company::COMPANY_URI).with(
        query: {
          name: name,
          tax_id: tax_id
        }
      )
    end

    subject {
      person = IntroduceExpressionBuilder::Company.new
      person.name = name
      person.tax_id = tax_id
      person.save
    }

    it { should be_truthy }

  end
end