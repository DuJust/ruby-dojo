require 'spec_helper'
require 'simplifying_conditional_expressions/introduce_gateway/person'

describe IntroduceExpressionBuilder::Person do
  context '#save' do

    let(:first_name) { 'person first name' }
    let(:last_name) { 'person last name' }
    let(:ssn) { 'person social security name' }

    before do
      stub_request(:post, IntroduceExpressionBuilder::Person::PERSON_URI).with(
        body: {
          first_name: first_name,
          last_name: last_name,
          ssn: ssn
        }
      )
    end

    subject {
      person = IntroduceExpressionBuilder::Person.new
      person.first_name = first_name
      person.last_name = last_name
      person.ssn = ssn
      person.save
    }

    it { should be_truthy }

  end
end