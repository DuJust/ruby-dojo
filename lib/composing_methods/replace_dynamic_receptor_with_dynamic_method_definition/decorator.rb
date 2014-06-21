module ReplaceDynamicReceptorWithDynamicMethodDefinition
  class Decorator
    def initialize(subject)
      subject.public_methods.each do |method_name|
        eigenclass = class << self; self; end
        eigenclass.send(:define_method, method_name) do |*args|
          subject.send(method_name, *args)
        end
      end
    end
  end
end
