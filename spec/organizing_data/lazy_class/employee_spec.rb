require 'spec_helper'
require 'organizing_data/lazy_class/employee'

describe LazyClass::Employee do

  describe '#email' do
    context 'get nil email' do
      let(:employee) { LazyClass::Employee.new(id: 1) }

      before do
        allow(LazyClass::EmployeeRepository).to receive(:find_email_by_id).with(1).and_return(nil)
        expect(LazyClass::EmployeeRepository).to receive(:find_email_by_id).with(1).exactly(2).times
      end

      subject {
        employee.email
        employee.email
      }

      it { should be_nil }
    end
  end
end