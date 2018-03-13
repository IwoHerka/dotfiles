mkdir tmpfonts

if [ -d "~/.fonts" ]; then
    mkdir .fonts
fi

curl -SL https://www.github.com/belluzj/fantasque-sans/releases/download/v1.7.2/FantasqueSansMono-LargeLineHeight-NoLoopK.tar.gz | tar -xzv -C tmpfonts

mv tmpfonts/TTF/* .fonts
rm -rf tmpfonts
