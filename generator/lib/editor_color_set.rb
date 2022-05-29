require_relative 'color'

module EditorColorSet
  def background; Color::BACKGROUND; end
  def foreground; Color::FOREGROUND; end
  def cursor; Color::CURSOR; end
  def selection; Color::SELECTION; end
end
