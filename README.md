#my vimrc used in linux - ubuntu 13.10
## Install
### Linux
####1. backup your .vim and .vimrc
```
cp ~/.vimrc ~/.vim && mv ~/.vim ~/.vim_old
```
####2. git clone
```
git clone https://github.com/lawrenceding/vim.git ~/.vim
```
####3. create link to vimrc
```
ln -sfn ~/.vim/vimrc .vimrc
```
####4. install `Vundle`
```
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```
####5. install plugins with `Vundle`
Launch `vim`, run `:BundleInstall`

####6.install ctags
```
sudo apt-get install ctags
```

####7.install cscope
```
sudo apt-get install cscope
```
####8.add fonts for airline fancy
Got the powerline font from https://gist.github.com/qrush/1595572
and don't need to download manually, it's in the repository already.
```
mkdir ~/.fonts
cp ~/.vim/fonts-for-airline/Inconsolata-dz-Powerline.otf ~/.fonts
fc-cache -vf
```
####9.trouble shooting
a.If there is error occurs when use neocomplete, please check priviledge of
~/.cache/neocomplete, for my environment, it is: 
drwxr-xr-x  8 root root  4096  8月 21 13:51 neocomplete
change owner to your login user:
sudo chown -R xxx:xxx neocomplete
b.If the neocomplete can't work properly and it prompts that there is if_lua
issue, please install vim-gnome instead of vim
