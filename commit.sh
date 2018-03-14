git status > .tmp
cat .tmp | ./get_msg.py | git commit -aF -
rm .tmp
