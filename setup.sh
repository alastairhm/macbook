#!/bin/bash

#Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users\/$USER/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    brew update
fi

#Install required packages
brew install wget
brew install grep
brew install git
brew install --cask iterm2
brew install --cask slack
brew install --cask zoom
brew install --cask discord
brew install zsh zsh-completions
brew install zsh-syntax-highlighting

#Install fonts 
cd ~

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

#Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "ZSH_THEME='powerlevel9k/powerlevel9k'" >> ~/.zshrc



echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs) \n
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time) \n
POWERLEVEL9K_PROMPT_ON_NEWLINE=true \n 
# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f" \n 
plugins=( \n
    git \n
    zsh-autosuggestions \n
) \n  
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true \n 
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=’red’ \n 
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \n 
" >> ~/.zshrc






