class ITerm2Generator
  include ErbGenerator
  include TerminalColorSet

  def name; 'iterm2'; end
  def source_dir; __dir__; end
end
