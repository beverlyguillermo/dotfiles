" Autoreload .vimrc
autocmd! bufwritepost .vimrc source %
call pathogen#infect()

" Always put status line at the 2nd to last line
set laststatus=2
" Modifying status line look
set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%)
" show how many lines are highlighted in visual mode
set showcmd
" show the line and column number of the cursor position
set ruler

" Err, backup files locations
set backup
set backupdir=/tmp
set directory=/tmp

syntax on
" use the bells and whistles of vim
set nocompatible
" allow switching between changed buffers that haven't been saved yet
set hidden
" show the line numbers
set number
" tabs
set tabstop=2
" backspace for converted tab
set softtabstop=2
" amount of block indenting
set shiftwidth=2
" convert tabs into spaces
set expandtab
" uses the shiftwidth instead of tabstop
set smarttab
" auto indenting when starting a new line
set smartindent
" copy indent from current line to new line
set autoindent
" line height
set linespace=2
" briefly jump to matching closing/opening bracket
set showmatch
" switch between buffers without saving, so the must save first
" error doesn't appear
" write the old file out when switching between files
set autowrite

"remove the beeping
set noerrorbells
set visualbell
set vb t_vb=

set nohls
" incremental search
set incsearch
" highlight search
set hlsearch

" When the page starts to scroll, keep the cursor # lines from the top and #
" lines from the bottom
set scrolloff=4
" set wrapscan " wrap scans
" set ignorecase " ignore case in search
" set smartcase
" allow the cursor to be where there isn't an actual character
set virtualedit=all
" folder methods
"set foldenable
"set foldclose=all
set foldmethod=marker
" gives the number of lines checked for set commands
set nomodeline
" don't wrap lines in the buffer window
set nowrap
" keep buffers the same size when buffers are closed
set noea
"set equalalways " i.e. make buffers equal all the time
"set ff=unix
"set timeoutlen=500
"set textwidth=79
"set formatoptions=qrn1

" Autocompletion for commands
set wildmenu
set wildmode=list:longest,full
set lazyredraw
set backspace=2

" Show trailing white space
set list
set listchars=tab:>-,trail:-

"set the gui options the way I like
"set guioptions=ac
if has('gui_running')

  set guioptions-=T " hide toolbar in gui mode
  "MacOS font
  "set guifont=monaco:h10
  "Windows Font
  set guifont=menlo:h11
  "ttf-inconsolata
  "set guifont=Inconsolata\ 10
  "xfonts-jmk
  "  $ sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
  "  $ sudo fc-cache -f -v
  "set guifont=Neep\ 18
  "ttf-bitstream-vera
  "set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

  " Set up the gui cursor to look nice
  set guicursor=n-v-c:block-Cursor-blinkon0
  set guicursor+=ve:ver35-Cursor
  set guicursor+=o:hor50-Cursor
  set guicursor+=i-ci:ver25-Cursor
  set guicursor+=r-cr:hor20-Cursor
  set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
  set cursorline

  " Set cursor line
  nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

  "colorscheme tir_black
  "colorscheme wuye
  "colorscheme twilight
  "colorscheme Jellybeans
  "colorscheme Darkspectrum
  "colorscheme Moria
  "colorscheme Lucius
  "colorscheme jammy
  "colorscheme earendel
  "let g:solarized_termcolors=256
  set background=dark
  colorscheme solarized
  "colorscheme railscasts

endif

" These things start comment lines
" set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

filetype on
filetype plugin on
filetype indent on
au BufNewFile,BufRead  *.php set filetype=php.html

" Omnicomplete code complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

autocmd FileType html,htmldjango,jinjahtml,php,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,php,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Cleaner IDE functionality
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone " improve completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Remove trailing white space
"autocmd BufRead * silent! %s/[\r \t]\+$//
"autocmd BufEnter *.php :%s/[ \t\r]\+$//e
augroup filetypedetect 
  au BufNewFile,BufRead *.php set filetype=php.html
  au BufNewFile,BufRead *.html.erb set filetype=html.eruby.ruby
  au BufNewFile,BufRead *.js.erb set filetype=javascript.eruby.ruby
  au BufNewFile,BufRead *.r.erb set filetype=r.eruby.ruby
augroup end 

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
noremap <silent> ,bd :bd<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W>>
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Pressing Shift-< or Shift-> will let you indent/unident selected lines,
" allow it to occur multiple times in visual mode
vnoremap < <gv
vnoremap > >gv

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
     \ ovim:set ts=2 sts=2 sw=2:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

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

" Close HTML5/XML Tags, closetag
nmap <silent> ,co <C-_>

" Clean up html
nmap <silent> ,tidy :! tidy -xml -utf8 -mi %:p<CR>:e<CR>

nmap <silent> ,p :NERDTreeToggle<CR>

" Search for particular file, Command-T
nmap <silent> ,t <Leader>t

let g:tagbar_usearrows = 1
nmap <silent> ,tb :TagbarToggle<CR>

" NerdCommentator
nmap <silent> ,cc <Leader>cc<CR>
nmap <silent> ,c<space> <Leader>c<space><CR>
