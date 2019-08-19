" Remap if_ to if
:inoremap if_ if () {<CR>}<esc>k<esc>4li

" Remap ie_ to if/else
:inoremap ie_ if () {<cr>} else {<cr>}<esc>kk<esc>4li

" Remap iee_ to if/elseif/else
:inoremap iee_ if () {<cr>} elseif () {<cr>} else {<cr>}<esc>2k<esc>4li

" Remap fn_ to function
:inoremap fn_ function () {<cr>}<esc>kf(i

" Remap pr_ to print "<pre>" . print_r(, true) . "</pre>";
:inoremap pr_ print "<pre>" . print_r(, true) . "</pre>";<esc>F,i
