# install Command Line Tools
if ! type xcode-select >/dev/null 2>&1; then
  xcode-select --install
fi

# install Homebrew
if ! type brew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap Homebrew/bundle
fi

# set symlink
ln -snf ~/dotfiles/.gitignore ~/.
ln -snf ~/dotfiles/.gitconfig ~/.
ln -snf ~/dotfiles/.zshrc ~/.
ln -snf ~/dotfiles/.brewfile/Brewfile ~/.

# brew
brew update
brew bundle

# switch shell
chsh -s /usr/local/bin/zsh
