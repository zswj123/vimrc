""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 界面 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set gfn=Monaco:h9
set lines=100 columns=115
set go=
" 设置半透明
" 另外需将resource目录下的dll文件放置到vim 二进制执行文件目录才可生效
if has('win32')
    au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)
endif

" 设置文件格式
set ff=unix

" 设置不自动换行，某一行的内容超长的情景
set nowrap

" 缩进
au BufNewFile, BufRead *.py,*.pyw setf python
set autoindent 
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" typescrpt tagbar支持
" 需执行如下命令: npm install --global git+https://github.com/Perlence/tstags.git
" 如果安装了cnpm可用cnpm代替npm
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
\ }         

" 关闭排序，按照标签本身在文件中的位置排序
let g:tagbar_sort = 0

" 设置tagbar宽度为25
let g:tagbar_width = 40

" 开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
" let g:tagbar_autopreview = 1

nmap <leader>mm :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TypeScript 折叠
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType typescript call TypeScriptFold()
au FileType typescript setl fen
au FileType typescript setl nocindent

au FileType typescript imap <c-t> $log();<esc>hi
au FileType typescript imap <c-a> alert();<esc>hi

au FileType typescript inoremap <buffer> $r return 
au FileType typescript inoremap <buffer> $f // --- PH<esc>FP2xi

function! TypeScriptFold() 
    setl foldmethod=syntax
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 左边窗口显示
let g:NERDTreeWinPos = 'left'
" 宽度25
" let g:NERDTreeWinSize = 25
" nmap <leader>a :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 运行 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 建议修改windows注册表，使cmd默认窗口为80列，25行
function! Run()
    let cmd_str = input('exec cmd: ')
    if has('win32')
        exec '!start cmd /c "title '.cmd_str.' && '.cmd_str.' && pause"'
    else
        exec cmd_str
    endif
    
endfunction

nmap <leader>r :call Run()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-vim 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("win32")) " windows系统下
    " 目前只支持python3.8
    set pythonthreedll=python38.dll
endif

let g:jedi#goto_assignments_command = "<C-]>"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<C-u>"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<C-r>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic 设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_python_exe = 'python3'
let g:syntastic_python_checkers = ['pylint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
