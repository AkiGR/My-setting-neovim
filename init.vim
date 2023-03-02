" set option
set number
set completeopt=menuone,noinsert


" vim-plug
call plug#begin()
 Plug 'kaicataldo/material.vim', { 'branch': 'main' }           " https://github.com/kaicataldo/material.vim
 Plug 'neoclide/coc.nvim', {'branch': 'release'}                " https://github.com/neoclide/coc.nvim
 Plug 'lambdalisue/fern.vim'                                    " https://github.com/lambdalisue/fern.vim
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}    " https://github.com/nvim-treesitter/nvim-treesitter
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }            " https://github.com/junegunn/fzf
 Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }  " https://github.com/yuki-yano/fzf-preview.vim#features
 Plug 'stevearc/dressing.nvim'                                  " https://github.com/stevearc/dressing.nvim
 Plug 'nvim-lua/plenary.nvim'                                   " https://github.com/nvim-lua/plenary.nvim
 Plug 'nvim-telescope/telescope.nvim'                           " https://github.com/nvim-telescope/telescope.nvim
 Plug 'nvim-telescope/telescope-file-browser.nvim'              " https://github.com/nvim-telescope/telescope-file-browser.nvim
 Plug 'nvim-lualine/lualine.nvim'                               " https://github.com/nvim-lualine/lualine.nvim
 Plug 'cocopon/iceberg.vim'                                     " https://github.com/cocopon/iceberg.vim
call plug#end()

" color option
colorscheme iceberg

lua << END
require('lualine').setup {
  options =  { theme = 'gruvbox_dark'}
}
END

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l


" ex option
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

function! InputParentheses(parenthesis) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:parentheses = { "{": "}", "[": "]", "(": ")" }

	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsCloseParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
	let l:nextCharIsSpace = (l:nextChar == " ")

	if l:nextCharIsEmpty || l:nextCharIsCloseParenthesis || l:nextCharIsSpace
		return a:parenthesis.l:parentheses[a:parenthesis]."\<LEFT>"
	else
		return a:parenthesis
	endif
endfunction

" nnoremap
nnoremap <C-f> :Fern . -drawer<CR>
nnoremap <C-n> :FzfPreviewProjectFilesRpc<CR>
nnoremap <C-t> :Telescope<CR>
