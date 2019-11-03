scriptencoding utf-8

imap jj <Esc>

if empty(glob('~/.config/nvim/minpac'))
	silent !git clone https://github.com/k-takata/minpac.git
		 \ ~/.config/nvim/pack/minpac/opt/minpac
	autocmd VimEnter * call minpac#update()
endif

silent! packadd minpac

if exists('*minpac#init')
	call minpac#init()

	call minpac#add('k-takata/minpac', {'type': 'opt'})
		command! MinpacUpgrade call minpac#clean() | call minpac#update()

	call minpac#add('airblade/vim-gitgutter')

	call minpac#add('machakann/vim-highlightedyank')
		let g:highlightedyank_highlight_duration = 250

	call minpac#add('tpope/vim-commentary')

	call minpac#add('tpope/vim-fugitive')
		nnoremap <unique> <silent> <leader>gb :Gblame<cr>
		nnoremap <unique> <silent> <leader>gc :Gcommit<cr>
		nnoremap <unique> <silent> <leader>gd :Gdiff<cr>
		nnoremap <unique> <silent> <leader>gs :Gstatus<cr>
		nnoremap <unique> <silent> <leader>gw :Gwrite<cr>

	" call minpac#add('w0rp/ale')
	" 	let g:ale_echo_msg_format = '%linter%: %s'
	" 	let g:ale_open_list = 1
	" 	let g:ale_python_mypy_options = '--ignore-missing-imports'
	" 	let g:ale_python_pylint_options = '--disable-missing-docstring'
	" 	let g:ale_c_build_dir = "build"

	" 	" Automatically close buffers on quitting
	" 	autocmd QuitPre * if empty(&bt) | lclose | endif

	call minpac#add('tmhedberg/SimpylFold')
		let g:SimpylFold_docstring_preview=1
		nnoremap <space> za

	call minpac#add('vim-airline/vim-airline')
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#fnamemod = ':t'
		let g:airline_powerline_fonts = 1

	call minpac#add('vim-airline/vim-airline-themes')
	
	call minpac#add('NLKNguyen/papercolor-theme')

	call minpac#add('ctrlpvim/ctrlp.vim')
		let g:ctrlp_map = '<c-p>'
		let g:ctrlp_cmd = 'CtrlP'
		let g:ctrlp_working_path_mode = 'ra'
		let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

	call minpac#add('sbdchd/neoformat')
		autocmd BufWritePre *.py Neoformat
endif


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

" Allow unsaved changed to hidden buffers
set hidden

" Colour scheme
colorscheme PaperColor
set background=light

" Preview command results
set inccommand=nosplit

" Source project-specific .vimrc
set exrc
set secure
