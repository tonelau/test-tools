set nocompatible              " required
set ic
set hlsearch
set incsearch
set nowrap
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
"filetype off                  " required
filetype on                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2
Plugin 'vim-scripts/indentpython.vim'
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"Bundle 'Valloric/YouCompleteMe'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax enable 
syntax on
set background=dark
"colorscheme solarized
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"set t_Co=256
let g:solarized_termcolors=256
"let g:solarized_termcolors= 16 | 256
let g:solarized_termtrans = 0
let g:solarized_degrade = 0
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "normal"
let g:solarized_visibility= "high"
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"if has('gui_running')
"   set background=dark
"   colorscheme solarized
"else
"   set background=dark
"   colorscheme solarized
"   "colorscheme zenburn
"endif
call togglebg#map("<F4>")
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'
set nu
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set clipboard=unnamed
"set editing-mode vi
"Quickly Run
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
	endif
endfunc
"snipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Plugin 'vim-scripts/taglist.vim'
" Optional:
Plugin 'honza/vim-snippets'
nmap <silent> <c-n> :NERDTreeToggle<CR>
" jedi-vim
Plugin 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
Plugin 'flazz/vim-colorschemes'
"colorscheme peaksea
"colorscheme molokai
highlight Comment cterm=bold
set background=dark
set tags=tags;/
set autochdir
execute pathogen#infect()
let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
"let Tlist_Ctags_Cmd='/opt/local/bin/ctags'  "设置ctags命令的位置
let Tlist_Ctags_Cmd='/usr/bin/ctags'  "设置ctags命令的位置
"nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗口的快捷键
nnoremap <silent> <F8> :TlistToggle<CR><CR>
python <<EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
" enable line numbers
let NERDTreeShowLineNumbers=1
" " make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
autocmd FileType nerdtree set norelativenumber
autocmd FileType taglist set norelativenumber
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Yggdroot/indentLine'
Plugin 'rking/ag.vim'
colorscheme desert
set cursorline
hi CursorLine   cterm=NONE ctermbg=black ctermfg=None guibg=NONE guifg=NONE
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=black ctermfg=None guibg=NONE guifg=NONE
