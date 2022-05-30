require 'json'

class SublimeTextGenerator
  include Generator
  include EditorColorSet

  def name; 'sublime-text'; end

  def generate
    out_dir = File.join(ROOT_DIR, 'sublime-text')

    color_scheme = {
      'name' => 'Raindrop Color Scheme',
      'globals' => {
        'background' => background.to_s,
        'foreground' => foreground.to_s,
        'caret' => cursor.to_s,
        'selection' => selection.to_s,
      },
      'rules' => text_mate_scopes.map do |s|
        {
          'scope' => s['scope'],
          'foreground' => s['foreground'].to_s,
        }
      end
    }

    File.write(File.join(out_dir, 'Raindrop.sublime-color-scheme'), JSON.pretty_generate(color_scheme))

    theme = {
      'extends' => 'Adaptive.sublime-theme',
      'variables' => {},
      'rules' => [
        {
          'class' => 'title_bar',
          'bg' => title_bar.to_s,
        },
        {
          'class' => 'sidebar_heading',
          'font.size' => 14,
        },
        {
          'class' => 'sidebar_label',
          'font.size' => 14,
        },
        {
          'class' => 'file_system_entry',
          'spacing' => 6,
        },
        {
          'class' => 'icon_file_type',
          'layer0.tint' => [255, 255, 255],
          'layer0.opacity' => 1.0,
          'content_margin' => [8, 8]
        },
      ]
    }

    File.write(File.join(out_dir, 'Raindrop.sublime-theme'), JSON.pretty_generate(theme))
  end
end
