I have lots already set up in my terminal:
- Ohmyzsh (zsh theming and plugins)
- nvim
- updates to my $PATH
- Utillity bash functions
- Tmux conguration
- Yazi configuration
- zsh configuration
- Spotify-tmux integration
- etc

Instead of re-configuring everything all over from scrath on a new system, I've created a script to install the necessary packages and copy the relevant config files so I can get my workflow up an running on any (ubuntu) system with a single command.

<br />

# Installing

__Full Installation__: Install all in ubuntu system _(installs packages and copies config files)_
```bash
sh -c "$(wget https://raw.githubusercontent.com/bobby-valenzuela/Dev-Environment/refs/heads/main/init.sh -O -)"
```

<br />

<br />

__Package Installation__: Install programs in ubuntu system _(installs packages only)_
```bash
sh -c "$(wget https://raw.githubusercontent.com/bobby-valenzuela/Dev-Environment/refs/heads/main/init_installonly.sh -O -)"
```

<br />

<br />

__Config installation__: Install config files in ubuntu system _(config files only - includes nvim)_
```bash
sh -c "$(wget https://raw.githubusercontent.com/bobby-valenzuela/Dev-Environment/refs/heads/main/init_configonly.sh -O -)"
```
<br />

<br />

__Nvim-only installation__: Install config files in ubuntu system _(nvim files only)_
```bash
sh -c "$(wget https://raw.githubusercontent.com/bobby-valenzuela/Dev-Environment/refs/heads/main/init_configonly.sh -O -)"
```
<br />

<br />



__Docker VM__:Create a Docker container running Ubuntu Jammy jellyfish (v22)  
```bash
sh -c "$(wget https://raw.githubusercontent.com/bobby-valenzuela/Dev-Environment/refs/heads/main/jammy_init.sh -O -)"
```

<br />

<br />

<br />

## Notes
`install.sh` - Assumes the repo is cloned and installs packages. 
- Run with no arguments to install packages
- Run with "full" to install packages and copy the config files into the proper dirs.
- Run with with "configonly" to skip packages installation step and only copy config files to $HOME.

<br />

`init.sh` - Clones repo and runs `install.sh` (installing both packages and config files)  
`jammy_init.sh` - Sets up Docker container and runs `init.sh`  
