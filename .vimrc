"higlight 80th column
highlight ColorColumn ctermbg=8
:set colorcolumn=80 

"Highlight 'lenght'
:hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
:call matchadd('CustomPink', 'lenght')

"Tab is spaces
set expandtab
set tabstop=4
set shiftwidth=4

"Show tabs and trailing spaces
set listchars=tab:>-,trail:@
set list

"Autoindent
set autoindent
set cindent

"Spellcheck
set spell
set spelllang=en_us
