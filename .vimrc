" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

syntax on
filetype indent plugin on

set expandtab
"set autochdir
set shiftwidth=4
set tabstop=4
set autoindent
set autoread
set showmatch
set number
set ruler
set ignorecase
set incsearch
set hlsearch
set laststatus=2

set completeopt-=preview

filetype plugin on
"set omnifunc=syntaxcomplete

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" switch setting
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" fold setting
"set foldenable
"set foldmethod=syntax
"nnoremap <space> za
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

"ctags
set tags=./tags;
nnoremap <F2> :!ctags -R --c-kinds=+p --fields=+S<CR>:!cscope -Rbq<CR>:cs add cscope.out<CR>
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"

"Autoloading Cscope Database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

"Taglist{
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Ctags_Cmd='ctags'
nnoremap <F3> : Tlist<CR>
"}

"NERDTree{
let NERDTreeWinSize=20
let NERDTreeWinPos="right"
let NERDTreeAutoCenter=1
let NERDTreeHighlightCursorline=1
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
nnoremap <F4> : NERDTreeToggle<CR>
"}

call pathogen#infect()
