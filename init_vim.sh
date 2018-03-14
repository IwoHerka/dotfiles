# Download .vimrc.
curl https://raw.githubusercontent.com/IwoHerka/vim/master/.vimrc > ~/.vimrc

# Setup pathogen.
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

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

# Remember to run :Helptags.
