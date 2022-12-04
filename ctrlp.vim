" CtrlP
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/dist/*,*/dist-newstyle/*     " MacOSX/Linux replace with the one that pulls in gitignore?
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,dist/*,dist-newstyle/*     " MacOSX/Linux
" let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<C-e>'], 'AcceptSelection("t")': ['<Cr>'], }

set wildignore+=*/node_modules/*
