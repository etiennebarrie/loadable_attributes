module LoadableAttributes
  VERSION = "0.1.0"

  def attr_loadable(*attrs)
    attrs.each do |attr|
      ivar = "@#{attr}"
      define_method(attr) do
        load!
        instance_variable_get ivar
      end
    end
    include InstanceMethods
  end

  module InstanceMethods
    def load!
      unless loaded?
        load
        @loaded = true
      else
        false
      end
    end

    def loaded?
      @loaded || false
    end
  end
end
