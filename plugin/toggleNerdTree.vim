" toggle nerd tree

function! ToggleNERDTree()
  let w:jumpbacktohere = 1
  " Detect which plugins are open
  if exists('t:NERDTreeBufName')
    let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
  else
    let nerdtree_open = 0
  endif

  " Perform the appropriate action
  if nerdtree_open
    NERDTreeClose
  else
    NERDTree
  endif

  " Jump back to the original window
  for window in range(1, winnr('$'))
    execute window . 'wincmd w'
    if exists('w:jumpbacktohere')
      unlet w:jumpbacktohere
      break
    endif
  endfor
endfunction

command! ToggleNERDTree
      \ call ToggleNERDTree()

nnoremap <silent><leader>n :ToggleNERDTree<cr>

