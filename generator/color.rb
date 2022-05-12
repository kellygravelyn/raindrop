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

class Color
  def initialize(hex)
    @hex = hex
  end

  def to_s
    @hex
  end

  def red
    ColorComponent.new(@hex[1..2])
  end

  def green
    ColorComponent.new(@hex[3..4])
  end

  def blue
    ColorComponent.new(@hex[5..6])
  end
end
