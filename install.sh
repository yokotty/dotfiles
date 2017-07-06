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

if ! [ -e dotfiles/.zshenv ]; then
  cp dotfiles/.zshenv_base ~/dotfiles/.zshenv
fi

# set symlink
ln -snf dotfiles/.gitignore_global ~/.
ln -snf dotfiles/.gitconfig ~/.
ln -snf dotfiles/.zshrc ~/.
ln -snf dotfiles/.zprofile ~/.
ln -snf dotfiles/.zshenv ~/.
ln -snf dotfiles/.brewfile/Brewfile ~/.

# brew
brew update
brew bundle

# switch shell
if [ $(echo $SHELL) != '/bin/zsh' ] ; then
  chsh -s /bin/zsh
fi

# init
git config --global core.excludesfile ~/.gitignore_global
