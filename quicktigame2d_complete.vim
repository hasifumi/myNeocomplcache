function! neocomplcache#sources#quicktigame2d_complete#define()
        return s:source
endfunction

let s:source = {
  \ 'name' : 'quicktigame2d_complete',
  \ 'kind' : 'ftplugin',
  \ 'filetypes' : { 'test':1  }
  \ }

function! s:source.initialize()
  let s:keywords = []
	let s:objects = {
 \  'GameView': { 
 \    'member': { 'start' : 'f', 
 \                'stop' : 'f' , 
 \                'x' : 'v' , 
 \                'y' : 'v'
 \    },
 \    'create': 'createGameView',
 \  },
 \  'Scene': {
 \    'member': { 'add' : 'f', 'remove' : 'f' , 'alpha' : 'v' },
 \    'create': 'createScene',
 \  },
 \}
	let s:variables = {}
	let s:line = 0
endfunction

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text)
	if neocomplcache#within_comment()
		return -1
	endif
	if line(".") != s:line
		let s:line = line(".")
		call quicktigame2d_complete#get_all_variables()
	endif
	for word1 in keys(s:variables)
		if a:cur_text =~ word1
			for word in keys(s:objects[s:variables[word1]['type']]['member'])
			  call add(s:keywords, { 'word' : word1.".".word, 'menu': '[quicktigame2d]', 
				 \ 'kind' : s:objects[s:variables[word1]['type']]['member'][word]})
			endfor
			"echo 'word1. :' . word1."."
		  return match(a:cur_text, word1.".")
		  break
		endif
  endfor
endfunction

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)
  return neocomplcache#keyword_filter(copy(s:keywords), a:cur_keyword_str)
endfunction

function! quicktigame2d_complete#get_variables(line)
	let temp_line = substitute(a:line, '\s', '', 'g')
	"echo temp_line
	if temp_line =~ "=" && temp_line =~ "\\."
	"if match(temp_line, "\w*=\w*\\.\w*")
  	"let list = matchlist(temp_litemp_linene, '\(\w*\)\(=\)\(\w*\)')
  	let list = matchlist(temp_line, '\(\w*\)\(=\)\(\w*\)\(\.\)\(\w*\)')
		"echo 'list[5]:' . list[5] . ', list[4]:' . list[4] . ', list[3]:' . list[3]
		for k in keys(s:objects)
			"if (len(list) > 0 ) && (list[3] =~ s:objects[k]['create'])
			if (len(list) > 0 ) && (list[5] =~ s:objects[k]['create'])
				if !has_key(s:variables, list[1])
				  let s:variables[list[1]] = { 'type': k }
			  endif
			endif
		endfor
	endif
endfunction

function! quicktigame2d_complete#get_all_variables()
	let s:variables = {}
	let lines = getline(0, line("$"))
  for line in lines
    call quicktigame2d_complete#get_variables(line)
	endfor
endfunction

function! quicktigame2d_complete#show_all_variables()
	for i in keys(s:variables)
		echo ' key: ' . i . ', type: ' . s:variables[i]['type']
  endfor
endfunction

function! quicktigame2d_complete#test()
	let str = 'cc=gaicre'
	if str =~ "\."
		echo 'OK'
	else
		echo 'NG'
	endif
endfunction

"function! quicktigame2d_complete#get_space_col(str)
"	let s_pos = len(a:str) - 1
"	while s_pos >= 0
"		if strpart(a:str, s_pos, 1) =~ ' '
"			break
"		endif
"		let s_pos -= 1
"	endwhile
"	return s_pos
"endfunction
