" Matthew Wang's vimrc, see more at https://github.com/ymattw/profiles

" Plugins managed by https://github.com/junegunn/vim-plug
"
if empty(glob('~rob/.vim_runtime/autoload/plug.vim'))
    echomsg "*** vim-plug is missing, see https://github.com/junegunn/vim-plug"
    finish
endif
call plug#begin('~rob/.vim_runtime/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'wellle/targets.vim'
Plug 'ervandew/supertab'
Plug 'ggandor/lightspeed.nvim'
"Plug 'unblevable/quick-scope'

Plug 'ellisonleao/glow.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }


Plug 'sheerun/vim-polyglot'

Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'sindrets/diffview.nvim'
  "magit
Plug 'TimUntersberger/neogit'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
 "Plug 'L3MON4D3/LuaSnip'
 "Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
 "Plug 'dcampos/nvim-snippy'
 "Plug 'dcampos/cmp-snippy'
"Plug 'mg979/vim-visual-multi'
"Plug  'kshenoy/vim-signature'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
"

" My Bundles here:
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
"Plug 'flazz/vim-colorschemes'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-expand-region'
"Plug 'haya14busa/incsearch.vim'
"Plug 'haya14busa/vim-easyoperator-line'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'kana/vim-operator-user'
"Plug 'rhysd/vim-clang-format'
"Plug 'chiel92/vim-autoformat'
"Plug 'pboettch/vim-cmake-syntax'
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'junegunn/goyo.vim'


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

Plug 'mileszs/ack.vim'
"Plug 'altercation/vim-colors-solarized'
Plug 'folke/which-key.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'ibhagwan/fzf-lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'


call plug#end()

lua <<EOF
require("trouble").setup(
{
  opts=
{
    icons = false,
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
},
}



)
EOF
lua <<EOF
  require ("mason").setup()
  require ("mason-lspconfig").setup( {
  --      ensure_installed = {"clangd"}
    }
  )
  
EOF
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

let g:ackprg = 'ag --vimgrep --smart-case'
let g:ackhighlight = 1
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
set nofixendofline
set formatoptions=tcqron1MB             " Formatting, MB for multi-byte chars
silent! set formatoptions+=j            " Vim >= 7.3.541 only
set wildmode=list:full                  " Misc: complete and list matched files
set isfname-==                          " Misc: '=' is not part of filename
set copyindent                          " Indenting
set spelllang=en_us complete+=kspell    " Spell completion, see imap <C-K>
"fun! CleanExtraSpaces()
    "let save_cursor = getpos(".")
    "let old_query = getreg('/')
    "silent! %s/\s\+$//e
    "call setpos('.', save_cursor)
    "call setreg('/', old_query)
"endfun

"if has("autocmd")
    "autocmd BufWritePre *.cpp,*.c,*.hpp,*.h,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
"endif
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
"set viminfo='10,\"10,<50,s10,%,h,f10
"autocmd! BufReadPost *
      "\ if line("'\"") > 0 && line("'\"") <= line("$") |
      "\     exe "normal! g`\"" |
      "\ endif


"
" =================== jia vimrc ===============================================
""colorscheme desert
let g:goyo_width=120
let g:goyo_height=50
set number
set diffopt=filler
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
"set completeopt=preview,menu 
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
"map <silent> <leader>1 :diffget 1<CR> :diffupdate<CR>
"map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
"map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
"map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
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
"set completeopt=longest,menu
set showcmd
set ai!             " 设置自动缩进
"vmap <C-c> "+y
"vmap <C-x> "+d

"nmap pp "+p 
"vmap pp "+p 
"nmap <C-a> ggvG$
nmap wv     <C-w>v  
nmap wc     <C-w>c 
nmap ws     <C-w>s
"nmap ss :wa<cr>
"imap <C-d> <Esc>:wa<cr>i<Right>
"map <F5> :cn<cr>
nmap <F6> :cp<cr>
"---------- plugins------------
" winManager
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>
"nnoremap <silent> <F12> :A<CR>


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
map <F5> :cn<CR>
map <F6> :cp<CR>
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                 \ | wincmd p | diffthis
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
nnoremap <Leader><leader> V
"nnoremap <Leader>q :q<CR>
"nnoremap <Leader>e :e 
"nnoremap <Leader>v V


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
noremap gV `[v`]
"map q: :q
"set spell
"inoremap < <><LEFT>
"inoremap ll <<
"inoremap lt <
"nmap  <Leader><Leader> V
" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
"function! RemoveNextDoubleChar(char)
  "let l:line = getline(".")
  "let l:next_char = l:line[col(".")] " 取得当前光标后一个字符

  "if a:char == l:next_char
    "execute "normal! l"
  "else
    "execute "normal! i" . a:char . ""
  "end
"endfunction
"inoremap > <ESC>:call RemoveNextDoubleChar('>')<CR>a
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

"let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"let g:EasyMotion_smartcase = 1
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

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


let g:rbpt_colorpairs = [
    \ ['brown',       'royalblue3'],
    \ ['darkblue',    'seagreen3'],
    \ ['darkgray',    'darkorchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'royalblue3'],
    \ ['darkred',     'seagreen3'],
    \ ['darkmagenta', 'darkorchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'royalblue3'],
    \ ['darkmagenta', 'darkorchid3'],
    \ ['darkblue',    'firebrick3'],
    \ ['darkgreen',   'royalblue3'],
    \ ['darkcyan',    'seagreen3'],
    \ ['darkred',     'darkorchid3'],
    \ ['red',         'firebrick3'],
    \ ]

"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadChevrons
au Syntax * RainbowParenthesesLoadBraces
set relativenumber
let g:indentLine_setColors = 0
"au BufEnter *.cpp set makeprg=g++\ -g\ -Wall\ -Wextra\ -O0\ --std=c++2a\ %\ -o\ %<
"au BufEnter *.c set makeprg=gcc\ -g\ -Wall\ -Wextra\ -O0\ %\ -o\ %<
"au BufWritePost *.c silent make
"au BufWritePost *.cpp silent make

let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
"autocmd FileType c,cpp nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
"autocmd FileType c,cpp vnoremap <buffer><Leader>f :ClangFormat<CR*>
"autocmd FileType cmake,vim,python,cpp  nnoremap <buffer><Leader>f :<C-u>Autoformat<CR>
"autocmd FileType cmake,vim,python,cpp vnoremap <buffer><Leader>f :Autoformat<CR>
"autocmd FileType cmake,vim,python,cpp nnoremap <buffer><Leader>f :<C-u>AutoFormat<CR>
"autocmd FileType cmake,vim,python,cpp vnoremap <buffer><Leader>f :AutoFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp map <buffer><Leader>x <Plug>(operator-clang-format)
"" Toggle auto formatting:
"nmap <Leader>C :ClangFormatAutoToggle<CR>
"au BufWrite *.cpp :Autoformat
"au BufWrite *.c :Autoformat
"au BufWrite *.h :Autoformat

"noremap <leader>cr :py3f /home/rob/openSrc/llvm-project/clang/tools/clang-rename/clang-rename.py<cr>
"
lua <<EOF
require'nvim-treesitter.configs'.setup {
   -- 支持的语言
    ensure_installed = { "c", "cpp","lua","go"},
    -- 启用代码高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    --启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<cr>',
            node_incremental = '<cr>',
            node_decremental = '<bs>',
            scope_incremental = '<tab>'
        },
    },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
},
}
EOF

lua <<EOF
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
-- require('lspconfig')['rust_analyzer'].setup{
  --   on_attach = on_attach,
    -- flags = lsp_flags,
    -- Server-specific settings...
   --  settings = {
 --      ["rust-analyzer"] = {}
   --  }
-- }
EOF

lua <<EOF
-- Setup language servers.


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.ol
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

EOF

" find files using telescope command-line sugar.
nmap <Leader>ff :Telescope find_files<CR>
nmap <Leader>fg :Telescope live_grep<CR>
nmap <Leader>fb :Telescope buffers<CR>
nmap <Leader>ft :Telescope help_tags<CR>
nmap <Leader>fc <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending"})<cr>
set diffopt+=linematch:50

autocmd BufEnter * silent! lcd %:p:h


"lua <<EOF
  "-- Set up nvim-cmp.
  "local cmp = require'cmp'

  "cmp.setup({
    "snippet = {
      "-- REQUIRED - you must specify a snippet engine
      "expand = function(args)
        "--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.

         "require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        "-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        "-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      "end,
    "},
    "window = {
     "--  completion = cmp.config.window.bordered(),
     "--  documentation = cmp.config.window.bordered(),
    "},


    "mapping = cmp.mapping.preset.insert({
      "['<C-b>'] = cmp.mapping.scroll_docs(-4),
      "['<C-f>'] = cmp.mapping.scroll_docs(4),
      "['<C-Space>'] = cmp.mapping.complete(),
      "['<C-e>'] = cmp.mapping.abort(),
      "['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    "}),

    "sources = cmp.config.sources({
      "{ name = 'nvim_lsp' },
      "{ name = 'vsnip' }, -- For vsnip users.
      "-- { name = 'luasnip' }, -- For luasnip users.
      "-- { name = 'ultisnips' }, -- For ultisnips users.
      "-- { name = 'snippy' }, -- For snippy users.
    "}, {
      "{ name = 'buffer' },
    "})
  "})

  "-- Set up lspconfig.
  "local capabilities = require('cmp_nvim_lsp').default_capabilities()
  "-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  "require('lspconfig')['clangd'].setup {
    "capabilities = capabilities
  "}
"EOF
"
" CocUninstall 删除插件
" CocList extensions  列出扩展
" Cocinstall 安装插件
let g:coc_global_extensions = [
            \'coc-vimlsp',
            \'coc-clangd',
            \'coc-pyright',
            \'coc-word',
            \'coc-snippets']
set pumheight=10 " 显示最大补全
highlight CocErrorLine cterm=undercurl ctermfg=Red " 将错误提醒改为 红线
" 使用CocConfig
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')
" 设置回车补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
" 定义跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
" Remap for format selected buf
xmap <leader>fm  <Plug>(coc-format)
nmap <leader>fm  <Plug>(coc-format)

" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap  <leader>re <Plug>(coc-codeaction-refactor)

" 跳转到帮助文档
"nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" set signcolumn=yes
set updatetime=300
autocmd CursorHold * silent call CocActionAsync('highlight') 

" 代码片段 参考 https://blog.csdn.net/niuiic/article/details/117599130
" CocCommand snippets.editSnippets 创建默认代码片段不推荐,推荐自定义位置
" CocCommand snippets.openSnippetFiles 打开代码片段文件
"
"
lua <<EOF
local telescope_builtin = require("telescope.builtin")
vim.keymap.set({ "n" }, "<leader>lds", function()
telescope_builtin.lsp_document_symbols()
end, { buffer = bufnr })

require('telescope').load_extension('fzf')

EOF


lua <<EOF
require("neogit").setup()
local neogit = require("neogit")

neogit.setup {
  -- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
  integrations = {
    -- If enabled, use telescope for menu selection rather than vim.ui.select.
    -- Allows multi-select and some things that vim.ui.select doesn't.
    telescope = true,
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
    -- The diffview integration enables the diff popup.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    diffview = true,

    -- If enabled, uses fzf-lua for menu selection. If the telescope integration
    -- is also selected then telescope is used instead
    -- Requires you to have `ibhagwan/fzf-lua` installed.
    fzf_lua = true,
  },
}
EOF

lua <<EOF

local ok, dap = pcall(require, "dap")
if not ok then return end

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/rob/.dap_cpp/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {  
    { 
       text = '-enable-pretty-printing',
       description =  'enable pretty printing',
       ignoreFailures = false 
    },
},
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',  -- important
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}



EOF

lua <<EOF

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
EOF


lua <<EOF
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
--local colors = {
--  blue   = '#80a0ff',
--  cyan   = '#79dac8',
--  black  = '#080808',
--  white  = '#c6c6c6',
--  red    = '#ff5189',
--  violet = '#d183e8',
--  grey   = '#303030',
--}
--
--local bubbles_theme = {
--  normal = {
--    a = { fg = colors.white, bg = colors.dark },
--    b = { fg = colors.white, bg = colors.dark },
--    c = { fg = colors.white, bg = colors.dark },
--  },
--
--  insert = {
--    a = { fg = colors.white, bg = colors.dark },
--    b = { fg = colors.white, bg = colors.dark },
--    c = { fg = colors.white, bg = colors.dark },
--  },
--  visual = {
--    a = { fg = colors.white, bg = colors.dark },
--    b = { fg = colors.white, bg = colors.dark },
--    c = { fg = colors.white, bg = colors.dark },
--  },
--  replace= {
--    a = { fg = colors.white, bg = colors.dark },
--    b = { fg = colors.white, bg = colors.dark },
--    c = { fg = colors.white, bg = colors.dark },
--  },
--  inactive= {
--    a = { fg = colors.white, bg = colors.dark },
--    b = { fg = colors.white, bg = colors.dark },
--    c = { fg = colors.white, bg = colors.dark },
--  },
--}
--
--require('lualine').setup {
--  options = {
--    theme = bubbles_theme,
--    component_separators = '|',
--    section_separators = { left = '', right = '' },
--  },
--  sections = {
--    lualine_a = {
--      { 'filename', separator = { left = '' }, right_padding = 2 },
--    },
--    lualine_b = {  },
--    lualine_c = {  },
--    lualine_x = {'branch'},
--    lualine_y = { 'progress' },
--    lualine_z = {
--      { 'location', separator = { right = '' }, left_padding = 2 },
--    },
--  },
--  inactive_sections = {
--    lualine_a = { 'filename' },
--    lualine_b = {},
--    lualine_c = {},
--    lualine_x = {},
--    lualine_y = {},
--    lualine_z = { 'location' },
--  },
--  tabline = {},
--  extensions = {},
--}

EOF
lua<<EOF
require("gitsigns").setup {
    signs = {
        add = {hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    watch_gitdir = {
        interval = 100
    },
    sign_priority = 5,

    status_formatter = nil, -- Use default

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

local cmd = vim.cmd

cmd "hi DiffAdd guifg=#81A1C1 guibg = none"
cmd "hi DiffChange guifg =#3A3E44 guibg = none"
cmd "hi DiffModified guifg = #81A1C1 guibg = none"


EOF

let g:AutoPairs['<']='>'
