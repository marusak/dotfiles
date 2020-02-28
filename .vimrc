let g:flake8_ignore="E402,F999"
"----------------------------------------------Here begins vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"add all plugins here

call vundle#end()            " required
"-----------------------------------------------Here ends vundle


filetype plugin indent on    "automatic indentation
syn on se title              "syntax highlight on and set title?(dunno, from kernel)
"to use Syntastic
execute pathogen#infect()


"DUNNO NOW

"if has("autocmd")
"    augroup JumpCursorOnEdit
"    autocmd!
"    autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \   exe "normal! g'\"" |
"    \ endif
"    augroup END
"endif

"include ./.vimrc file (securely)
set exrc
set secure

"higlight 80th column
highlight ColorColumn ctermbg=8
:set colorcolumn=80 

set et
set ts=4
set sw=4

set lcs=tab:>-,trail:@
set list
set autoindent
set cindent
set spell
set spelllang=en_us

set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
set errorformat=%f:%l:\ %m



"syntax on
"set nocompatible
set ruler
set showcmd
set wildmenu
set fileencodings=utf-8,latin2
set showmatch
set incsearch
set hlsearch
set scrolloff=3
set makeprg=make
" C style programming:
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal smartindent
setlocal tw=100
setlocal tabpagemax=100

"Kernel coding style
"set tabstop=8
"set softtabstop=8
"set shiftwidth=8
"set noexpandtab

set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
set errorformat=%f:%l:\ %m

"c++11 common
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++14 -Wall -Wextra -pedantic'

let g:syntastic_cpp_include_dirs = ['/home/matej/Qt/5.5/']


let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-std=c99 -Wall -Wextra -pedantic'

let g:syntastic_python_checkers = ['pylint']

set encoding=utf-8
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set tags=.git/tags

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" save
map <F2> <ESC>:SyntasticCheck<CR>
imap <F2> <ESC>:SyntasticCheck<CR>a

" switch between paste and nopaste
set pastetoggle=<F4>
" no highlight
map <F5> <ESC>:noh<CR>
imap <F5> <ESC>:noh<CR>a
" wrap current paragraph
map <F6> <ESC>:lclose<CR>
imap <F6> <ESC>:lclose<CR>
" settings with various tabstop and tabwidth (in command or insert mode)
" tab=8
map <F7> <ESC>:set ts=8<CR>:set noexpandtab<CR>:set sw=8<CR>
imap <F7> <ESC>:set ts=8<CR>:set noexpandtab<CR>:set sw=8<CR>a
" build ctags
map <F8> <ESC>:!ctags -R --exclude=.git --exclude=node_modules<CR>
" save and make
map <F9> <ESC>:w<CR><silent>:make\|redraw!\|cc<CR>
imap <F9> <ESC>:w<CR>:make<CR>

imap <C-d> <C-o>diw

" disable pgUp and pgDown
map <PageUp> <Nop>
map <PageDown> <Nop>

"" insert date stamp for changelog
map <F10> <ESC>k:r! LC_ALL=en_US date "+* \%a \%b \%d \%Y Matej Marusak"<CR>o
imap <F10> <ESC>k:r! LC_ALL=en_US date "+* \%a \%b \%d \%Y Matej Marusak"<CR>o<TAB>

map <C-Up> :lprev<CR>
map <C-Down> :lnext<CR>

map <S-Tab> :<C-Q><Tab>



filetype on                 " required
"Shift+K goes to cpp manulat insted of bash 
autocmd FileType cc set keywordprg=cppman


set path+=/usr/include/openmpi-x86_64/

au BufRead,BufNewFile *.smv    setfiletype smv
au BufRead,BufNewFile *.vam    setfiletype vam
au BufRead,BufNewFile *.fst    setfiletype fast
au BufRead,BufNewFile *.armc    setfiletype armc
au BufRead,BufNewFile *.isac    setfiletype isac
au BufRead,BufNewFile *.codal    setfiletype codal
au BufRead,BufNewFile *.t2t    setfiletype txt2tags
au BufRead,BufNewFile *.smt    setfiletype smt-lib
au BufRead,BufNewFile *.smt2    setfiletype smt-lib

" VHDL indent file
" from: http://www.vim.org/scripts/script.php?script_id=1450
filetype indent on
"BEGIN_DEVASSISTANT_1
"Setting value devassistant to 0 will use your existing .vimrc file
"Setting value devassistant to 1 will use the vimrc defined by the devassistant feature

let devassistant=0
if devassistant==1
 :source /usr/share/devassistant/files/snippets/vim/vimrc
endif
"END_DEVASSISTANT_1
