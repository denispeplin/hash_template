class HashTemplate
  attr_reader :mapping, :data

  def initialize(mapping)
    @mapping = mapping
  end

  def map(data)
    @data = data
    deep_map mapping
  end

  private

  def deep_map(mapping)
    mapping.each_with_object({}) do |(key, value), result|
      case value
      when Symbol
        result[key] = data[value]
      when String
        result[key] = analyze_string(value)
      when Hash
        result[key] = deep_map(value)
      when Array
        result[key] = value.map { |hash| deep_map hash }
      end
    end
  end

  def analyze_string(value)
    if value.start_with?('!')
      !data[value[1..-1].to_sym]
    else
      data[value.to_sym]
    end
  end
end
