# Customized configuration for vim
#### Introduction
this configuration has two mode, the basic and the awesome. if your want to use a vim on a remote system and you don’t want to use any plugins, you can use the basic mode, and if you want to use vim on your develop system, the awesome config will suit you.
#### Install
- basic mode  
if you want to use the basic mode, just copy the basic.vim file to $HOME/.vim directory and add this line to your .vimrc file
```sh
source ~/.vim/basic.vim
```

- awesome mode  
if you want to use the awesome mode , then you must copy this three files to your $HOME/.vim directory.
```
basic.vim
plugin.vim
config.vim
awesome.vim
```
After doing that, you can add the following line to you .vimrc file.
```sh
source ~/.vim/awesome.vim
```

Other things you must to do is download the plugins which will be used in you vim config. you can follow this steps:
1. Set up Vundle  
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
2. launch vim and run ```:PluginInstall```  

Have fun!
