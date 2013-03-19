module Base57
  
  SYMBOLS = "0123456789ABCDEFGHJKLMNPQRSTVWXYZabcdefghijkmnopqrstvwxyz"
  BASE = SYMBOLS.size
  
  # Converts the given value (specified by value and base) into a base57 value.
  #
  # @param Fixnum/Bignum/String value
  # @param Fixnum base
  #
  def self.encode(value, base = 10)
    if value.class == String
      base10_value = value.to_i(base)
    elsif value.class.superclass == Integer
      base10_value = value.to_i
    else
      raise ArgumentError, "invalid value (must be a base10 integer or" +
        " convertable to a base10 integer)"
    end
    
    base57_value = ""
    while base10_value >= BASE
      mod = base10_value % BASE
      base57_value = SYMBOLS[mod] + base57_value
      base10_value = (base10_value - mod) / BASE
    end
    SYMBOLS[base10_value] + base57_value
  end
  
end
