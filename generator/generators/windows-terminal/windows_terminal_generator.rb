class WindowsTerminalGenerator
  include ErbGenerator
  include TerminalColorSet

  def name; 'windows-terminal'; end
  def source_dir; __dir__; end
end
