function! PPInsertCounter()
	let l:pos = getcurpos()
	let l:pos[1] += 1
	normal! 0gg
	normal! O# PPCOUNTER=0
	call setpos('.', l:pos)
endfunction

function! PPInsertCounterPrint()
	" use a different clipboard so the users doesnt get messed up
	let l:clip = &clipboard
	set clipboard=

	" save position
	let l:pos = getcurpos()
	" find file counter, create if not present
	if search('PPCOUNTER=\d', 'e') == 0
		call PPInsertCounter()
		call PPInsertCounterPrint()
	else
		normal! yiw
		normal! 
		call setpos('.', l:pos)
		normal! oprint('
		normal! pA')  # PPCOUNTER
	endif

	let &clipboard=l:clip
	
endfunction

function! PPValuePrint()
	" use a different clipboard so the users doesnt get messed up
	let l:clip = &clipboard
	set clipboard=

	" save position
	let l:pos = getcurpos()

	normal! yiw
	normal! oprint('
	normal! pA', 
	normal! pA)  # PPCOUNTER

	let &clipboard=l:clip
endfunction

function! PPClearPrints()
	" use a different clipboard so the users doesnt get messed up
	let l:clip = &clipboard
	set clipboard=

	" save position
	let l:pos = getcurpos()
	while search('# PPCOUNTER', 'w') > 0
		normal! dd
	endwhile

	" reset environment and position
	call setpos('.', l:pos)
	let &clipboard=l:clip
endfunction
	
