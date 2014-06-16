class Module
  def deprecate(method_name, &block)
    module_eval <<-END
      alias_method :deprecate_#{method_name}, :#{method_name}

      def #{method_name}(*args, &block)
        $stdout.puts "Warning: calling deprecated method #{self}.#{method_name}."
        deprecate_#{method_name}
      end
    END
  end
end