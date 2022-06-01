class VSCodeGenerator
  include Generator
  include EditorColorSet

  def name; 'vscode'; end

  def generate
    generate_package
    generate_color_theme
    generate_icon_theme
  end

  def generate_package
    data = {
      "name" => "raindrop",
      "displayName" => "Raindrop",
      "description" => "",
      "version" => "0.0.1",
      "engines" => {
        "vscode" => "^1.67.0"
      },
      "categories" => [
        "Themes"
      ],
      "contributes" => {
        "themes" => [
          {
            "id" => "raindrop-theme",
            "label" => "Raindrop",
            "uiTheme" => "vs",
            "path" => "./Raindrop-color-theme.json"
          }
        ],
        "iconThemes" => [
          {
            "id" => "raindrop-icons",
            "label" => "Raindrop FileIcons",
            "path" => "./Raindrop-icon-theme.json"
          }
        ]
      }
    }

    File.write(File.join(out_dir, "package.json"), JSON.pretty_generate(data))
  end

  def generate_color_theme
    color_theme = {
      "name" => "Raindrop",
      "semanticHighlighting" => true,
      "colors" => {
        "background" => background.to_s,
        "foreground" => foreground.to_s,
        "editor.background" => background.to_s,
        "editor.foreground" => foreground.to_s,
        "sideBar.background" => Color::EXTRA_LIGHT_GRAY.to_s,
        "sideBar.foreground" => foreground.to_s,
        "sideBarSectionHeader.foreground" => foreground.to_s,
        "sideBarSectionHeader.background" => Color::PURPLE.to_s,
        "list.activeSelectionForeground" => foreground.to_s,
        "list.activeSelectionBackground" => Color::PURPLE.to_s,
        "list.hoverBackground" => Color::FADED_NEARLY_WHITE.to_s,
        "list.highlightForeground" => foreground.to_s,
        "activityBar.background" => Color::EXTRA_LIGHT_GRAY.to_s,
        "activityBar.foreground" => foreground.to_s,
        "titleBar.activeBackground" => title_bar.to_s,
        "statusBar.background" => Color::PURPLE.to_s,
        "statusBar.foreground" => foreground.to_s,
        "statusBar.noFolderBackground" => Color::PURPLE.to_s,
        "statusBar.debuggingBackground" => Color::PURPLE.to_s,
        "statusBarItem.remoteBackground" => Color::PURPLE.to_s,
        "list.errorForeground" => Color::RED.to_s,
        "gitDecoration.modifiedResourceForeground" => foreground.to_s,
        "gitDecoration.untrackedResourceForeground" => foreground.to_s,
      },
      "tokenColors" => text_mate_scopes.map do |s|
        {
          "scope": s['scope'],
          "settings": {
            "foreground": s['foreground'].to_s,
          },
        }
      end
    }

    File.write(File.join(out_dir, "Raindrop-color-theme.json"), JSON.pretty_generate(color_theme))
  end

  def generate_icon_theme
    theme = {
      "iconDefinitions" => icons.map do |i|
        [
          i[:name],
          { 'iconPath' => i[:path] },
        ]
      end.to_h,
      "file" => "file_type_default",
      "fileExtensions" => {
        "gif" => "file_type_image",
        "bmp" => "file_type_image",
        "jpg" => "file_type_image",
        "jpeg" => "file_type_image",
        "png" => "file_type_image",
        "tsx" => "file_type_typescript",
      },
      "fileNames" => {
        "yarn.lock" => "file_type_yarn",
      },
      "languageIds" => {
        # Map all icons to language IDs assuming it's the end of file_type
        **icons.map {|i| [i[:type], i[:name]]}.to_h,

        # Some overrides are necessary
        "javascript" => "file_type_js",
      }
    }

    File.write(File.join(out_dir, "Raindrop-icon-theme.json"), JSON.pretty_generate(theme))
  end

  # These icons are from FileIcons which is for Sublime Text. I'm not going to
  # modify the file names for VS Code so we end up having to do a bit of
  # munging to make things work for us.
  def icons
    # If the set of icons changes, update this
    icon_files = [
      'file_type_access@3x.png',
      'file_type_actionscript@3x.png',
      'file_type_ae@3x.png',
      'file_type_ai@3x.png',
      'file_type_angular@3x.png',
      'file_type_applescript@3x.png',
      'file_type_archive@3x.png',
      'file_type_arduino@3x.png',
      'file_type_audio@3x.png',
      'file_type_babel@3x.png',
      'file_type_binary@3x.png',
      'file_type_blade@3x.png',
      'file_type_bower@3x.png',
      'file_type_c@3x.png',
      'file_type_cad@3x.png',
      'file_type_cf@3x.png',
      'file_type_circleci@3x.png',
      'file_type_clojure@3x.png',
      'file_type_cmake@3x.png',
      'file_type_coffeescript@3x.png',
      'file_type_composer@3x.png',
      'file_type_cpp@3x.png',
      'file_type_crystal@3x.png',
      'file_type_csharp@3x.png',
      'file_type_css@3x.png',
      'file_type_csv@3x.png',
      'file_type_dart@3x.png',
      'file_type_default@3x.png',
      'file_type_dlang@3x.png',
      'file_type_docker@3x.png',
      'file_type_dotnet@3x.png',
      'file_type_editorconfig@3x.png',
      'file_type_ejs@3x.png',
      'file_type_elm@3x.png',
      'file_type_erlang@3x.png',
      'file_type_eslint@3x.png',
      'file_type_ex@3x.png',
      'file_type_excel@3x.png',
      'file_type_fixedform@3x-fortran.png',
      'file_type_font@3x.png',
      'file_type_git@3x.png',
      'file_type_go@3x.png',
      'file_type_gradle@3x.png',
      'file_type_graphviz@3x.png',
      'file_type_groovy@3x.png',
      'file_type_gruntfile@3x.png',
      'file_type_gulpfile@3x.png',
      'file_type_haml@3x.png',
      'file_type_haskell@3x.png',
      'file_type_haxe@3x.png',
      'file_type_html@3x.png',
      'file_type_image@3x.png',
      'file_type_imageunsupported@3x.png',
      'file_type_indesign@3x.png',
      'file_type_java@3x.png',
      'file_type_js@3x.png',
      'file_type_json@3x.png',
      'file_type_jsp@3x.png',
      'file_type_jsx@3x.png',
      'file_type_julia@3x.png',
      'file_type_kotlin@3x.png',
      'file_type_less@3x.png',
      'file_type_license@3x.png',
      'file_type_liquid@3x.png',
      'file_type_lisp@3x.png',
      'file_type_lock@3x.png',
      'file_type_log@3x.png',
      'file_type_lsl@3x.png',
      'file_type_lua@3x.png',
      'file_type_markdown@3x.png',
      'file_type_markup@3x.png',
      'file_type_matlab@3x.png',
      'file_type_maya@3x.png',
      'file_type_mint@3x.png',
      'file_type_modern@3x-fortran.png',
      'file_type_mustache@3x.png',
      'file_type_nginx@3x.png',
      'file_type_nodejs@3x.png',
      'file_type_note@3x.png',
      'file_type_npm@3x.png',
      'file_type_nsis@3x.png',
      'file_type_ocaml@3x.png',
      'file_type_onenote@3x.png',
      'file_type_pcb@3x.png',
      'file_type_pdf@3x.png',
      'file_type_perl@3x.png',
      'file_type_php@3x.png',
      'file_type_plist@3x.png',
      'file_type_postcss@3x.png',
      'file_type_powerpoint@3x.png',
      'file_type_powershell@3x.png',
      'file_type_preferences@3x.png',
      'file_type_premiere@3x.png',
      'file_type_procfile@3x.png',
      'file_type_psd@3x.png',
      'file_type_pug@3x.png',
      'file_type_puppet@3x.png',
      'file_type_python@3x.png',
      'file_type_r@3x.png',
      'file_type_rails@3x.png',
      'file_type_riot@3x.png',
      'file_type_ruby@3x.png',
      'file_type_rust@3x.png',
      'file_type_sass@3x.png',
      'file_type_scala@3x.png',
      'file_type_scss@3x.png',
      'file_type_settings@3x.png',
      'file_type_shell@3x.png',
      'file_type_sketch@3x.png',
      'file_type_slim@3x.png',
      'file_type_source@3x.png',
      'file_type_sql@3x.png',
      'file_type_stata@3x.png',
      'file_type_stylelint@3x.png',
      'file_type_stylus@3x.png',
      'file_type_sublime@3x.png',
      'file_type_svelte@3x.png',
      'file_type_svg@3x.png',
      'file_type_swift@3x.png',
      'file_type_tcl@3x.png',
      'file_type_tern@3x.png',
      'file_type_terraform@3x.png',
      'file_type_tex@3x.png',
      'file_type_text@3x.png',
      'file_type_textile@3x.png',
      'file_type_todo@3x.png',
      'file_type_twig@3x.png',
      'file_type_typescript@3x.png',
      'file_type_video@3x.png',
      'file_type_vim@3x.png',
      'file_type_vue@3x.png',
      'file_type_webpack@3x.png',
      'file_type_windows@3x.png',
      'file_type_word@3x.png',
      'file_type_xml@3x.png',
      'file_type_yaml@3x.png',
      'file_type_yarn@3x.png',
    ]

    icon_files.map do |i|
      name = File.basename(i, '.png').gsub('@3x', '')

      {
        name: name,
        path: "icons/#{i}",
        type: name.gsub('file_type_', ''),
      }
    end
  end
end
