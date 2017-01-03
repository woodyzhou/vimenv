# My Own VIM Settings


## Install

### Clone from github

```
cd ~
git clone --recursive git@github.com:woodyzhou/vimenv.git
ln -s vimenv .vim
ln -s .vim/vimrc .vimrc
```

### Set dot files

Open `.vimrc`, and execute `:PluginInstall`

### Install VIMPROC

After `:PluginInstall` in `.vimrc`, following commands have to be executed to manually compile
vimproc.

```
cd ~/.vim/bundle/vimproc.vim
make
```
