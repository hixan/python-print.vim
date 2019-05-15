" essentially just a macro
function PPInsertCounter()
	let l:pos = getcurpos()
	let l:pos[1] += 1
	normal! 0gg
	normal! O# PPCOUNTER=0
	call setpos('.', l:pos)
endfunction

function PPInsertCounterPrint()
	" use a different clipboard so the users doesnt get messed up
	let l:clip = &clipboard
	set clipboard=

	" save position
	let l:pos = getcurpos()
	" find file counter
	call search('PPCOUNTER=\d', 'e')
	normal! yiw
	normal! 
	call setpos('.', l:pos)
	normal! oprint('
	normal! pA')  # PPCOUNTER

	let &clipboard=l:clip
	
endfunction

function PPClearPrints()
	" use a different clipboard so the users doesnt get messed up
	let l:clip = &clipboard
	set clipboard=

	" save position
	let l:pos = getcurpos()
	echo l:pos[1]
	let l:pos[1] += -1
	echo l:pos[1]
	while search('# PPCOUNTER', 'w') > 0
		normal! dd
		if getcurpos()[1] <= l:pos[0]
			" adjust for removed lines (before this line)
			let l:pos[1] +=-1
		endif
		echo l:pos[1]
	endwhile
	let l:pos[1] +=-1

	" reset environment and position
	call setpos('.', l:pos)
	let &clipboard=l:clip
endfunction
	
