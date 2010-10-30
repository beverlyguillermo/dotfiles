" Autoreload .vimrc
autocmd! bufwritepost .vimrc source %

" Vim configs
syntax on
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
" set linespace=1 " line height
set expandtab
set showmatch
set autoindent
" set autowrite  " write the old file out when switching between files
" switch between buffers without saving, so the must save first
" error doesn't appear
set hidden
set smartindent
set nocompatible
" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" set the gui options the way I like
set guioptions=ac
set guioptions-=T " hide toolbar in gui mode
if has('gui_running')
  "set guifont=monaco:h10
  set guifont=menlo:h10
  "set guifont=inconsolata:h12
endif
set noerrorbells "remove the beeping
set visualbell " remove the beeping
set vb t_vb= " remove the beeping
set showcmd
set ruler
set nohls
set incsearch  " incremental search
set hlsearch " highlight search
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8
" set wrapscan " wrap scans
" set ignorecase " ignore case in search
" set smartcase
set virtualedit=all
"set foldenable
set foldmethod=marker
" set foldclose=all
set nomodeline
set nowrap
set noea " keep buffers the same size when buffers are closed
"set equalalways " i.e. make buffers equal all the time
set ff=unix
"set timeoutlen=500
"set textwidth=79
"set formatoptions=qrn1

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" These things start comment lines
" set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-


" Pressing Shift-< or Shift-> will let you indent/unident selected lines,
" allow it to occur multiple times in visual mode
vnoremap < <gv
vnoremap > >gv

colorscheme tir_black
"colorscheme wuye
"colorscheme twilight
"colorscheme Jellybeans
"colorscheme Darkspectrum
"colorscheme Moria
"colorscheme Lucius

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

" Cleaner IDE functionality
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone " improve completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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

nnoremap <silent> <Leader>be :FuzzyFinderTextMate<CR>

" Project plugin
" nmap <silent> <Space>P <Plug>ToggleProject
nmap <silent> <Leader>p <Plug>ToggleProject

" Pressing i to insert and ii to escape
imap ii <Esc>

" Maps to make handling windows a bit easier
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Buffer commands
noremap <silent> ,bd :bd<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Search the current file for what's currently in the search
" register and display matches
nmap <silent> ,gs
     \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw
     \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW
     \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" put the vim directives for my file editing settings in
nmap <silent> ,vi
     \ ovim:set ts=4 sts=4 sw=4:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" Show all available VIM servers
nmap <silent> ,ss :echo serverlist()<CR>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
     \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
     \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
     \ . ">"<CR>

" Map CTRL-E to do what ',' used to do
nnoremap <c-e> ,
vnoremap <c-e> ,

