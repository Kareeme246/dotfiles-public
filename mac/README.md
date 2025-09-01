-- Rough Draft 1 Feb. 28th 2025 --
# Reinstall Guide (MacOS X)

This guide outlines the steps for setting up a Macbook laptop for software development using brew package manager.

## 1. Initial Setup of MacOS

### Update All settings
- Check for updates and install if available.
- Change modifer keys
- Disable haptic feedback add tap to click and set touch to low

## 2. Install all apps

Install homebrew: https://brew.sh/
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Utility apps
- Raycast `brew install --cask raycast`
- Aerospace `brew install --cask nikitabobko/tap/aerospace`
- Clop `brew install --cask clop`
- The Unarchiver `brew install --cask the-unarchiver`
- AppCleaner `brew install --cask appcleaner`
- Jordanbird-Ice `brew install --cask jordanbaird-ice`

```bash
brew install --cask raycast
brew install --cask nikitabobko/tap/aerospace
brew install --cask clop
brew install --cask the-unarchiver
brew install --cask appcleaner
brew install --cask jordanbaird-ice
```

### User apps
- Zen Browser `brew install --cask zen-browser`
- Firefox Developer Browser `brew install --cask firefox@developer-edition`
- Google Chrome `brew install --cask google-chrome`
- WezTerm `brew install --cask wezterm`
- Sublime Text `brew install --cask sublime-text`
- Obsidian `brew install --cask obsidian`
- WeekToDo `brew install --cask weektodo`
- BitWarden `brew install --cask bitwarden`

```bash
brew install --cask zen-browser
brew install --cask firefox@developer-edition
brew install --cask google-chrome
brew install --cask wezterm
brew install --cask sublime-text
brew install --cask obsidian
brew install --cask weektodo
brew install --cask bitwarden
```

### Software Dev Specific
- Neovim `brew install neovim`
- Starship `brew install starship`
- Docker `brew install --cask docker`
- VSCode `brew install --cask visual-studio-code`
- Zed `brew install --cask zed`

```bash
brew install neovim
brew install starship
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask zed
```

### CLI Programs
- Delta Pager `brew install git-delta`
- Bat (better cat) `brew install bat`
- Deno `brew install deno`
- Pnpm `brew install pnpm`

```bash
brew install git-delta
brew install bat
brew install deno
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed
brew install fzf
brew install ripgrep 
brew install jq
brew install tree
```
Install Node version manager (For Mason to work when downloading lsps)
```bash
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.14.0".
nvm current # Should print "v22.14.0".

# Verify npm version:
npm -v # Should print "10.9.2".
```

## 3. Setup CLI (Zap zsh + Starship)

Download font: https://commitmono.com/
Download icon font: https://github.com/ya2s/nonicons/blob/master/dist/nonicons.ttf

- Zsh
Reference: https://www.zapzsh.com/ 
```bash
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```
Remove zsh-prompt plugin via `vim .zshrc` and run `zap clean`.

- Starship
Reference: https://starship.rs/guide/


## 4. SSH Keys + Dotfiles

Follow github instructions: [github docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

Then clone down dotfiles:
```bash
mkdir ~/Code
mkdir ~/Code/Projects
cd ~/Code/Projects
git clone git@github.com:Kareeme246/dotfiles.git
```

Link all the dotfiles to their appropriate spots. (I'll try to keep this as updated as possible but proofread and double check before executing anyways)

### Active use
```bash
ln -svi ~/Code/Projects/dotfiles/mac/aerospace ~/.config/aerospace # aerospace
ln -svi ~/Code/Projects/dotfiles/mac/borders ~/.config/borders # borders
ln -svi ~/Code/Projects/dotfiles/mac/nvim ~/.config/nvim # Neovim
ln -svi ~/Code/Projects/dotfiles/mac/sioyek ~/.config/sioyek # Sioyek
ln -svi ~/Code/Projects/dotfiles/mac/wezterm ~/.config/wezterm # Wezterm
ln -svi ~/Code/Projects/dotfiles/mac/ghostty ~/.config/ghostty # Ghostty
ln -svi ~/Code/Projects/dotfiles/mac/.gitconfig ~/.gitconfig # git
ln -svi ~/Code/Projects/dotfiles/mac/.zshrc ~/.zshrc # zsh
ln -svi ~/Code/Projects/dotfiles/mac/starship.toml ~/.config/starship.toml # starship
```

### Not currently using but created a config at some point
```bash
ln -svi " " " " # superfile
ln -svi " " " " # Svim
ln -svi " " " " # tmux
ln -svi " " " " # kanata
```
