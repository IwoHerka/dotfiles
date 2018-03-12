# Download .vimrc.
curl https://raw.githubusercontent.com/IwoHerka/vim/master/.vimrc > ~/.vimrc

# Setup pathogen.
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Setup commentary.
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-commentary.git
cd ~

