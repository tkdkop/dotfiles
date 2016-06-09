" set verbosefile=./vim.log
" set verbose=2
"vein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let file_ignore_regex = ['\.pyc$', '\.min\.js$']  
let mapleader="\<Space>"

" Required:
set runtimepath^=/Users/logankopas/git/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/logankopas/git/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Plugins

call dein#add('danro/rename.vim')

call dein#add('Superbil/llvm.vim')

call dein#add('elixir-lang/vim-elixir')

" fuzzyfinder
call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'})
call dein#add('junegunn/fzf.vim')
" fzf mappings
let $FZF_DEFAULT_COMMAND='ag -l -g ""'
noremap <C-b> :Tags<CR>
noremap <C-p> :FZF -m<CR>
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf'

call dein#add('scrooloose/syntastic')
let g:syntastic_python_checkers=['flake8']
let g:syntastic_flake8_max_line_length='119'

call dein#add('nvie/vim-flake8')
" F7 to run 

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" powerline font stuff
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='bubblegum'
"set guifont=Inconsolata\ for\ Powerline:h15
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete.otf:h11
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

call dein#add('morhetz/gruvbox')

call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
" ctrl-n to open
" <t> to open in tab
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = file_ignore_regex
map <C-n> :NERDTreeToggle %<CR>
map <C-n>. :NERDTree %<CR>

"
call dein#add('kchmck/vim-coffee-script')
" vim-coffee
let coffee_compiler='/Users/logankopas/work/regiondb/node_modules/coffee-script/bin/coffee'
let coffee_make_options='--map'

call dein#add('yssl/QFEnter')
" space-tab to open quickfix in tab

call dein#add('sjl/gundo.vim')
" space-z to open gundo tree
nnoremap <leader>z :GundoToggle<CR>


call dein#add('rking/ag.vim')
" :Ag for search
nnoremap K :Ag "<C-R><C-W>"<CR>


call dein#add('tpope/vim-repeat')
" <.> repeats plugin commands

call dein#add('tpope/vim-surround')
" cs, ds, yss
" <command><selection><substitution>
" cs)' -> replace ) with '
" ysiw] -> surround word with []
" yss) -> surround line with ()
" } doesn't add space, { does

call dein#add('justinmk/vim-sneak')
" s{character}{character}
" like <f> navigation on steriods

call dein#add('tpope/vim-dispatch')
" for running things asynchronously

call dein#add('janko-m/vim-test')
" better test runner, lacks quickfix hotlinking
let test#strategy = "dispatch"
" run tests easily
nnoremap tt :TestLast<CR>
nnoremap tn :TestNearest<CR>
nnoremap tf :TestFile<CR>


call dein#add('terryma/vim-multiple-cursors')
" self explanatory
" because it overwrites ALL of my mappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-e>'
let g:multi_cursor_prev_key='<C-a>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

call dein#add('tpope/vim-abolish')
" for comprehensive text substitution

call dein#add('logan-ncc/vim-buffergator')
" for using buffers instead of tabs
let g:buffergator_suppress_keymaps=1
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
nnoremap <leader>b :BuffergatorToggle<CR>

call dein#add('christoomey/vim-tmux-navigator')
call dein#add('jceb/vim-orgmode')
nnoremap pp :split ~/todo.org<CR>
call dein#add('tpope/vim-speeddating')

call dein#add('ChrisPenner/vim-emacs-bindings')
" ctrl-a, ctrl-e, etc

call dein#add('junegunn/vim-easy-align')
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

call dein#add('mattn/emmet-vim')
" html creation
let g:user_emmet_mode='a'

call dein#add('chriskempson/vim-tomorrow-theme')

call dein#add('ConradIrwin/vim-bracketed-paste')
" allows you to <c-v> without setting paste

call dein#add('hynek/vim-python-pep8-indent')

call dein#add('Yggdroot/indentLine')

call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap UU :Unite<CR>
nnoremap UB :Unite -quick-match buffer<CR>
nnoremap UF :Unite file<CR>
" nnoremap <C-p> :Unite file_rec<CR>

call dein#add('mhinz/vim-startify')

call dein#add('junegunn/limelight.vim')
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

nnoremap <leader>l :Limelight!!<CR>


" call dein#add('zchee/deoplete-jedi')
call dein#add('davidhalter/jedi-vim')
call dein#add('ervandew/supertab')

let g:jedi#completions_enabled = 1
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_definitions_command = "L"
let g:jedi#documentation_command = "<leader>G"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:SuperTabDefaultCompletionType = "<C-n>"

call dein#add('ryanoasis/vim-devicons')

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
" imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
" 	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
" 	\ : (<SID>is_whitespace() ? "\<Tab>"
" 	\ : deoplete#mappings#manual_complete()))
" 
" smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
" 	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
" 	\ : (<SID>is_whitespace() ? "\<Tab>"
" 	\ : deoplete#mappings#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction

"''''''''''''''''''''''''' End plugins

set completeopt=menuone,preview

call dein#add('vim-scripts/indentpython.vim')
" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" defaults
" set whichwrap+=<,>,h,l,[,]
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=120
set expandtab
set fileformat=unix  " because screw windows
set laststatus=2  " makes powerline work
set showtabline=2  " always show the tab bar
set noshowmode  " powerline shows us what mode we're in, so vim doesn't have to
" set cursorline  " so I don't go searching for my cursor (I still do though)
set wildmenu  " tab completion in commands
set lazyredraw
set ttyfast
set showmatch
set mat=2
set foldenable
set foldlevelstart=99  " all open by default
set wildignore+=*.pyc,*/tmp/*,\.git/*,*.zip,*.gz,*.swp,*.min.js,js/*.js
set tags+=~/.mytags
set relativenumber  " YASSSSSSS
set timeoutlen=300
set ttimeoutlen=10
" * searching in visual mode
vnoremap <silent> * :call VisualSelection('f')<CR> 
vnoremap <silent> # :call VisualSelection('b')<CR>
" pasting in visual mode
xnoremap p pgvy
" because I like white screens
" highlight Visual term=reverse ctermbg=8 guibg=LightGrey
" highlight DiffChange cterm=None ctermfg=LightMagenta ctermbg=LightRed 
" highlight DiffText cterm=None
" Here's a vimdiff to try
" highlight DiffAdd cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
" highlight DiffDelete cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
" highlight DiffChange cterm=none ctermfg=fg ctermbg=Blue gui=none guifg=fg guibg=Blue
" highlight DiffText cterm=none ctermfg=bg ctermbg=White gui=none guifg=bg guibg=White
set background=dark
colorscheme gruvbox 
set t_ut=

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

"''''''''''''''''''''''''' end plugin config

syntax on
highlight BadWhitespace ctermbg=red guibg=darkred

nnoremap <leader>s :mksession<CR>
map j gj
map k gk
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif
map <leader>t :tab split<CR>

" practice not using arrows
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

" python files
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=120
    \ expandtab
    \ fileformat=unix
    \ foldmethod=indent
" this is so I can use my testrunners
au BufNewFile,BufRead *.py 
    \ let $DJANGO_SETTINGS_MODULE='deploy_settings.testing'
" web files
au BufNewFile,BufRead *.coffee,*.js,*.html,*.css,*.scss,*.rb
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
" flag bad whitespace as red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" compile coffeescript on save
au BufWritePost,FileWritePost *.coffee 
    \ silent make -o '%:p:h/../js/'
au FileType make 
    \ set noexpandtab
    \ shiftwidth=8
    \ softtabstop=0
au FileType org
    \ let maplocalleader='\'
au FileType org
    \ setlocal noautoindent
    \ nocindent
    \ nosmartindent
au BufWritePost,FileWritePost *.tex
    \ Make
" get rid of the __doc__ buffer after use
au BufWinEnter '__doc__' setlocal bufhidden=delete
au BufWinLeave,WinLeave * setlocal nocursorline
au BufWinEnter,WinEnter * setlocal cursorline
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" function to toggle relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>n :call ToggleNumber()<CR>

nnoremap <leader>c :cclose<CR>
nnoremap <leader>p :pclose<CR>

" Fix my clumsy fingers
iabbrev impoer import
iabbrev )L ):

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

function! s:tags_sink(line)
    let parts = split(a:line, '\t\zs')
    let excmd = matchstr(parts[2:], '^.*\ze;"\t')
    execute 'silent e' parts[1][:-2]
    let [magic, &magic] = [&magic, 0]
    execute excmd
    let &magic = magic
endfunction

function! s:tags()
    if empty(tagfiles())
        echohl WarningMsg
        echom 'Preparing tags'
        echohl None
        call system('ctags -R')
    endif

    call fzf#run({
                \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
                \            '| grep -v ^!',
                \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
                \ 'down':    '40%',
                \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
"''' example usage
" :args *.txt
" :vimgrep /Vimcasts\.\zscom/g ##
" :Qargs
" :argdo %s/Vimcasts\.\zscom/org/ge
" :argdo update

" XKCD jokes
nnoremap xk :.s/\(.*\)/\=system('a='."https:\/\/api.stackexchange.com\/2.2\/".'; q=`curl -s -G --data-urlencode "q='.submatch(1).'" --compressed "'."${a}search\/advanced?order=desc&sort=relevance&site=stackoverflow".'" \| python -c "'."exec(\\\"import sys \\nimport json\\nprint(json.loads(''.join(sys.stdin.readlines()))['items'][0]['question_id'])\\\")".'"`; curl -s --compressed "'."${a}questions\/$q\/answers?order=desc&sort=votes&site=stackoverflow&filter=withbody".'" \| python -c "'."exec(\\\"import sys\\nimport json\\nprint(json.loads(''.join(sys.stdin.readlines()))['items'][0]['body']).encode('utf8')\\\")".'"')/<CR>

" http://vim.wikia.com/wiki/Deleting_a_buffer_without_closing_the_window
"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" Create a mapping (e.g. in your .vimrc) like this:
nmap bd <Plug>Kwbd

" edit vimrc and load it
nnoremap <leader>ev :vsp $HOME/dotfiles/nvim/init.vim<CR> 
nnoremap <leader>sv :source $HOME/dotfiles/nvim/init.vim<CR>

inoremap <C-k>     <Plug>(neosnippet_expand_or_jump)
snoremap <C-k>     <Plug>(neosnippet_expand_or_jump)
xnoremap <C-k>     <Plug>(neosnippet_expand_target)

if has('nvim')
  " Hack to get C-h working in NeoVim
  nmap <BS> <C-W>h
endif

tmap <esc> <C-\><C-n>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tmap <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

inoremap # X<C-h>#
set cinkeys-=0#
set indentkeys-=0#
set incsearch
