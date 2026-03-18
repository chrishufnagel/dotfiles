# CH dotfiles
Config type things.

## Manual setup steps
These things can't be automated by Stow and must be done manually on a fresh install:
1. Create ~/.config/git/local (see [Machine-specific Git config](#git-local-config))

## Managing Dotfiles with GNU Stow
This repo uses GNU Stow to manage dotfiles via symlinks. Each top-level directory is a "package" representing a single application or config group. Stow creates symlinks from these packages into your home directory, keeping the actual files version-controlled here while apps find them in their expected locations.

### Usage
```bash
# Clone the repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow a single package
stow ghostty

# Stow multiple packages at once
stow ghostty nvim tmux zsh hypr waybar fonts

# Remove symlinks for a package (files in repo untouched)
stow -D ghostty

# Preview what stow would do without actually doing it
stow --simulate ghostty
```

### Adding a new config
For example to add your git config:
```bash
# 1. Create the matching directory structure inside the repo
mkdir -p ~/dotfiles/git/.config/git

# 2. Move the existing config file into the repo
mv ~/.config/ghostty/config ~/dotfiles/ghostty/.config/ghostty/config

# 3. Navigate to the dotfiles directory
cd ~/dotfiles

# 4. Create the symlink
stow ghostty

# 5. Commit and push
git add ghostty
git commit -m "add ghostty config"
```
## Git Local Config
Personal details like name and email are not stored in this repo. Instead, git is configured to pull them from a local file that lives only on the machine.

After cloning and stowing, create this file manually: `~/.config/git/local`
```ini
[user]
  name = Your Name
  email = your@email.com
```
