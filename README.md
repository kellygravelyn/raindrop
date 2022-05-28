# 💧 Raindrop

A calm light color theme, inspired by VS Code's "Quiet Light" and [Witch Hazel](http://witchhazel.thea.codes).

Icons from [FileIcons](https://github.com/braver/FileIcons).


## Usage

I personally love symlinking as most tools will automatically reload on changes but you can copy if you don't want to keep the repo around. In the snippets below I've shown `ln -s` for symlinking; just replace `ln -s` with `cp -r` to copy instead.

Note the commands below are for macOS. Linux you probably have to look in `~/.config` for where to move these. On Windows lots of these things I believe are stored in `%AppData%`.

### Hyper

```sh
ln -s $(PWD)/hyper ~/.hyper_plugins/local/hyper-raindrop
```

### Sublime Text

```sh
ln -s $(PWD)/hyper "~/Library/Application Support/Sublime Text 3/Packages/User/raindrop"
```

### VS Code

```sh
ln -s $(PWD)/vscode "~/.vscode/extensions/raindrop"
```

### iTerm 2

As far as I can tell you have to manually set the colors. Open up Preferences and go to the Profiles tab at the top and then the Colors tab inside there. Use the dropdown in the bottom right corner to Import the theme. Then click on it to apply it.

Note if you re-import you'll get the color theme listed twice. You can use the dropdown to Delete Preset to remove the presets before importing again.

### Windows Terminal

It's been a while but last time I did this you had to manually splice the JSON file from here into the main settings JSON file. It's... not ideal. Maybe it's been improved since then though! I don't use Windows too often.
