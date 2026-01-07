# Dotfiles Installer

This folder contains the installation script for this dotfiles repository.

The installer is designed to be **safe, reversible, and non-destructive**.  
It does **not** install packages or modify system settings.

---

## What `install.sh` Does

The script performs the following actions:

- Creates symbolic links from this repository into:
  - `$HOME`
  - `$HOME/.config`
- Automatically **backs up any existing files** before linking
- Uses **timestamped backups** for safety
- Skips missing or optional components without failing
- Never deletes user data
- Never requires `sudo`

All backups are stored in:

