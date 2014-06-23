require_relative 'message_collector'

module IsolateDynamicReceptor
  class Recorder

    def record
      @message_collector ||= MessageCollector.new
    end

    def play_for(subject)
      record.messages.inject(subject) do |result, message|
        result.send message.first, message.last
      end
    end

    def to_s
      record.messages.inject([]) do |result, message|
        result << "#{message.first}(args: #{message.last.inspect})"
      end.join('.')
    end
  end
end
