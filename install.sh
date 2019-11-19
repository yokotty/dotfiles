cd ~

# install Command Line Tools
if ! type xcode-select >/dev/null 2>&1; then
  xcode-select --install
fi

# install Homebrew
if ! type brew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap Homebrew/bundle
fi

if ! [ -e dotfiles/zshenv ]; then
  cp dotfiles/zshenv_base ~/dotfiles/zshenv
fi

# set symlink
ln -snf dotfiles/gitconfig ~/.gitconfig
ln -snf dotfiles/gitignore_global ~/.gitignore_global
ln -snf dotfiles/zshrc ~/.zshrc
ln -snf dotfiles/zprofile ~/.zprofile
ln -snf dotfiles/zshenv ~/.zshenv
ln -snf dotfiles/Brewfile ~/Brewfile
ln -snf dotfiles/bundle ~/.bundle
ln -snf dotfiles/karabiner ~/.config/karabiner

# brew
brew update
brew bundle
brew link mysql@5.7 --force

# switch shell
if [ $(echo $SHELL) != '/bin/zsh' ] ; then
  chsh -s /bin/zsh
fi

# Ricty
if ! ls ~/Library/Fonts/Ricty*.ttf > /dev/null 2>&1; then
   cp -f /usr/local/Cellar/ricty/4.1.0_2/share/fonts/Ricty*.ttf ~/Library/Fonts/
   fc-cache -vf
fi
