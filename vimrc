" Name this file .vimrc (the dot is important) and put it in your home directory
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'rizzatti/dash.vim'
Plugin 'sjl/vitality.vim'
"Plugin 'vim-scripts/jcommenter.vim'
"Plugin 'vim-scripts/Vim-JDE'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'The-NERD-Commenter'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nomadcoder/smyck'
Plugin 'Syntastic'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'smalik0/vim-syntax'
Plugin 'easymotion/vim-easymotion'
Plugin 'bkad/CamelCaseMotion'
Plugin 'taglist.vim'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/ListToggle'
"Plugin 'Nopik/vim-nerdtree-direnter'
Plugin 'ctrlpvim/ctrlp.vim'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'sudar/vim-arduino-snippets'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" GENERAL OPTIONS
behave xterm
"set viminfo='20,\"500,%	" ' Maximum number of previously edited files for which
"   the marks are remembered.  
" " Maximum number of lines saved for each register.
" % When included, save and restore the buffer list.
"   If Vim is started with a file name argument, the
"   buffer list is not restored.  If Vim is started
"   without a file name argument, the buffer list is
"   restored from the viminfo file.  Buffers without a
"   file name and buffers for help files are not written
"   to the viminfo file.
set history=500		" keep {number} lines of command line history

" TAB HANDLING, program formatting:
set tabstop=3		" ts, number of spaces that a tab *in an input file* is
"   equivalent to.
set shiftwidth=3	" sw, number of spaces shifted left and right when
"   issuing << and >>
"  commands
set smarttab            " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=3       " number of spaces that a tab *pressed by the user*
"   is equivalent to
set shiftround          " round to 'shiftwidth' for "<<" and ">>"
set expandtab           " don't input tabs; replace with spaces. <local to
"   buffer>

" see Vim book p 71 for this
filetype on
filetype plugin on
filetype indent on
imap <C-c> <plug>NERDCommenterInsert
au BufRead,BufNewFile *.py set expandtab
autocmd FileType * set formatoptions=tcql nocindent comments&
" Formatoptions: 'q' allows formatting with "gq".  'r' automates the middle of
"    a comment.  'o' automates comment formatting with the 'o' or 'O'
"    commands.  'c' wrap comments.  'l' do not break lines in insert mode.
set autoindent          " automatically set the indent of a new line (local to
"   buffer)
set smartindent         " autoindenting (local to buffer); let cindent

set wrap                " whether to wrap lines
" Make breaks more obvious
set showbreak=+++\ \  
" set number		" number lines
set nocompatible
set incsearch
set showmatch
set backspace=2
set whichwrap+=<,>,h,l,[,]

syntax on               " colorize
set statusline=%f%m%r%h%w\ %R%M\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
" VIM DISPLAY OPTIONS
set showmode		" show which mode (insert, replace, visual)
set ruler
set title
set showcmd		" show commands in status line when typing
set wildmenu	
set number
set mouse=a
set t_Co=256
set background=dark
let $PATH = '/usr/bin:'.$PATH
" KEY MAPPINGS
"   depending on your terminal software, you may have to fiddle with a few
"   things to make it look right for you.  It works for me logged in through
"   SSH.

"  F6 Clears up formatting by doing the following:
"  Ensure UNIX formatting (no CR chars, NL after the last line).
"  Insert a tab at the end of the current line (to avoid errors in next
"      step).
"  Then replace all tabs with 4 spaces.  That is, "detab".
"  Then, remove any spaces at the end of lines (this corrects the inserted
"      tab).
"  Then, clean up some annoying highlights in the file.
"  Note: this detabbing should work for tabs at the beginning of the line, but
"      will probably be somewhat wrong for tabs later in the line, but
"      wherever they used to be, they'll now be gone.
:map <F6> mzA	<esc>:set fileformat=unix<cr>:set endofline<cr>:%s/	/    /g<cr>:%s/ *$//<cr>:nohlsearch<cr>i<esc>`z

:imap <F6> <esc>mzA	<esc>:set fileformat=unix<cr>:set endofline<cr>:%s/	/    /g<cr>:%s/ *$//<cr>:nohlsearch<cr>i<esc>`za

"  Useful for limiting lines to 80 columns.  Goes to column 80, then back to a
"      previous space, then changes that space to a newline.  "autoindent" from
"      above completes this trick.
":map <F7> 80|F s<cr><esc>
:map <S-F7> 80|F s<cr><tab><esc>
let delimitMate_expand_cr = 1
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType java nnoremap <buffer> <F9> :exec '!javac' shellescape(@%, 1)<cr>
autocmd FileType java nnoremap <buffer> <F8> :exec '!javac *.java'<cr>
autocmd FileType c nnoremap <buffer> <F8> :exec '!../inst %:p:h:t'<cr>
autocmd FileType c nnoremap <buffer> <F9> :exec '!../run %:p:h:t'<cr>
autocmd FileType c nnoremap <buffer> <F10> :exec '!../test %:p:h:t'<cr>
autocmd FileType c nnoremap <buffer> <F11> :exec '!../newtest %:p:h:t'<cr>
"if @% =~# 'Test"'
"autocmd FileType java nnoremap <buffer> <F10> :exec '!java org.junit.runner.JUnitCore %:r'<cr>
"else
autocmd FileType java nnoremap <buffer> <F10> :exec '!java %:r'<cr>
"endif
fu! Run()
	exec '!java org.junit.runner.JUnitCore %:r'
endf
autocmd BufNewFile,BufRead *Test*.java nnoremap <buffer> <F10> :call Run()<cr>
autocmd! BufNewFile,BufRead *.pde setlocal ft=java
autocmd BufNewFile,BufRead *.bin map <F9> :exec '!lc3convert -b2' shellescape(@%, 1)<cr>
autocmd BufNewFile,BufRead *.hex map <F9> :exec '!lc3convert -b16' shellescape(@%, 1)<cr>
autocmd BufNewFile,BufRead *.asm map <F9> :exec '!lc3as' shellescape(@%, 1)<cr>
set clipboard=unnamed
if has("gui_macvim")
	" Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
	" the right side. Ctrl-Shift-Tab goes the other way.
	noremap <C-Tab> :tabnext<CR>
	noremap <C-S-Tab> :tabprev<CR>

	" Switch to specific tab numbers with Command-number
	noremap <D-1> :tabn 1<CR>
	noremap <D-2> :tabn 2<CR>
	noremap <D-3> :tabn 3<CR>
	noremap <D-4> :tabn 4<CR>
	noremap <D-5> :tabn 5<CR>
	noremap <D-6> :tabn 6<CR>
	noremap <D-7> :tabn 7<CR>
	noremap <D-8> :tabn 8<CR>
	noremap <D-9> :tabn 9<CR>
	" Command-0 goes to the last tab
	noremap <D-0> :tablast<CR>
endif
nnoremap <C-t> :tabnew<CR>:NERDTree<CR>
inoremap H <Esc>:tabprevious<CR>i
inoremap L <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>:NERDTree<CR>
nnoremap H gt
nnoremap L gT

map <S-k> <C-k>
map <S-j> <C-j>
map <S-h> <C-h>
map <S-l> <C-l>
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
nnoremap <Space> za
"folding settings
"set foldclose=all 
set foldcolumn=1 
set foldenable 
set foldmethod=syntax 
"set foldopen=all 
set foldnestmax=5
"autocmd FileType java :foldopen
set foldlevel=5
fu! CustomFoldText()
	"get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = " " . foldSize . " lines "
	let foldLevelStr = repeat("+--", v:foldlevel)
	let lineCount = line("$")
	let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
	let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
set foldtext=CustomFoldText()
colorscheme jellybeans 
" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

set pastetoggle=<F2>
vmap <C-c> y<Esc>
vmap <C-x> d<Esc>
nmap <C-v> p
"imap <C-v> <Esc><Left>pi
imap <C-z> <Esc>ui
let mapleader=','
set cursorline

nnoremap p P
nnoremap D "_d
vnoremap p "_dP
vnoremap D "_d

" Needed for tmux and vim to play nice
"
if &term =~ '^screen' && exists('$TMUX')
	set mouse+=a
	" tmux knows the extended mouse mode
	set ttymouse=xterm2
	" tmux will send xterm-style keys when xterm-keys is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
	execute "set <xHome>=\e[1;*H"
	execute "set <xEnd>=\e[1;*F"
	execute "set <Insert>=\e[2;*~"
	execute "set <Delete>=\e[3;*~"
	execute "set <PageUp>=\e[5;*~"
	execute "set <PageDown>=\e[6;*~"
	execute "set <xF1>=\e[1;*P"
	execute "set <xF2>=\e[1;*Q"
	execute "set <xF3>=\e[1;*R"
	execute "set <xF4>=\e[1;*S"
	execute "set <F5>=\e[15;*~"
	execute "set <F6>=\e[17;*~"
	execute "set <F7>=\e[18;*~"
	execute "set <F8>=\e[19;*~"
	execute "set <F9>=\e[20;*~"
	execute "set <F10>=\e[21;*~"
	execute "set <F11>=\e[23;*~"
	execute "set <F12>=\e[24;*~"
endif
"
" YouCompleteMe options
"

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 0


let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_server_log_level = 'debug'
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <Leader>f :YcmCompleter FixIt <CR>
nnoremap <Leader>t :YcmCompleter GetType <CR>
nnoremap <Leader>G :YcmCompleter GoToDefinition <CR>
nnoremap <Leader>g :YcmCompleter GoTo <CR>
nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

"set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h15
set encoding=utf-8
"set term=xterm-256color
set termencoding=utf-8
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
set t_ut=
let g:Powerline_symbols = 'fancy'
if has("gui_running")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set guifont=Inconsolata\ for\ Powerline:h15
	endif
endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if tabpagenr("$") == 1 | TlistToggle | endif
autocmd TabEnter * TlistToggle
autocmd TabLeave * TlistClose
fu! CheckForValidBuf()
   if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
   if (winnr("$") == 2)
      let w1 = bufname(winbufnr(1))
      let w2 = bufname(winbufnr(2))
      if ((w1 =~ "NERD_tree_" && w2 == "__Tag_List__") || (w1 == "__Tag_List__" && w2 =~ "NERD_tree_"))
         if tabpagenr("$") == 1
            qall
         else
            tabclose
         endif
      endif
   endif
endf
autocmd bufenter * call CheckForValidBuf() 

map <C-n> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_check_on_open=0
let g:syntastic_auto_jump=3
let g:nerdtree_tabs_open_on_console_startup=0
let g:syntastic_enable_balloons = 1
let g:nerdtree_tabs_synchronize_focus=0
let g:nerdtree_tabs_synchronize_view=0
let g:NERDTreeChDirMode=2
let g:ctrlp_map='<c-p>'
"let NERDTreeHijackNetrw=1
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabNoCompleteAfter = ['^', '\s', ';']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
autocmd BufEnter * silent! lcd %:p:h
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
nmap <silent> <leader>d <Plug>DashSearch
nnoremap <silent> <F12> :TlistToggle<CR>
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let Tlist_Use_Right_Window   = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Display_Prototype = 1
let Tlist_Display_Tag_Scope = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Auto_Open=1
let Tlist_WinWidth = 50
let Tlist_Enable_Fold_Column = 0
set ballooneval
let balloontext = v:errmsg
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
