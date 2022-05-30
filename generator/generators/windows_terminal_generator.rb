class WindowsTerminalGenerator
  include Generator
  include TerminalColorSet

  def name; 'windows-terminal'; end

  def generate
    color_scheme = {
      "name" => "Raindrop",
      "background" => background.to_s,
      "foreground" => foreground.to_s,
      "cursorColor" => cursor.to_s,
      "selectionBackground" => selection.to_s,

      "black" => black.to_s,
      "brightBlack" => black.to_s,
      "red" => red.to_s,
      "brightRed" => red.to_s,
      "green" => green.to_s,
      "brightGreen" => green.to_s,
      "yellow" => yellow.to_s,
      "brightYellow" => yellow.to_s,
      "blue" => blue.to_s,
      "brightBlue" => blue.to_s,
      "purple" => purple.to_s,
      "brightPurple" => purple.to_s,
      "cyan" => blue.to_s,
      "brightCyan" => blue.to_s,
      "white" => white.to_s,
      "brightWhite" => white.to_s,
    }

    File.write(File.join(out_dir, 'Raindrop.WindowsTerminal.json'), JSON.pretty_generate(color_scheme))
  end

end
