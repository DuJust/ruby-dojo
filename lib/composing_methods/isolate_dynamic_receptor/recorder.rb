module IsolateDynamicReceptor
  class Recorder
    instance_methods.each do |method|
      undef_method method unless method =~ /^(__|inspect)/
    end

    def messages
      @messages ||= []
    end

    def method_missing(sym, *args)
      messages << [sym, args]
      self
    end

    def play_for(subject)
      messages.inject(subject) do |result, message|
        result.send message.first, message.last
      end
    end

    def to_s
      messages.inject([]) do |result, message|
        result << "#{message.first}(args: #{message.last.inspect})"
      end.join('.')
    end
  end
end
