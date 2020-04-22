if [ -d ~/bin ]; then
    PATH=~/bin:$PATH
fi
if [ -d ~/.local/bin ]; then
    PATH=~/.local/bin:$PATH
fi
