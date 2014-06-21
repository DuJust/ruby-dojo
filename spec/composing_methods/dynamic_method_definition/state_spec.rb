require 'spec_helper'
require 'composing_methods/dynamic_method_definition/state'

describe ComposingMethods::DynamicMethodDefinition::State do

  context '#error' do
    subject {
      state = ComposingMethods::DynamicMethodDefinition::State.new
      state.error
      state
    }
    its(:state) { should eq(:error) }
  end

  context '#failure' do
    subject {
      state = ComposingMethods::DynamicMethodDefinition::State.new
      state.failure
      state
    }
    its(:state) { should eq(:failure) }
  end

  context '#success' do
    subject {
      state = ComposingMethods::DynamicMethodDefinition::State.new
      state.success
      state
    }
    its(:state) { should eq(:success) }
  end
end