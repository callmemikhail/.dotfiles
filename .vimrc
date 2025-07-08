"Кодировка utf8
syntax on
"Использование Мыши
set mouse=a
"Системный буфер обмена
"set clipboard=unnamed
set clipboard=unnamedplus
"Нумерация
set number
"Нумерация относительно строк
set relativenumber 
"Отключение swap file
set noswapfile
"Файловая формат
set fileformat=
set encoding=utf-8
execute pathogen#infect()
"Тема
set background=dark
" colorscheme iceberg
"Отключение визуально-звуковых ув. 
set t_vb
set novisualbell 
set visualbell t_vb=
"Press Enter ... to continue

"python
set tabstop=4
set shiftwidth=4
set softtabstop=4

"vim-pliuggins
call plug#begin('~/.vim/bundle')
Plug 'matze/vim-move'
Plug 'vimwiki/vimwiki'
Plug 'lilydjwg/colorizer'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
call plug#end()

"for syntaxis
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1

"for-vim-wiki
set nocompatible
filetype plugin on
command PasteTable execute 'read ~/.config/vim/tables' 

"binds
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>> :tabp<CR>
nnoremap <leader>< :tabnext<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>s :below vertical terminal<CR>

"vim-move 
map <Space> <Leader>
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = "C"
