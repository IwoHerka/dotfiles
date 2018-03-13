# Download .vimrc.
curl https://raw.githubusercontent.com/IwoHerka/vim/master/.vimrc > ~/.vimrc

# Setup pathogen.
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Setup commentary.
git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/commentary

# Setup airline.
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# Setup github color-scheme.
git clone https://github.com/endel/vim-github-colorscheme.git ~/.vim/bundle/github-scheme

# Remember to run :Helptags.
