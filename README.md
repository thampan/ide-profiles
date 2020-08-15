# vim-plugins
Here you can find a set of vim-plugins that would help you convert your vim
editor into an IDE. This is a collection of several plugins available in
github.

## Plugin-options
Some of the plugins come with additonal options. This section will be
updated soon with those options. However you could still use the plugins as
most of them work without custom options.

## Installation
Please read the Note provided at the bottom.
Run `scripts/install.sh`
The plugins are not installed if already present.

### files
+ `plugins.conf`
Contains all the necessary plugins to be configured Here you can add the
plugins which you want. Use # at the beginning of the plugin name if you
don't want to use a plugin.
+ `vimrc_settings.conf`
Contains all the necessary settings for your vimrc.Add your custom settings
here.

### scripts
`scripts/install.sh` installs the configured plugins and vimrc settings.

###### Note
The script flushes your `~/.vimrc` and configures your `~/.vimrc` with the
settings provided in the `vimrc_settings.conf` file. Make sure you take a
backup or append the existing settings to the `files/vimrc_settings.conf` file.

