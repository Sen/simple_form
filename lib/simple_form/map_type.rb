module SimpleForm
  Mapping = Struct.new(:method, :collection, :options)

  module MapType
    def mappings
      @mappings ||= {}
    end

    def map_type(*types)
      options = types.extract_options!
      raise ArgumentError, "You need to give :to as option to map_type" unless options[:to]
      mapping = Mapping.new(options[:to], options[:collection] || false, options[:options] || false)
      types.each { |t| mappings[t] = mapping }
    end
  end
end