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
    call dein#add('OmniSharp/omnisharp-vim')
    call dein#add('tpope/vim-dispatch')
    call dein#add('tomlion/vim-solidity')
    call dein#add('moll/vim-node')

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

let g:nerdtree_tabs_open_on_console_startup=1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png     " Linux/MacOSX

" set guifont=Monaco:h13

" VIM shows line numbers
set number

" VIM set some padding between the gutter and text
set foldcolumn=2

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" let g:syntastic_mode_map = {
"     \ "mode": "passive",
"     \ "active_filetypes": ["lua"],
"     \ "passive_filetypes": [] }
let g:syntastic_solidity_checkers = ['solium']

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
" highlight TabBol guibg=black
" match TabBol /^\t\+/

let java_highlight_functions = 1

" OmniSharp
filetype plugin on
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
"
"
" line wrap
set wrap
set linebreak
set nolist  " list disables linebreak
