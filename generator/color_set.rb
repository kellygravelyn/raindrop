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
  def white; Color::WHITE; end
end

module EditorColorSet
  def background; Color::BACKGROUND; end
  def foreground; Color::FOREGROUND; end
  def cursor; Color::CURSOR; end
  def selection; Color::SELECTION; end
end
