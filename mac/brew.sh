#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# CASK DOES NOT WORK ON LINUX

# Turn off analytics
brew analytics off

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
# BREW_PREFIX=$(brew --prefix)

# [[ Utility Apps ]]
brew install --cask raycast
brew install --cask nikitabobko/tap/aerospace
brew install --cask clop
brew install --cask the-unarchiver
brew install --cask appcleaner
brew install --cask jordanbaird-ice

# [[ User apps ]]
brew install --cask zen-browser
brew install --cask firefox@developer-edition
brew install --cask google-chrome
brew install --cask wezterm
brew install --cask sublime-text
brew install --cask obsidian
brew install --cask weektodo
brew install --cask bitwarden
brew install --cask zed
brew install --cask visual-studio-code
brew install --cask docker

# [[ Software Dev tools ]]
brew install neovim
brew install starship
brew install deno


# [[ CLI Utilities ]]
brew install coreutils
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
# brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
brew install fzf
brew install ripgrep             # ripgrep recursively searches directories for a regex pattern
# [[ Shell ]]
brew install starship
# [[ Development ]]
brew install neovim
brew install tmux
# brew install git
# brew install --cask miniconda # Miniconda python environment manager
# [[ Install GnuPG to enable PGP-signing commits. ]]
# brew install gnupg
# [[ Other ]]
brew install jq
brew install tree
brew install git-delta
brew install bat
# brew install ansible
# brew install --cask ngrok # ngrok secure introspectable tunnels to localhost
# brew install --cask packetsender
# brew install kubectl                        # kubernetes cli
# brew install c-bata/kube-prompt/kube-prompt # kubectl prompt
# brew install kubectx                        # faster way to switch between clusters and namespaces
# brew install --cask lens                    # A Kubernetes IDE
# brew install k9s                            # Kubernetes CLI To Manage Your Clusters In Style!
# brew install ack
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
# brew install ssh-copy-id
# brew install vbindiff
# brew install zopfli
# brew install watch
# brew install wrk
# brew install sslscan
# brew install peco
# brew install gs

# [[ General Programs ]]
brew install --cask google-chrome
brew install --cask anki
brew install --cask obsidian
brew install --cask weektodo
brew install --cask mathpix-snipping-tool
brew install --cask slack
brew install --cask microsoft-teams
brew install --cask discord
brew install --cask microsoft-word
brew install --cask microsoft-powerpoint
brew install --cask microsoft-excel
# brew install --cask zoom
brew install --cask clickup

# [[ Dev Programs ]]
brew install --cask wezterm
brew install --cask docker
brew install --cask jetbrains-toolbox
# brew install --cask miniconda
# brew install --cask figma
# brew install --cask wireshark


# Remove outdated versions from the cellar.
brew cleanup


