let g:python3_host_prog = '/usr/local/bin/python3'

if &compatible
    set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("~/.vim/bundles/repos")
    call dein#begin("~/.vim/bundles/repos")

    call dein#add("~/.vim/bundles/repos/github.com/Shougo/dein.vim")
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('junegunn/gv.vim')
    call dein#add('NLKNguyen/papercolor-theme')
    call dein#add('majutsushi/tagbar')
    call dein#add('vim-syntastic/syntastic')
    call dein#add('tpope/vim-surround')
    call dein#add('itchyny/lightline.vim')
    call dein#add('ap/vim-buftabline')
    " call dein#add('vim-airline/vim-airline')
    call dein#add('tpope/vim-sensible')
    call dein#add('bkad/CamelCaseMotion')
    call dein#add('tpope/vim-endwise')
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('milch/vim-fastlane')
    call dein#add('mileszs/ack.vim')
    call dein#add('solarnz/thrift.vim')
    call dein#add('tpope/vim-rhubarb')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('tpope/vim-commentary')
    call dein#add('justinmk/vim-sneak')
    call dein#add('qpkorr/vim-bufkill')
    call dein#add('dracula/vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tomlion/vim-solidity')
    call dein#add('jiangmiao/auto-pairs')

    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    " If you want to install not installed plugins on startup.
    if dein#check_install()
        call dein#install()
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
syntax enable

let g:nerdtree_tabs_open_on_console_startup=0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png     " Linux/MacOSX

" set guifont=Monaco:h12

" VIM shows line numbers
set number

" VIM set some padding between the gutter and text
set foldcolumn=2

" VIM set no wrap
set nowrap

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_ignore_case = 1
set completeopt+=noinsert

" CamcelCaseMotion mapping
call camelcasemotion#CreateMotionMappings('<leader>')

set exrc    " Load local vimrc if found

set hlsearch " highlight search results
set cursorline " highlight current line

set hidden " allow switching buffers without the need to save changes, also it keeps undo history after switching buffers
" quickly switch between buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" smart-case and case-insensitive for searching and replacing
set ignorecase
set smartcase

" faster updates
set updatetime=100

" change shape of cursors for different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Default color scheme & font
" set t_Co=256   " This is may or may not needed.
set termguicolors
set background=dark
colorscheme dracula

" fzh
nmap <c-b> :Buffers<CR>
nmap <c-t> :Files<CR>
nmap <c-f> :Ag <C-r><C-w>
nnoremap <c-s> :%s/\<<C-r><C-w>\>/

autocmd! BufNewFile,BufRead *.vsh,*.fsh set ft=glsl

let g:sneak#label = 1

" swap files are just annoying
set noswapfile

" use Ag for Ack
let g:ackprg = 'ag --vimgrep'

" hold Ctrl + hjkl to switch between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" I hate tabs. Use spaces!
highlight TabBol guibg=black
match TabBol /^\t\+/

let java_highlight_functions = 1
