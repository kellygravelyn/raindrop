class VSCodeGenerator
  include ErbGenerator
  include EditorColorSet

  def name; 'vscode'; end
  def source_dir; __dir__; end
end
