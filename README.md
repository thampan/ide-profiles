# vim-plugins
Here you can find a set of vim-plugins that
would help you to convert your vim into an IDE
This is a collection of several plugins
available in github.

### files
+ `plugins.conf`
Contains all the necessary plugins to be configured
Here you can add the plugins which you want.
Use # at the beginning of the plugin name if you don't
want to use a plugin
+ `vimrc_settings.conf`
Contains all the necessary settings for your vimrc
Add your custom settings here

### scripts
`scripts/install.sh` installs the configured plugins
and vimrc settings
###### Note
The script flushes your vimrc and configures with the
settings provided in the `vimrc_settings.conf` file.
Make sure you take a backup or append the existing settings
to the `vimrc_settings.conf` file.

