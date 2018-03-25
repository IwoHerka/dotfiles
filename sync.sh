read -p "This action will override all local changes. Proceed? [Y/n] " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo
fi

