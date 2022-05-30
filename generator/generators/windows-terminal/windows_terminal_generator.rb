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

      "black" => Color::BLACK.to_s,
      "brightBlack" => Color::BLACK.to_s,
      "red" => Color::RED.to_s,
      "brightRed" => Color::RED.to_s,
      "green" => Color::GREEN.to_s,
      "brightGreen" => Color::GREEN.to_s,
      "yellow" => Color::YELLOW.to_s,
      "brightYellow" => Color::YELLOW.to_s,
      "blue" => Color::BLUE.to_s,
      "brightBlue" => Color::BLUE.to_s,
      "purple" => Color::PURPLE.to_s,
      "brightPurple" => Color::PURPLE.to_s,
      "cyan" => Color::BLUE.to_s,
      "brightCyan" => Color::BLUE.to_s,
      "white" => Color::WHITE.to_s,
      "brightWhite" => Color::WHITE.to_s,
    }

    File.write(File.join(out_dir, 'Raindrop.WindowsTerminal.json'), JSON.pretty_generate(color_scheme))
  end

end
