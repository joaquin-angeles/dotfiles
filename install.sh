#!/bin/bash

# Define the dotfiles directory (change this if your dotfiles are elsewhere)
DOTFILES_DIR="$HOME/dotfiles"

# Customizing pacman
echo "Making pacman look flashy.."
sudo tee /etc/pacman.conf > /dev/null << 'EOF'
#
# /etc/pacman.conf
#
# See the pacman.conf(5) manpage for option and repository directives

#
# GENERAL OPTIONS
#
[options]
# The following paths are commented out with their default values listed.
# If you wish to use different paths, uncomment and update the paths.
#RootDir     = /
#DBPath      = /var/lib/pacman/
#CacheDir    = /var/cache/pacman/pkg/
#LogFile     = /var/log/pacman.log
#GPGDir      = /etc/pacman.d/gnupg/
#HookDir     = /etc/pacman.d/hooks/
HoldPkg     = pacman glibc
#XferCommand = /usr/bin/curl -L -C - -f -o %o %u
#XferCommand = /usr/bin/wget --passive-ftp -c -O %o %u
#CleanMethod = KeepInstalled
Architecture = auto

# Pacman won't upgrade packages listed in IgnorePkg and members of IgnoreGroup
#IgnorePkg   =
#IgnoreGroup =

#NoUpgrade   =
#NoExtract   =

# Misc options
#UseSyslog
ILoveCandy
Color
#NoProgressBar
CheckSpace
#VerbosePkgLists
#ParallelDownloads = 5
DownloadUser = alpm
#DisableSandbox

# By default, pacman accepts packages signed by keys that its local keyring
# trusts (see pacman-key and its man page), as well as unsigned packages.
SigLevel    = Required DatabaseOptional
LocalFileSigLevel = Optional
#RemoteFileSigLevel = Required

# NOTE: You must run `pacman-key --init` before first using pacman; the local
# keyring can then be populated with the keys of all official Arch Linux
# packagers with `pacman-key --populate archlinux`.

#
# REPOSITORIES
#   - can be defined here or included from another file
#   - pacman will search repositories in the order defined here
#   - local/custom mirrors can be added here or in separate files
#   - repositories listed first will take precedence when packages
#     have identical names, regardless of version number
#   - URLs will have $repo replaced by the name of the current repo
#   - URLs will have $arch replaced by the name of the architecture
#
# Repository entries are of the format:
#       [repo-name]
#       Server = ServerName
#       Include = IncludePath
#
# The header [repo-name] is crucial - it must be present and
# uncommented to enable the repo.
#

# The testing repositories are disabled by default. To enable, uncomment the
# repo name header and Include lines. You can add preferred servers immediately
# after the header, and they will be used before the default mirrors.

#[core-testing]
#Include = /etc/pacman.d/mirrorlist

[core]
Include = /etc/pacman.d/mirrorlist

#[extra-testing]
#Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

# If you want to run 32 bit applications on your x86_64 system,
# enable the multilib repositories as required here.

#[multilib-testing]
#Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist

# An example of a custom package repository.  See the pacman manpage for
# tips on creating your own repositories.
#[custom]
#SigLevel = Optional TrustAll
#Server = file:///home/custompkgs
EOF

# Install AUR helper..
echo "Installing AUR helper.."
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si
cd $DOTFILES_DIR

# Configuring paru
echo "Configuring paru.."
sudo tee /etc/paru.conf > /dev/null << 'EOF'
#
# $PARU_CONF
# /etc/paru.conf
# ~/.config/paru/paru.conf
#
# See the paru.conf(5) manpage for options

#
# GENERAL OPTIONS
#
[options]
SkipReview
PgpFetch
Devel
Provides
DevelSuffixes = -git -cvs -svn -bzr -darcs -always -hg -fossil
AurOnly
#BottomUp
#RemoveMake
#SudoLoop
#UseAsk
#SaveChanges
#CombinedUpgrade
#CleanAfter
#UpgradeMenu
#NewsOnUpgrade

#LocalRepo
#Chroot
#Sign
#SignDb
#KeepRepoCache

#
# Binary OPTIONS
#
#[bin]
#FileManager = vifm
#MFlags = --skippgpcheck
#Sudo = doas
EOF

# Install Zen Browser
paru -S zen-browser-bin

# Install zsh
echo "Installing zsh.."
sudo pacman -S zsh
chsh -s $(which zsh)

# Installing fonts..
echo "Installing fonts.."
sudo pacman -S inter-font ttf-jetbrains-mono-nerd

# Install required packages
echo "Installing required packages.. (MAKE SURE YOU ALREADY HAVE HYPRLAND INSTALLED)"
sudo pacman -S rofi-wayland waybar mako neovim qt5ct qt6ct nwg-look

# Backing up existing config files
echo "Backing up existing config files.."
mkdir -p .config.bak
cp -r ~/.config/* ~/.config.bak

# Removing config files
echo "Removing existing config files..."
rm -rf ~/.config/*

# Create symlinks for everything inside .config
echo "Creating symlinks for .config files..."
ln -sf $DOTFILES_DIR/.config/* ~/.config/

# Removing existing icon themes
echo "Removing existing icon themes.."
mkdir -p ~/.local/share/icons
rm -rf ~/.local/share/icons/*

# Adding icon themes
echo "Adding icon themes"
ln -sf $DOTFILES_DIR/.local/share/icons/* ~/.local/share/icons/

# Optional: Symlink other dotfiles
echo "Creating symlinks for other dotfiles..."
ln -sf $DOTFILES_DIR/.icons/* ~/.icons
mkdir -p .zsh
ln -sf $DOTFILES_DIR/.zsh/* ~/.zsh
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc

# Done
echo "Joaquin's dotfiles installed successfully!"
