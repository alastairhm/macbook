#!/bin/bash

#Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users\/$USER/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    brew update
fi

sudo chown -R $(whoami) /opt/homebrew

#Install required packages for new mac install - remove as required if you dont need them
brew install wget
brew install grep
brew install git
brew install --cask iterm2
brew install --cask slack
brew install --cask zoom
brew install --cask discord
brew install --cask whatsapp
brew install --cask cyberduck
brew install --cask skype
brew install --cask wirehsark
brew install --cask firefox
brew install --cask signal
brew install --cask surfshark
brew install --cask viscosity
brew install zsh zsh-completions
brew install zsh-syntax-highlighting
brew install authy
brew install teamviewer
brew install bitwarden
brew install spectacle
brew install htop


#Install fonts 
cd ~

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

#Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

cat <<EOF>> ~/.zshrc
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=’red’
plugins=(
    git
    zsh-autosuggestions
)
ZSH_THEME='powerlevel9k/powerlevel9k'
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF


