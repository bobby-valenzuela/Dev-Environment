# Installing

Install on a debian-based system
```bash
sh -c "$(wget https://raw.githubusercontent.com/bobby-valenzuela/Dev-Environment/refs/heads/main/init.sh -O -)"
```

<br />

Create a Docker container running Ubuntu Jammy jellyfish (v22) and execute install script
```bash
sh -c "$(wget https://raw.githubusercontent.com/bobby-valenzuela/Dev-Environment/refs/heads/main/jammy_init.sh -O -)"
```

<br />

<br />

<br />

If you already have the repo cloned you can copy the config files to your home directory
```bash
sh ./install.sh
```

<br />

If you wish to also install any necessary packages
```bash
sh ./install.sh install
```

<br />

## Notes
`install.sh` - Assumes the repo is cloned and copies the config files into the proper dirs. Run with "install" to install needed packages from apt.  
`init.sh` - Clones repo and runs `install.sh install`  
`jammy_init.sh` - Sets up Docker container and runs `init.sh`  
