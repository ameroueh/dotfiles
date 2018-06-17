scriptencoding utf-8

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

	call minpac#add('roxma/nvim-completion-manager')

	call minpac#add('tpope/vim-commentary')

	call minpac#add('tpope/vim-fugitive')

	call minpac#add('w0rp/ale')
		let g:ale_echo_msg_format = '%linter%: %s'
		let g:ale_open_list = 1
		let g:ale_python_mypy_options = '--ignore-missing-imports'
		let g:ale_python_pylint_options = '--disable-missing-docstring'

		" Automatically close buffers on quitting
		autocmd QuitPre * if empty(&bt) | lclose | endif

	call minpac#add('tmhedberg/SimpylFold')
		let g:SimpylFold_docstring_preview=1
		nnoremap <space> za

	call minpac#add('vim-airline/vim-airline')
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#fnamemod = ':t'
		let g:airline_powerline_fonts = 1

	call minpac#add('vim-airline/vim-airline-themes')
	
	call minpac#add('morhetz/gruvbox')

	call minpac#add('ctrlpvim/ctrlp.vim')
		let g:ctrlp_map = '<c-p>'
		let g:ctrlp_cmd = 'CtrlP'
		let g:ctrlp_working_path_mode = 'ra'
		  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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

" Allow unsaved changed to hidden buffers
set hidden

" Colour scheme
colorscheme gruvbox
set background=dark
