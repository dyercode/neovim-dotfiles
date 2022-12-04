nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "neovim"
let g:test#neovim#start_normal = 1 " If using neovim strategy
let g:test#basic#start_normal = 1 " If using basic strategy
