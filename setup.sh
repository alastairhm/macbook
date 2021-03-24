#!/bin/bash

#Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo 'Please install Homebrew by running the following command: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
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

#Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "ZSH_THEME="powerlevel9k/powerlevel9k" >> ~/.zshrc

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

echo "Dont forget to manually edit ~/.zshrc and comment out ZSH_THEME=robbierussell, i havent figured out the sed command yet to automate this part"





