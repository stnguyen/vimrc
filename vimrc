"Filetype
set filetype=on
filetype plugin on
filetype indent on
syntax on           " syntax highlighing

"Visual
if has("gui_running")
  " See ~/.gvimrc
  set guifont=Monaco:h13  " use this font 
  set lines=50       " height = 50 lines
  set columns=100        " width = 100 columns
  colorscheme solarized    " use this color scheme
else

  colorscheme desert    " use this color scheme
endif
set background=dark

" Keyboard mappings
map <F1> :previous<CR>  " map F1 to open previous buffer
map <F2> :next<CR>      " map F2 to open next buffer
map <silent> <C-N> :silent noh<CR> " turn off highlighted search
map ,u :source ~/.vimrc<cr> " update the system settings from my vimrc file

"Indentation
set ai
set ts=2
set sts=2
set et
set sw=2
set textwidth=80

"Misc
set ls=2            " allways show status line
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching 
"set noignorecase   " don't ignore case
set title           " show title in console title bar
set ttyfast         " smoother changes
"set ttyscroll=0        " turn off scrolling, didn't work well with PuTTY
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
"set viminfo='20,<50,s10,h

"set autoindent     " always set autoindenting on
"set smartindent        " smart indent
"set cindent            " cindent
set noautoindent
set nosmartindent
set nocindent

"Map NERDTree to \p
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Keyboard mapping for numeric keypad
imap <Esc>OM <c-m>
map <Esc>OM <c-m>
imap <Esc>OP <nop>
map <Esc>OP <nop>
imap <Esc>OQ /
map <Esc>OQ /
imap <Esc>OR *
map <Esc>OR *
imap <Esc>OS -
map <Esc>OS -

imap <Esc>Ol +
imap <Esc>Om -
imap <Esc>On ,
imap <Esc>Op 0
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Oz 0

"Pathogen
call pathogen#infect()
