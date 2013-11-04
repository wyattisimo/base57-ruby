module Base57
  
  SYMBOLS = "0123456789abcdefghijkmnopqrstvwxyzABCDEFGHJKLMNPQRSTVWXYZ"
  BASE = SYMBOLS.size
  
  # Converts the given value (specified by value and base) into a base57 value.
  #
  # @param [Integer or String] value
  # @param [Fixnum] base
  #
  def self.encode(value, base = 10)
    base10_value = case value
    when Integer
      value.to_i
    when String
      value.to_i(base)
    else
      raise ArgumentError, 'invalid value (must be an integer)'
    end
    
    base57_value = ''
    while base10_value >= BASE
      mod = base10_value % BASE
      base57_value = SYMBOLS[mod] + base57_value
      base10_value = (base10_value - mod) / BASE
    end
    SYMBOLS[base10_value] + base57_value
  end
  
end
