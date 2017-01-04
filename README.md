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

### cscope\_maps.vimrc

If VIM is compiled with cscope supporting, editor `~/.vim/bundle/cscope_maps/plugin/cscope_maps.vim`
and add following line before line 42 `cs add cscope.out`.

```
set nocscopeverbose
```
