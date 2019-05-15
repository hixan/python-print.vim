" warning generating function (curtosy of https://vi.stackexchange.com/questions/13384/echo-highlighted-warning-in-one-line)

function! EchoWarning(msg)
  echohl WarningMsg
  echo "Warning"
  echohl None
  echon ': ' a:msg
endfunction

" print a warning if PPCOUNTER is already present in document.
let l:PresentWarning = search('PPCOUNTER', 'n')
if l:PresentWarning > 0
	call EchoWarning(join(['PPCOUNTER is already contained ', l:PresentWarning,' times within this file. ']))
endif
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
	" find file counter, create if not present
	if search('PPCOUNTER=\d', 'e') == 0
		call PPInsertCounter()
	endif
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
	while search('# PPCOUNTER', 'w') > 0
		normal! dd
	endwhile

	" reset environment and position
	call setpos('.', l:pos)
	let &clipboard=l:clip
endfunction
	
