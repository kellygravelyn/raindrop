class HyperGenerator
  include ErbGenerator
  include TerminalColorSet

  def name; 'hyper'; end
  def source_dir; __dir__; end
end
