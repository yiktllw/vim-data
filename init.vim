"set ttyfast

"autocmd GUIEnter * simalt ~x	"设置启动全屏

set maxmempattern=4000
set guifont=yiktllw-code,宋体:h13.5:w-0.5   "设置字体

"set guifontwide=宋体:h15
"set lines=999 columns=990	"设置窗口横向90列，纵向填满全屏
set so=40 				"设置光标始终在正中间

let g:python3_host_prog = 'C:\Program Files\Python312\python.exe'
"set pythonthreedll=C:\Program\ Files\Python312\python312.dll

"#######################
"#######插件安装########
"#######################
call plug#begin()
Plug 'junegunn/vim-easy-align'		"对齐插件

Plug 'SirVer/ultisnips' |	 	"代码片段
Plug 'honza/vim-snippets' 
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } 	

Plug 'lervag/vimtex'	"vimtex插件
"LaTeX设置
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
			\ = '-reuse-instance -forward-search @tex @line @pdf'
			\ . ' -inverse-search "' . exepath(v:progpath)
			\ . ' --servername ' . v:servername
			\ . ' --remote-send \"^<C-\^>^<C-n^>'
			\ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
			\ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
			\ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
let g:vimtex_fold_manual=1
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_mode=0
let g:formatdef_latexindent = '"latexindent -l -"'

Plug 'vim-airline/vim-airline' "状态栏插件

Plug 'joshdick/onedark.vim' "onedark主题插件

Plug 'mhinz/vim-startify' "开始界面
" 设置书签
let g:startify_bookmarks            = [
			\ '$USERPROFILE/OneDrive/0-YiktLLW',
			\ '$USERPROFILE/OneDrive/1-课程文件',
			\ '$USERPROFILE/OneDrive',
			\ '$USERPROFILE/AppData/Local/nvim',
			\ '$USERPROFILE/AppData/Local/nvim-data',
			\]

Plug 'preservim/nerdcommenter' "代码注释

Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-i> coc#refresh()
" coc 配置
let g:coc_global_extensions = ['coc-json','coc-vimlsp','coc-tsserver','coc-marketplace','coc-prettier','coc-python','coc-vimtex',]
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <c-j>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<c-j>" :
			\ coc#refresh()
inoremap <expr><c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

Plug 'tpope/vim-surround'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'easymotion/vim-easymotion'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'lfv89/vim-interestingwords'

Plug 'vim-latex/vim-latex'
let g:Tex_SmartQuoteOpen = "''"
let g:Tex_Leader="."
let g:Tex_AutoFolding=0
let g:Tex_SmartKeyDot=0
let g:Tex_SmaKeyBS=0
let g:Tex_SmartKeyQuote=0
let g:Imap_PlaceHolderStart=0
let g:Tex_FoldedEnvironments = 'comment,gather,figure,table,thebibliography,keywords,abstract,titlepage'

Plug 'vim-autoformat/vim-autoformat'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

Plug 'vim-scripts/vim-auto-save'
let g:auto_save=0
augroup group1
	autocmd BufNew,BufRead,BufEnter *.tex exec ":let g:auto_save=1"
	autocmd BufLeave *.tex exec ":let g:auto_save=0"
	autocmd BufNew,BufRead *.vim,*.snippets,*.txt exec ":let g:auto_save=0"
augroup END
call plug#end()


"设置NERDTree的默认打开目录
NERDTree $USERPROFILE\OneDrive\1-课程文件\5-大三上
NERDTreeToggle

nnoremap <F4> :exec exists('syntax_on') ? 'syn off': 'syn on'<CR>

inoremap <s-enter> <esc>$a<enter>

nnoremap <s-enter> $a<enter>

imap <c-j> <down>

imap <c-k> <up>

imap <c-h> <left>

imap <c-l> <right>

inoremap <c-s-f> <esc>:Autoformat<enter>

nnoremap <c-s-f> :Autoformat<enter>

inoremap <c-]> <esc>$a

nnoremap <c-]> $a

"autocmd InsertLeave * :set iminsert=2

"###################

set nocompatible	"不兼容vi，ultisnips要求。

filetype on			"开启文件类型检测

set autoread		" 设置当文件被改动时自动载入

colorscheme onedark "设置主题

set clipboard=unnamed "共享剪贴板  

set cursorcolumn

"set complete=.   "设置补全

"set nobackup "从不备份  

set confirm " 在处理未保存或只读文件的时候，弹出确认

set noexpandtab " 不要用空格代替制表符

set smarttab " 在行和段开始处使用制表符

set nu						"在左侧显示行号

set rnu          			"在左侧显示相对行号

set tabstop=4    			"tab 长度设置为 4
set softtabstop=4
set shiftwidth=4

set history=1000 " 历史记录数

set nobackup "禁止生成临时文件 

set noswapfile "搜索忽略大小写

set ignorecase "搜索逐字符高亮

"set enc=utf-8 "编码设置
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

set langmenu=zh_CN.UTF-8 "语言设置
set helplang=cn

set ambiwidth=double "设置为双字宽显示，否则无法完整显示如:☆

set cursorline   			"突出显示当前行

set ruler        			"在右下角显示光标位置的状态行

set autoindent   			"自动缩进

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ " 设置在状态行显示的信息

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} " 我的状态行显示的内容（包括文件类型和解码）
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] 

set laststatus=2 " 总是显示状态行

filetype plugin on " 载入文件类型插件

filetype indent on " 为特定文件类型载入相关缩进文件

set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割

set linespace=0 " 字符间插入的像素行数目

set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界

set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key

set hidden "设置可在未保存时跳转到另一个文件

set updatetime=100

set shortmess+=c

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"#######################
"#######按键映射########
"#######################

"INSERT模式按键
imap jj <ESC>

"NERDTree按键
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

let mapleader="\<space>"

nnoremap <leader>f :set guifont=*<enter>

inoremap <c-enter> \\<enter>

inoremap <c-t> <esc>:tabnew<cr>:Startify<cr>

nnoremap <c-t> :tabnew<cr>:Startify<cr>

inoremap <c-w> <esc>:q<cr>

nnoremap <c-w> :q<cr>

" 为windows系统映射按键
" Bail out if this isn't wanted.
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
  finish
endif

" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

if has("clipboard")
    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X> "+x
    vnoremap <S-Del> "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>		"+gP
    map <S-Insert>		"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+
endif

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

if 1
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode (<C-O> doesn't work well when
" using completions).
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<Esc>:update<CR>gi

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

if has("gui")
  " CTRL-F is the search dialog
  noremap  <expr> <C-F> has("gui_running") ? ":promptfind\<CR>" : "/"
  inoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-O>:promptfind\<CR>" : "\<C-\>\<C-O>/"
  cnoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-C>:promptfind\<CR>" : "\<C-\>\<C-O>/"

  " CTRL-H is the replace dialog,
  " but in console, it might be backspace, so don't map it there
  nnoremap <expr> <C-H> has("gui_running") ? ":promptrepl\<CR>" : "\<C-H>"
  inoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-O>:promptrepl\<CR>" : "\<C-H>"
  cnoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-C>:promptrepl\<CR>" : "\<C-H>"
endif

" restore 'cpoptions'
set cpo&
if 1
  let &cpoptions = s:save_cpo
  unlet s:save_cpo
endif
