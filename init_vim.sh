# Download .vimrc.
curl https://raw.githubusercontent.com/IwoHerka/vim/master/.vimrc > ~/.vimrc

# Setup pathogen.
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Setup commentary.
git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/commentary

# Setup airline.
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# Remember to run :Helptags
