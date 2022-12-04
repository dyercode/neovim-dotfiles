set encoding=UTF-8
set rnu nu
set expandtab
set tabstop=2
set shiftwidth=2
set background=dark
"colorscheme apprentice makes numbers orange
"colorscheme space-vim-dark makes function names red
"colorscheme two-firewatch has bright white for some keywords and red for numbers
"colorscheme PaperColor pink yellow and blue hurt too much also doesn't work
"on boot
colorscheme deep-space

"let themes change bg color
set termguicolors
hi Normal guibg=none

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

if &loadplugins
  " source ~/.config/nvim/languageClient.vim " this really doesn't seem to be
  " inted to be used by the user, rather in plugins/scripts
  " let g:opamshare = substitute(system('opam var share'),'\n$','','''')
  " execute "set rtp+=" . g:opamshare . "/merlin/vim"
  " :execute "helptags " . g:opamshare . "/merlin/vim/doc"
  set completeopt=menu,menuone,noselect
endif

" map esc so it can esc out of terminal.
tnoremap <Esc> <C-\><C-n>


autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
