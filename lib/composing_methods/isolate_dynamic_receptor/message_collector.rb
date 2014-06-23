module IsolateDynamicReceptor
  class MessageCollector
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
  end
end
