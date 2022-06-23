let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
let g:vim_json_conceal=0                "Disable quete canceling in JSON
set hidden                              " Required to keep multiple buffers open multiple bufferss
set relativenumber
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set autoindent                          " Good auto indent
set smartindent                         " Makes indenting smart
set laststatus=0                        " Always display the status line
set number                              " Line numbers
"set cursorline                          " Enable highlighting of the current line
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set lazyredraw
set autoread
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set path+=**
set showmatch                           "Show matching brackets
" no swap files
set noswapfile
set nobackup
set nowritebackup
set nowb
set colorcolumn=120                     "Set ruler after 120 symbols
set autoread
autocmd FocusGained * checktime
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
" You can't stop me
cmap w!! w !sudo tee %
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
autocmd bufnewfile,bufread *.js set filetype=javascript.jsx
augroup filetype javascript syntax=javascript
