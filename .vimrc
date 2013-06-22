"""
" vundle settings
"""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'spolu/dwm.vim'
Bundle 'xuhdev/SingleCompile'
Bundle 'msanders/snipmate.vim'
Bundle 'kien/ctrlp.vim'
"Bundle ''

filetype plugin indent on     " required!

"""
" common
"""
set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline
set nocp	"no compatible
syntax enable
set wildmode=longest:full
set wildmenu
set ru	"ruler
set nu
set wrap
set autoindent
set smartindent
set nocindent
set ts=4 sw=4 noet
set smarttab
set expandtab
set hlsearch	
set autochdir
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
set viminfo='10,\"100,:20,%,n~/.viminfo'
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"au BufWritePost .vimrc so ~/.vimrc
set guifont=Monaco\ 8


"""
" colorscheme
"""
" Molokai
colorscheme molokai
set background=dark
let g:molokai_original = 1
set t_Co=256
let g:Powerline_symbols = 'fancy'
set laststatus=2
" Solarized"
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256


"""
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"""
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"""
" FUNCTION Full Tabpage full Path
"""
function! TabpageName(mode) 
  if     a:mode == 1 
      return fnamemodify(expand("%"), ":p:h") 
  elseif a:mode == 2 
      let name = fnamemodify(expand("%"), ":p:t") 
      if name == "" 
          return "(Untitled)" 
      endif 
      return name 
  endif 
endfunction 
function! TabpageState() 
  if &modified != 0 
      return '*' 
  else 
      return '' 
  endif 
endfunction 
set guitablabel=%{TabpageName(1)}/%{TabpageName(2)}%{TabpageState()} "1:Full Path, 2:File Name

"""
" automatically open and close the popup menu / preview window
"""
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"Key Map"
nmap <F8> :TagbarToggle<cr>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
