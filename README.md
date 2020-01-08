# vimrc
My .vimrc file, plus other directories and file-specific commands

To Set Up:

```
mkdir ~/.vim;

cd ~/.vim;

rm -rf * .*

git clone https://github.com/tuckerww/vimrc.git .

rm -f ~/.vimrc

ln -s ~/.vim/.vimrc ~/.vimrc

mkdir -p ~/.vim/bundle ~/.vim/backup ~/.vim/swap ~/.vim/undo ~/.vim/sessions

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
```
