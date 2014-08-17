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
####7.add fonts for airline fancy
```
mkdir ~/.fonts
cp ~/.vim/fonts-for-airline/Inconsolata-dz-Powerline.otf ~/.fonts
fc-cache -vf
```
