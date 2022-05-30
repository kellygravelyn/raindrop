class ITerm2Generator
  include ErbGenerator
  include TerminalColorSet

  def name; 'iterm2'; end
  def source_dir; __dir__; end

  def ansi_colors
    [
      black,
      red,
      green,
      yellow,
      blue,
      purple,
      cyan,
      white,
      black,
      red,
      green,
      yellow,
      blue,
      purple,
      cyan,
      white,
    ]
  end
end
