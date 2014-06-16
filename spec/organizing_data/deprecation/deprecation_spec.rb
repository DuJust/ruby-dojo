require 'spec_helper'
require 'organizing_data/deprecation/deprecation'

class Foo
  def foo
    'In the foo method.'
  end

  deprecate :foo
end

describe 'Deprecation' do
  subject { Foo.new.foo }

  context '#deprecate' do
    it 'should include warning for deprecated method' do
      expect { subject }.to output("Warning: calling deprecated method Foo.foo.\n").to_stdout
    end
  end
end
