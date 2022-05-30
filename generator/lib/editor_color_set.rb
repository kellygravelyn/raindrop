require_relative 'color'

module EditorColorSet
  def background; Color::BACKGROUND; end
  def foreground; Color::FOREGROUND; end
  def cursor; Color::CURSOR; end
  def selection; Color::SELECTION; end

  def title_bar; Color::PURPLE; end

  def text_mate_scopes
    [
      {
        "scope" => "comment",
        "foreground" => Color::PURPLE,
      },
      {
        "scope" => [
          "keyword",
          "storage",
          "support.type.stdint",
          "punctuation.separator.inheritance.ruby",
        ].join(', '),
        "foreground" => Color::BLUE,
      },
      {
        "scope" => [
          "entity.other.inherited-class",
          "entity.name.tag",
          "entity.name.class"
        ].join(', '),
        "foreground" => Color::DARK_PURPLE,
      },
      {
        "scope" => "string",
        "foreground" => Color::GREEN,
      },
      {
        "scope" => "constant.numeric",
        "foreground" => Color::YELLOW,
      },
      {
        "scope" => "invalid",
        "foreground" => Color::RED,
      },
    ]
  end
end
