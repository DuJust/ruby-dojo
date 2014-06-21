module ComposingMethods
  module ClassAnnotation
    class State

      attr_accessor :state

      def self.states(*args)
        args.each do |arg|
          define_method(arg) do
            self.state = arg
          end
        end
      end

      states :error, :failure, :success

    end
  end
end