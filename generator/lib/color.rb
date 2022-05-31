require_relative 'color_component'

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

  # TODO: Better names for predefined colors would probably be good.
  PURPLE = Color.new('#c4b7d7')
  YELLOW = Color.new('#bca46d') # More of an orange but 🤷🏻‍♀️
  RED = Color.new('#cc5555')
  GREEN = Color.new('#65a34c')
  BLUE = Color.new('#5f7acc')
  CYAN = Color.new('#91cce0')
  SELECTION = Color.new('#c7e3ed')
  DARK_PURPLE = Color.new('#7f4f9b')
  DARK_GRAY_PURPLE = Color.new('#635c6d')
  FADED_NEARLY_WHITE = Color.new('#e7e7e7')
  NEARLY_WHITE = Color.new('#eeeeee')
  WHITE = Color.new('#f8f8f8')
  LIGHT_GRAY = Color.new('#b5b5b5')
  EXTRA_LIGHT_GRAY = Color.new('#dedddd')
  BLACK = Color.new('#222222')

  CURSOR = DARK_GRAY_PURPLE
  BACKGROUND = WHITE
  FOREGROUND = BLACK
end
