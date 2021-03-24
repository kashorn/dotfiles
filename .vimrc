" You'll use these and like it
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap j gj
nnoremap k gk
set scrolloff=5
"set noerrorbells
"set visualbell
"set t_vb=


" ----  Useful Functions ----
"disabling this: autocmd bufwritepost .vimrc source $MYVIMRC

function! CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction
command! -nargs=+ CommandCabbr call CommandCabbr(<f-args>)
" Use it on itself to define a simpler abbreviation for itself.
" CommandCabbr ccab CommandCabbr

" Organize backups, swapfiles, and undo history
"set backupdir=~/.vim/backups
"set directory=~/.vim/swaps
"if exists("&undodir")
"    set undodir=~/.vim/undo
"endif

"line numbering
" auto number in insert mode, relative on exit insert
set number
function! NumberStyleToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
function! NumberToggle()
    if(&relativenumber == 1 || &number == 1)
        set number
        set nonumber
    else
        set relativenumber
    endif
endfunc
noremap <Leader>n :call NumberStyleToggle()<cr>
noremap <F5> :call NumberToggle()<cr>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set title
set ruler

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab "uses spaces instead of tabs
retab

set wildmenu
set wildmode=list:longest,full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

"set paste
nnoremap <Leader>p :set invpaste paste?<CR>
set pastetoggle=<Leader>p
set showmode

filetype on
filetype plugin on
filetype plugin indent on
set autoindent
"autoindent entire doc
map <F7> mzgg=G`z<CR> 

syntax on
syntax enable

set showcmd
set showmatch

set hlsearch
set incsearch
noremap <F6> :noh<CR>
set ic "case insensitive
"set noic "case sensitive
set smartcase


" ---- splits ----
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>r :resize 
nnoremap <Leader>vr :vertical resize 
call CommandCabbr("vres", "vertical\ resize") "cabbrev vres vertical resize

set mouse=a

" -- Do all custom coloring after background and colorscheme are set -- "
set background=dark
colorscheme slate "or dessert
 "cterm = (none | bold | underline | reverse | italic)
 "ctermfc|ctermbg = (red | yellow | green | blue | magenta | cyan | black | gray)
 "  colors can also be "darkred, darkgreen, ...
 "
 "interesting highlight groups not currently used
 "  Directory, VertSplit, IncSearch, MatchParen, ModeMsg, NonText, Question,
 "  Search, Title, Visual, WildMenu
hi TabLineFill ctermfg=DarkGray ctermbg=White
hi TabLine ctermfg=White ctermbg=DarkGray
hi TabLineSel ctermfg=White ctermbg=DarkYellow
hi LineNr ctermfg=DarkYellow ctermbg=none
hi CursorLine cterm=none ctermbg=darkgray ctermfg=none
hi CursorColumn cterm=none ctermbg=darkgray ctermfg=none
hi StatusLine ctermbg=DarkGreen ctermfg=Black cterm=none
hi StatusLineNC ctermbg=DarkCyan ctermfg=Black cterm=none
hi VertSplit ctermbg=DarkCyan ctermfg=Black cterm=none
"hi Search ctermfg=White ctermbg=DarkGreen cterm=bold
"hi IncSearch ctermfg=White ctermbg=DarkGreen cterm=bold
hi MatchParen ctermfg=Black ctermbg=Cyan cterm=bold

set list
set listchars=tab:>·,trail:·,extends:#,nbsp:·

