class ColorComponent
  def initialize(hex)
    @value = Integer('0x' + hex)
  end

  def to_s
    @value.to_s
  end

  def to_i
    @value
  end

  def to_f
    @value / 255.0
  end
end
