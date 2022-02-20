" Matthew Wang's vimrc, see more at https://github.com/ymattw/profiles

" Plugins managed by https://github.com/junegunn/vim-plug
"
if empty(glob('~/.vim_runtime/autoload/plug.vim'))
    echomsg "*** vim-plug is missing, see https://github.com/junegunn/vim-plug"
    finish
endif
call plug#begin('~/.vim_runtime/plugged')
Plug 'mg979/vim-visual-multi'
Plug  'kshenoy/vim-signature'
" My Bundles here:
"Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
"let g:AutoPairs['<']='>'
Plug 'flazz/vim-colorschemes'
"Plug 'honza/vim-snippets'
Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'kien/ctrlp.vim' 
"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

"Plug 'neomake/neomake'
"Plug 'mhinz/vim-startify'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'yonchu/accelerated-smooth-scroll'
"Plug 'matze/vim-move'
"Plug 'pbrisbin/vim-mkdir'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'elzr/vim-json', {'for': 'json'}
"let g:vim_json_syntax_conceal = 0       " Do not hide quotes

"Plug 'mileszs/ack.vim'
"Plug 'altercation/vim-colors-solarized'
call plug#end()

"let g:ackprg = 'ag --vimgrep --smart-case'
"let g:ackhighlight = 1
"cnoreabbrev Ag Ack!
"cnoreabbrev ag Ack!
"cnoreabbrev Af AckFile
"cnoreabbrev af AckFile
"let g:ctrlp_map = '<leader>p'
"let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
"let g:ctrlp_custom_ignore = {
    "\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    "\ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    "\ }
""let g:ctrlp_working_path_mode=0
"let g:ctrlp_working_path_mode = 'c'
"let g:ctrlp_match_window_bottom=1
"let g:ctrlp_max_height=15
"let g:ctrlp_match_window_reversed=0
"let g:ctrlp_mruf_max=500
"let g:ctrlp_follow_symlinks=1
" Remember to change terminal type to xterm-256color!


" Default color and font tunings, needs to be after plug#end()


" Basic settings
"
set noswapfile nobackup                 " No tmp files
set suffixes+=.a,.so,.la,.class,.pyc    " Ignore list for file completion
set suffixes+=.jpg,.png,.gif,.pdf,.doc,.tar,.tgz,.gz,.bz2,.zip
"set                textwidth=79        " Editing
set backspace=indent,eol,start          " Editing
set formatoptions=tcqron1MB             " Formatting, MB for multi-byte chars
silent! set formatoptions+=j            " Vim >= 7.3.541 only
set wildmode=list:full                  " Misc: complete and list matched files
set isfname-==                          " Misc: '=' is not part of filename
set copyindent                          " Indenting
set spelllang=en_us complete+=kspell    " Spell completion, see imap <C-K>
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.cpp,*.c,*.hpp,*.h,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
set synmaxcol=128 ttyfast    " Performance
syntax sync minlines=50 maxlines=200    " Performance
silent! set nowildignorecase            " Vim >= 7.3.072 only
silent! set nofileignorecase            " Vim >= 7.3.872 only
silent! set foldmethod=manual           " Work with ymattw/vim-fold-paragraph

"set list listchars=tab:▸\ ,trail:▌,extends:»,precedes:«

" File type detect
"
autocmd! BufEnter *[Mm]akefile*,[Mm]ake.*,*.mak,*.make setlocal filetype=make

" File type tab size
"
autocmd! FileType html,json
            \ setlocal expandtab softtabstop=2 shiftwidth=2
autocmd! FileType make setlocal noexpandtab shiftwidth=2
autocmd! FileType gitcommit setlocal textwidth=80 spell

" Better color for matched parenthesis
highlight! MatchParen cterm=underline ctermfg=7 ctermbg=0

" Better color for folded text (treat as comment)
highlight! Folded cterm=bold ctermfg=10 ctermbg=0

" Better color for Solarized theme in diff mode
"
highlight! DiffDelete ctermfg=10 ctermbg=0
highlight! DiffAdd cterm=bold ctermfg=70 ctermbg=0
highlight! DiffChange cterm=bold ctermfg=142 ctermbg=0
highlight! DiffText cterm=underline ctermfg=142 ctermbg=0

" More colors suitable for Solarized dark background
"
highlight! link ColorColumn Search
highlight! link SpecialChars ErrorMsg
2match SpecialChars /\%xa0\|[“”‘’—]/            " nbsp & smartly replaced chars


" Misc
"
let python_highlight_all = 1

autocmd VimResized * :wincmd =              " Realign vim window size
autocmd InsertLeave * set nopaste           " Saves a <C-P>

" Remember last cursor postion, :h last-position-jump
set viminfo='10,\"10,<50,s10,%,h,f10


"
" =================== jia vimrc ===============================================
"colorscheme desert
set number
set diffopt=filler,iwhite
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed 
"make 运行
"set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
"set cursorline              " 突出显示当前行
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 设置在状态行显示的信息
"set foldmethod=indent 
"set foldlevel=3 
"set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set cindent
" Tab键的宽度
set tabstop=2
" 统一缩进为2
set softtabstop=2
" 显示行号
set number
"搜索忽略大小写
set ignorecase smartcase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
"set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 总是显示状态行
set laststatus=1
"set statusline=%-10.3n  "buffer number"
map <silent> <leader>1 :diffget 1<CR> :diffupdate<CR>
map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
" 侦测文件类型
filetype on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
"set viminfo+=!
" 带有如下符号的单词不要被换行分割
"set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
"set linespace=0
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\
" 匹配括号高亮的时间（单位是十分之一秒）
"set matchtime=10
" 光标移动到buffer的顶部和底部时保持3行距离

" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt


"set completeopt=c,menu
"set showcmd
set ai!             " 设置自动缩进
"vmap <C-c> "+y
"vmap <C-x> "+d

"nmap pp "+p 
"vmap pp "+p 
"nmap <C-a> ggvG$
nmap wv     <C-w>v  
nmap wc     <C-w>c 
nmap ws     <C-w>s
nmap ss :wa<cr>
"imap <C-d> <Esc>:wa<cr>i<Right>
"map <F5> :cn<cr>
nmap <F6> :cp<cr>
"nmap <F9> :bn<cr>
nmap <F10> :bp<cr>
"---------- plugins------------
" winManager
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>
"nnoremap <silent> <F12> :A<CR>

"grep
nnoremap <silent> <F3> :Rgrep<CR>

" minibufexpl
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" NerdComment
map <leader>c <plug>NERDCommenterComment
map <leader>u <plug>NERDCommenterUncomment
"map <leader>n <plug>NERDCommenterNest
"map <leader>t <plug>NERDCommenterToggle
"map <leader>m <plug>NERDCommenterMinimal
"map <leader>i <plug>NERDCommenterInvert
"map <leader>y <plug>NERDCommenterYank
"map <leader>$ <plug>NERDCommenterToEOL
"map <leader>A <plug>NERDCommenterAppend
"map <leader>a <plug>NERDCommenterAltDelims
"map <leader>l <plug>NERDCommenterAlignLeft
"map <leader>b <plug>NERDCommenterAlignBoth
" NERDTree
map <F4> :NERDTreeToggle<CR>
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                 "\ | wincmd p | diffthis
"let g:indent_guides_auto_colors = 0 
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3 
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4 
"map <leader> <Plug>(easymotion-prefix)
"nnoremap <Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
                                
nnoremap <leader>s  :Ack! -w <cword><CR>|   " Quick search word under cursor
"nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e 
nnoremap <Leader>v V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  "let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
nnoremap <CR> G
nnoremap <BS> gg
map q: :q
set spell
inoremap < <><LEFT>
inoremap ll <<
inoremap lt <
"nmap  <Leader><Leader> V
" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
function! RemoveNextDoubleChar(char)
  let l:line = getline(".")
  let l:next_char = l:line[col(".")] " 取得当前光标后一个字符

  if a:char == l:next_char
    execute "normal! l"
  else
    execute "normal! i" . a:char . ""
  end
endfunction
inoremap > <ESC>:call RemoveNextDoubleChar('>')<CR>a
"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P
" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-bd-f2)

" Move to line
"map <Leader>j <Plug>(easymotion-bd-jk)
" Gif config
"map  <Leader>/ <Plug>(easymotion-sn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"map g/ <Plug>(incsearch-stay)

"" Gif config
"map <Leader>l <Plug>(easymotion-lineforward)
"map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-bd-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-bd-f2)

" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"omap <Leader>L  <Plug>(easyoperator-line-select)
"xmap <Leader>L  <Plug>(easyoperator-line-select)
"nmap d<Leader>L <Plug>(easyoperator-line-delete)
"nmap p<Leader>L <Plug>(easyoperator-line-yank)


:packadd! editexisting
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
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
set relativenumber
let g:indentLine_setColors = 0
let g:snipMate = { 'snippet_version' : 1 }
noremap gV `[v`]
