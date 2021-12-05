scriptencoding utf-8

" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing  plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'

Plug 'machakann/vim-highlightedyank'
	let g:highlightedyank_highlight_duration = 250

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
	nnoremap <unique> <silent> <leader>gb :Gblame<cr>
	nnoremap <unique> <silent> <leader>gc :Gcommit<cr>
	nnoremap <unique> <silent> <leader>gd :Gdiff<cr>
	nnoremap <unique> <silent> <leader>gs :Gstatus<cr>
	nnoremap <unique> <silent> <leader>gw :Gwrite<cr>

Plug 'tmhedberg/SimpylFold'
	let g:SimpylFold_docstring_preview=1
	nnoremap <space> za

Plug 'vim-airline/vim-airline'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline_powerline_fonts = 1

Plug 'vim-airline/vim-airline-themes'

Plug 'NLKNguyen/papercolor-theme'

Plug 'ctrlpvim/ctrlp.vim'
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
	let g:ctrlp_working_path_mode = 'ra'
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plug 'sbdchd/neoformat'
	autocmd BufWritePre *.py Neoformat

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()

" Toggle invisible characters
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLS
set listchars=tab:▸\ ,eol:¬

" Set line numbering
set nu

" Buffer key bindings
nmap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR>bd #<CR>
nmap <leader>bl :ls<CR>

imap jj <Esc>

" File type detection
filetype on

" Syntax highlighting
syntax on

" Allow unsaved changed to hidden buffers
set hidden

" Colour scheme
colorscheme PaperColor
set background=light
set termguicolors

" Preview command results
set inccommand=nosplit

" Source project-specific .vimrc
set exrc
set secure
