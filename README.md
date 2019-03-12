vimrc
=====

My simple vim setup. I use [vimrc](http://vimr.org/) to run it smoothly in Mac OSX

# [Make neovim read vim config](https://neovim.io/doc/user/nvim.html#nvim-from-vim)

Transitioning from Vim				*nvim-from-vim*

1. To start the transition, create your |init.vim| (user config) file:

    :call mkdir(stdpath('config'), 'p')
    :exe 'edit '.stdpath('config').'/init.vim'

2. Add these contents to the file:

    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

3. Restart Nvim, your existing Vim config will be loaded.

# Install [dein.vim](https://github.com/Shougo/dein.vim)

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
```

Run inside vim/nvim:
> :call dein#install()

