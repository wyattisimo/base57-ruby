module Base57

  NUMERIC   = "0123456789"
  ALPHA_LOW = "abcdefghijkmnopqrstvwxyz"
  ALPHA_CAP = "ABCDEFGHJKLMNPQRSTVWXYZ"

  DEFAULT_SYMBOL_COMPOSITION = NUMERIC + ALPHA_LOW + ALPHA_CAP

  # Converts the given value of the specified from_base into a new value of the specified to_base.
  #
  # @param [Integer or String] value
  # @param [Hash] opts: {
  #   [Integer] from_base
  #   [Integer] to_base
  #   [String]  composition
  # }
  #
  def self.encode(value, opts = {})
    opts        = { from_base: 10, to_base: 57, composition: DEFAULT_SYMBOL_COMPOSITION }.merge(opts)
    from_base   = opts[:from_base]
    to_base     = opts[:to_base]
    composition = opts[:composition]

    if from_base > composition.size
      raise ArgumentError, "invalid from_base: #{from_base} (must be between 0 and #{composition.size})"
    end
    if to_base > composition.size
      raise ArgumentError, "invalid to_base: #{to_base} (must be between 0 and #{composition.size})"
    end

    symbols = composition[0..to_base-1]

    base10_value = case value
    when Integer
      value
    when String
      i = value.length
      value.split("").inject(0) {|sum, d| sum + (composition.index(d) * (from_base ** (i -= 1))) }
    else
      raise ArgumentError, "invalid value (must be an integer)"
    end

    baseX_value = ""
    while base10_value >= to_base
      mod = base10_value % to_base
      baseX_value = symbols[mod] + baseX_value
      base10_value = (base10_value - mod) / to_base
    end
    symbols[base10_value] + baseX_value
  end

end
