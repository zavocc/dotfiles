" For filetypes uwu
filetype on
filetype plugin on
filetype indent on
syntax on

" Probably cute and useful
set number
set cursorline

"Tabs to spaces
"shiftwidth, tabstop, expandtab
set sw=4
set ts=4
set et

" I work at small screen devices sometimes
" Termux perhaps? You've guessed!
set nowrap

" Neovim sets this by default
" set encoding=utf-8

" plugins
" What does this function do?
" This should probably go to my obsidian notes: https://learnvimscriptthehardway.stevelosh.com/chapters/26.html
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-fugitive'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'romgrk/barbar.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'chrisbra/changesPlugin'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'https://github.com/github/copilot.vim'
    Plug 'https://github.com/folke/tokyonight.nvim'
call plug#end()

" Variables, mostly
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:lightline={ 'enable': {'statusline': 1, 'tabline': 1} }

if filereadable(expand('~/.local/share/nvim/plugged/tokyonight.nvim/vim.toml'))
    colorscheme tokyonight-moon
endif

" *VIM mappings
" I think it's better to use noremap as it doesn't recursively map keys that
" was already been mapped before
"
" pls check https://www.reddit.com/r/vim/comments/eo5ozh/what_are_some_examples_of_when_to_use_map_vs/
" and https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal mode mappings
" 1. Go back to normal mode: CTRL-Backslash CTRL-n to go to normal mode from
" terminal mode, assigns as ESC
tnoremap <ESC> <C-\><C-n>

" External VIM script
let vimscript_extern = expand('~/.external_vimrc.vim')

if filereadable(expand(vimscript_extern))
    exe 'source' vimscript_extern
endif

