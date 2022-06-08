require_relative 'color'

module TerminalColorSet
  def background; Color::BACKGROUND; end
  def foreground; Color::FOREGROUND; end
  def cursor; Color::CURSOR; end
  def selection; Color::SELECTION; end
  def black; Color::BLACK; end
  def red; Color::RED; end
  def green; Color::GREEN; end
  def yellow; Color::YELLOW; end
  def blue; Color::BLUE; end
  def purple; Color::PURPLE; end
  def cyan; Color::CYAN; end

  # Yes this looks weird but we want the white ANSI color to not be the same
  # as our background or else it might not be visible without a different
  # background color (which we can't always trust apps to do).
  def white; Color::LIGHT_GRAY; end
end
