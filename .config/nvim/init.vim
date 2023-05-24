

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
set encoding=UTF-8
"set guifont=DroidSansMono\ Nerd\ Font\ 11
set tabstop=4
set softtabstop=4
set shiftwidth=4
set fdm=syntax
set number
set relativenumber
set splitright
set splitbelow
set laststatus=3
set ignorecase
set nrformats=alpha,hex,bin
syntax on
set nocompatible
filetype plugin on

" Setting cursor style based on mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

let mapleader = " "

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
command Rename call RenameFile()

" use leader key bindings
" Replacing Ctrl
nnoremap <leader>> :tabnext<CR>
nnoremap <leader>< :tabprevious<CR>
noremap <Leader>w <C-w>

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

nnoremap <Leader>r :Rename<CR>
nnoremap <Leader>i i <ESC>r
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>s :buffer #<CR>
nnoremap <Leader>p :r! xsel -o -b<CR>
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
" insert a blank line
nnoremap <Leader><CR> i<CR><ESC>
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
" Run will change based on project and will be retained due to Session.vim
" x as in execute
nnoremap <Leader>x :Run<CR>
nnoremap <Leader>X :RunAlt<CR>
nnoremap <Leader>z :Build<CR>
" use leader / to stop highlighting
nnoremap <silent> <Leader>/ :noh<CR>

" enclose commands in visual mode using <Leader>e
vnoremap <Leader>e( c()<ESC>P
vnoremap <Leader>e) c()<ESC>P
vnoremap <Leader>e[ c[]<ESC>P
vnoremap <Leader>e] c[]<ESC>P
vnoremap <Leader>e{ c{}<ESC>P
vnoremap <Leader>e} c{}<ESC>P
vnoremap <Leader>e< c<><ESC>P
vnoremap <Leader>e> c<><ESC>P
vnoremap <Leader>e" c""<ESC>P
vnoremap <Leader>e' c''<ESC>P
vnoremap <Leader>e` c``<ESC>P

" adding configurations for nerdtree
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror
"
" Ranger in vim
function RangerExplorer()
  exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
  if filereadable('/tmp/vim_ranger_current_file')
    exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
    call system('rm /tmp/vim_ranger_current_file')
  endif
  redraw!
endfun
" map <Leader>x :call RangerExplorer()<CR>


let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0


" airline
let g:airline_theme='violet'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" emmet settings
let g:user_emmet_leader_key='<TAB>'
let g:user_emmet_settings = {
    \   'javascript.jsx' : {
        \'extends' : 'jsx',
    \ },
\ }

" NerdCommenter
" NERDCommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'html': { 'left': '' } }

" Align comment delimiters to the left instead of following code indentation
let g:NERDDefaultAlign = 'left'

if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
endif

let g:ft = ''

" settings for vimtex
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fl <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>

" Gundo.vim

let g:gundo_width = 50
let g:gundo_preview_height = 20
let g:gundo_prefer_python3 = 1


:set number relativenumber
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup                           
set laststatus=2


nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>   
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>  

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>



call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug '/usr/local/opt/fzf'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
