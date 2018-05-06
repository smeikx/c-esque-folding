setlocal foldmethod=expr
setlocal foldexpr=Get_Fold(v:lnum)


function! Indent_Level(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction


function! Get_Fold(lnum)

	if getline(a:lnum) =~? '\v^s*$'
		return '-1'
	endif

	let this_indent = Indent_Level(a:lnum)
	if getline(a:lnum) =~? '\v^\s*(((\{|\});?)|((\w\s*)+:))\s*$'
		return this_indent + 1
	else
		return this_indent
	endif

endfunction

