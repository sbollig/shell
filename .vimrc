" Scott's VIM config File .vimrc
"
" Maintainer:   Scott Bollig sbollig@gmail.com	
" Last change:	Mon Jun 18 20:38:40 PDT 2012
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
au BufWritePre /tmp/* setlocal noundofile
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif 
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  "set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" start of Scott config
" set configuraiton
set number              " line numbering
" set search
set incsearch		" do incremental searching
"et hlsearch
" set tabs
set softtabstop=4 shiftwidth=4 ts=4
set expandtab       "Convert all tabs typed to spaces
set shiftround      "Indent/outdent to nearest tabstop
set smartindent     "do cleaver autoindenting
set copyindent      "Copy whitespace for indenting from previous line
set wm=0            "Margin from the right in which to break a line.
set textwidth=78    "Wrap at this column
set matchpairs+=<:> "Allow % to bounce between angles too
set nojoinspaces
"set list
" map configuration
map :q :confirm q
noremap % v%  
" map w to only timestamp if there are updates on a write.
map :w :up
" Getting out of insert mode 
imap ;; <Esc>   
" Getting out of insert mode for just ONE command
imap :: <C-O>

" insert text configuration
iab phdr #! /usr/bin/perl 
iab pwrn use warnings;
iab pstr use strict;
iab pv510 use v5.10;
iab pv514 use v5.14;
iab sabmail sbollig@gmail.com
iab sabname Scott A. Bollig
" dictionary 
set dictionary+=/usr/share/dict/words

" autocomplete plugin
set nocp
filetype plugin on
" autocommands for header
"utocomd bufnewfile *.pl /home/sbollig/bin/pl_header.txt
" Smart indentations to perform multiple indentations after selecting 
" a Block
:vnoremap < <gv
:vnoremap > >gv
"perl doc when entering K on a keyword
:set keywordprg=perldoc\ -f
"set the statusline
:set statusline=Filename:%F\ Line:\ %l\ Col:\ %c\ %P\ %y\ %M\ gU 
:set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=darkgray;
   au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
:highlight CursorLine term=bold cterm=bold ctermbg=darkgray
:set cursorline  
"Keep Unfo for old sessions
if has('persistent_undo') 
    set undodir=$HOME/tmp/.VIM_UNDO_FILES
    set undolevels=5000
    set undofile
endif
"Number Formats to not use Octor Formats for incrementing
set nrformats=
"change upppercase letter to uppercase word
map gU gUaw
map gu guaw
"END
