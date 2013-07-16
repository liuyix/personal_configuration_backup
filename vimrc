set nocompatible
""""""""""界面""""""""""
colorscheme molokai
"set guifont=Monospace\ 11 
set tabstop=4
set backspace=2
set nu! "显示行号
set nowrap
set linebreak "整词换行
set whichwrap=b,s,<,>,[,] "左右光标移动到头时可以自动下移
"set autochdir "自动设置目录为正在编辑的文件所在目录
set hidden "没有保存的缓冲区可以自动隐藏
set scrolloff=7 "设置光标上下保留的最小的行数
set smartindent	"智能对齐方式
set shiftwidth=4	"换行时行间交错使用4个空格
set autoindent	"自动对齐
set ai!	"设置自动缩进
set showcmd		" display incomplete commands
set wildmenu "增强模式的命令行
"=========状态栏相关===========
set laststatus=2	"总是显示状态栏status line
set ruler	"在编辑过程中，右下角显示光表位置的状态行
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"==========编辑相关============
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Don't use Ex mode, use Q for formatting
"map Q gq
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=v
endif
set autowrite "在切换buffer时自动保存当前的文件
set autoread
"===========查找替换相关============
set hlsearch
set incsearch "" 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
               " 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
               " 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
               " 找要匹配的单词时，别忘记回车 
set gdefault 	"替换所有的行内匹配都被替换，而不是第一个

"=========编程相关===========
"set completeopt=longest,menu	"关掉只能补全的时的预览窗口
filetype plugin indent on
syntax on
syntax enable
"========================================"
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set nobackup
set nowritebackup
" Put these in an autocmd group, so that we can delete them easily.
"===================autocmd====================="
augroup vimrcEx
au!
"如果文件类型为text，则设置文本显示的宽度为78,更多参考:h setlocal
autocmd FileType text setlocal textwidth=78
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
" 如下的autocmd实现打开文件自动跳到上次编辑的位置
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
autocmd! bufwritepost vimrc source ~/.vimrc

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


"==========自定义的键映射=================="
nmap <c-V> <c-v>
"实现CTRL-S保存操作
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
"实现了CTRL-C、CTRL-V复制粘贴操作的映射
vnoremap <c-c> "+y
"inoremap <c-v> <esc>"+p<CR>i
nnoremap <c-v> <esc>"+p<CR>i
map <F2> <c-e>	"使用F2上翻页
map <F3> <c-y>	"使用F3下翻页
map <silent> <F12> :nohlsearch<CR>
let mapleader = ","
let g:mapleader = ","

"使用CTRL+[hjkl]在窗口间导航
"map <C-c> <C-W>c

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"map <C-c> <C-W>c

"使用箭头导航buffer
map <right> :bn<cr>
map <left> :bp<cr>


" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

"括号匹配
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>
"
""非常好用的括号匹配，实际是自动生成括号
""实现便利和兼容的折中
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
"inoremap $t <><esc>i


"使用ALT+[jk]来移动行内容
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"========================================
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"========================================"
"========自动载入项目的配置文件=========="
if filereadable("workplace.vim")
	source workplace.vim
endif
"===========生成ctags=========="
map <C-\> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动判断是否存在cscope并配置
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
                                                                    
"nmap <C-M>s :scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M>g :scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M>c :scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M>t :scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M>e :scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-M>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-M>d :scs find d <C-R>=expand("<cword>")<CR><CR>
"                                                                    
"" Hitting CTRL-space *twice* before the search type does a vertical
"" split instead of a horizontal one
"                                                                    
"nmap <C-M><C-M>s
"	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M><C-M>g
"	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M><C-M>c
"	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M><C-M>t
"	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M><C-M>e
"	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-M><C-M>i
"	\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-M><C-M>d
"	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""


"====== Minibuffer plugin======="
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 2
"let g:miniBufExplModSelTarget = 0
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"
autocmd BufRead,BufNew :call UMiniBufExplorer
"使用<leader>u 打开Minibuffer
map <leader>u :TMiniBufExplorer<cr>
"========================================"
"Auto Completion Popmenu
let g:acp_behaviorSnipmateLength=1
"===================="
set tags+=~/.vim/stl-tags


iab BLP <Beginning Linux Programming>
