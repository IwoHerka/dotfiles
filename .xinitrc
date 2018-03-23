export TERM=xterm-256color
setxkbmap -option caps:escape

if [ -e "~/.Xmodmap" ]; then
    xmodmap ~/.Xmodmap
else
    echo ".Xmodmap not found; skipping."
fi

if [ -e "~/.init_git.sh" ]; then
    source ~/.init_git.sh
else
    echo ".init_git.sh not found; skipping."
fi
