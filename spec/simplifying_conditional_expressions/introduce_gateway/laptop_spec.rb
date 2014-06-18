require 'spec_helper'
require 'simplifying_conditional_expressions/introduce_gateway/laptop'

describe IntroduceGateway::Laptop do
  context '#save' do

    let(:assigned_to) { 'laptop assigned to' }
    let(:serial_number) { 'laptop serial number' }

    before do
      stub_request(:post, 'http://user:pass@www.example.com/laptop_issue').with(
        body: {
          assigned_to: assigned_to,
          serial_number: serial_number
        }
      )
    end

    subject {
      laptop = IntroduceGateway::Laptop.new
      laptop.assigned_to = assigned_to
      laptop.serial_number = serial_number
      laptop.save
    }

    it { should be_truthy }

  end
end