" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

syntax on

set expandtab
set shiftwidth=4
set tabstop=4
set hlsearch
set autoindent
set autoread
set showmatch
set number
set ruler
set ignorecase

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

"ctags
"set tags += tags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"

"taglist{
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
"设置ctags命令的位置
"nnoremap <leader>tl : Tlist<CR>
nnoremap <F3> : Tlist<CR>
"设置关闭和打开taglist窗口的快捷键
"}

call pathogen#infect()
