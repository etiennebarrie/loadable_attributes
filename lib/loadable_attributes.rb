module LoadableAttributes
  VERSION = "0.1.0"

  def attr_loadable(*attrs)
    attrs.each do |attr|
      ivar = "@#{attr}"
      define_method(attr) do
        unless loaded?
          load!
        end
        instance_variable_get ivar
      end
    end
    include InstanceMethods
  end

  module InstanceMethods
    def load!
      load
      @loaded = true
    end

    def loaded?
      @loaded || false
    end
  end
end
