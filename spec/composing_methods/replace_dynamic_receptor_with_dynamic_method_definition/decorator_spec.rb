require 'spec_helper'
require 'composing_methods/replace_dynamic_receptor_with_dynamic_method_definition/decorator'

class Component
  def operate
    'Component operating'
  end
end

describe ReplaceDynamicReceptorWithDynamicMethodDefinition::Decorator do
  context 'decorate' do

    let(:component) { Component.new }
    subject {
      decorator = ReplaceDynamicReceptorWithDynamicMethodDefinition::Decorator.new(component)
      decorator.operate
    }

    it { should eq(component.operate) }
  end
end