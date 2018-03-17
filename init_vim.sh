# This script is used to initialize Vim from scratch.
# If present, local .vimrc and bundles will be used. Alternatively,
# config and packages will be downloaded from github repositories.
# Remember to run :Helptags after initial setup.

# .vimrc.
if [ -e .vimrc ]; then
    cp .vimrc $HOME/.vimrc
else
    curl https://raw.githubusercontent.com/IwoHerka/dotfiles/master/.vimrc \
        > $HOME/.vimrc
fi

if [ ! -d $HOME/.vim ]; then
    mkdir $HOME/.vim
fi

# pathogen's autoload.
if [ ! -d $HOME/.vim/autoload ]; then
    # Setup pathogen.
    mkdir $HOME/.vim/autoload
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Packages.
if [ -d ./bundle ]; then
    cp -rf ./bundle $HOME/.vim
else
    # Setup commentary.
    git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/commentary

    # Setup airline.
    git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

    # Setup solarized airline.
    git clone https://github.com/vim-airline/vim-airline-themes \
        ~/.vim/bundle/vim-airline-themes

    # Setup solarized scheme.
    git clone git://github.com/altercation/vim-colors-solarized.git \
        ~/.vim/bundle/solarized

    # Setup nerdtree.
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

    # Setup smooth-scroll.
    git clone https://github.com/terryma/vim-smooth-scroll.git \
        ~/.vim/bundle/smooth-scroll

    # Vimroom
    git clone https://github.com/mikewest/vimroom.git ~/.vim/bundle/vimroom
fi
