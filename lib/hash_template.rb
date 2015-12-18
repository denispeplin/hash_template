class HashTemplate
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def map(mapping)
    mapping.each_with_object({}) do |(key, value), result|
      case value
      when Symbol
        result[key] = data[value]
      when String
        result[key] = analyze_strings(value)
      when Hash
        result[key] = map(value)
      when Array
        result[key] = value.map { |hash| map hash }
      end
    end
  end

  private

  def analyze_strings(value)
    if value.start_with?('!')
      !data[value[1..-1].to_sym]
    else
      data[value.to_sym]
    end
  end
end
