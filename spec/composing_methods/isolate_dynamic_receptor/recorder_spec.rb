require 'spec_helper'
require 'composing_methods/isolate_dynamic_receptor/recorder'

class CommandCenter
  def start(command_str)
    self
  end

  def stop(command_str)
    self
  end
end

describe IsolateDynamicReceptor::Recorder do

  context '#play_for' do
    subject {
      recordor = IsolateDynamicReceptor::Recorder.new
      recordor.start('recorder start')
      recordor.stop('recorder stop')
      recordor.play_for(CommandCenter.new)
      recordor.to_s
    }

    it { should eq('start(args: ["recorder start"]).stop(args: ["recorder stop"])') }
  end
end