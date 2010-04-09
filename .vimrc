" Autoreload .vimrc
autocmd! bufwritepost .vimrc source %

" Vim configs
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set autoindent
set smartindent
set nocompatible
set guioptions-=T
set noerrorbells
set visualbell
set vb t_vb=
set showcmd
set ruler
set nohls
set incsearch
set virtualedit=all
set foldmethod=marker
" set foldclose=all
set nomodeline
set nowrap
set noea " keep buffers the same size when buffers are closed
"set equalalways " i.e. make buffers equal all the time
set ff=unix

" Pressing Shift-< or Shift-> will let you indent/unident selected lines,
" allow it to occur multiple times in visual mode
vnoremap < <gv
vnoremap > >gv

colorscheme kellys

filetype plugin on
filetype indent on
filetype on

" taglist.vim plugin
let Tlist_Process_File_Always = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1
nnoremap <silent> <Space>t :TlistToggle<CR>

" Omnicomplete code complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Remove trailing white space
autocmd BufRead * silent! %s/[\r \t]\+$//
autocmd BufEnter *.php :%s/[ \t\r]\+$//e

" Show trailing white space
set list
set listchars=tab:>-,trail:-

" Always put status line at the 2nd to last line
set laststatus=2

" Modifying status line look
set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%)

" Play nice with SuperTab.vim
let g:SuperTabDefaultCompletionType="context"

" Err, backup files locations
set backup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/temp

" Autocompletion for commands
set wildmenu
set wildmode=list:longest,full
set ruler
set lazyredraw
set backspace=2

" FuzzyFinder
"nnoremap <silent> <Space>fc :FufMruCmd<CR>
"nnoremap <silent> <C-]> :FufTag! <C-r>=expand('<cword>')<CR><CR>

nnoremap <silent> <Space>ff :FuzzyFinderTextMate<CR>

" Project plugin
" nmap <silent> <Space>P <Plug>ToggleProject
nmap <silent> <Leader>P <Plug>ToggleProject
