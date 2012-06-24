function! neocomplcache#sources#timobile_complete#define()
        return s:source
endfunction

let s:source = {
  \ 'name' : 'timobile_complete',
  \ 'kind' : 'ftplugin',
  \ 'filetypes' : { 'test': 1, 'coffee': 1  }
  \ }

function! s:source.initialize()
  let s:keywords = []
  let s:objects = {
 \  'Window': { 
 \    'member': { 'open' : 'f', 
 \                'add' : 'f' , 
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'title' : 'v' , 
 \                'height' : 'v' , 
 \                'width' : 'v',
 \                'fullscreen' : 'v' , 
 \                'orientationModes' : 'v' , 
 \                'tabBarHidden' : 'v'
 \    },
 \    'create': 'createWindow',
 \  },
 \  'tabGroup': {
 \    'member': { 'addTab' : 'f', 
 \                'open' : 'f' , 
 \                'removeTab' : 'f' , 
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'activeTab' : 'v' ,
 \                'tabs' : 'v'
 \    },
 \    'create': 'createTabGroup',
 \  },
 \  'View': {
 \    'member': { 'add' : 'f', 
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'remove' : 'f' , 
 \                'hide' : 'f' , 
 \                'show' : 'f' , 
 \                'title' : 'v' ,
 \                'backgroundColor' : 'v' , 
 \                'borderColor' : 'v' , 
 \                'borderWidth' : 'v' , 
 \                'borderRadius' : 'v' , 
 \                'top' : 'v' , 
 \                'bottom' : 'v' , 
 \                'left' : 'v' , 
 \                'right' : 'v' , 
 \                'zIndex' : 'v' , 
 \                'opacity' : 'v' , 
 \                'transform' : 'v' , 
 \                'height' : 'v' , 
 \                'width' : 'v'
 \    },
 \    'create': 'createView',
 \  },
 \  'TableView': {
 \    'member': { 'add' : 'f', 
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'remove' : 'f' , 
 \                'hide' : 'f' , 
 \                'show' : 'f' , 
 \                'title' : 'v' ,
 \                'backgroundColor' : 'v' , 
 \                'borderColor' : 'v' , 
 \                'borderWidth' : 'v' , 
 \                'borderRadius' : 'v' , 
 \                'top' : 'v' , 
 \                'bottom' : 'v' , 
 \                'left' : 'v' , 
 \                'right' : 'v' , 
 \                'zIndex' : 'v' , 
 \                'opacity' : 'v' , 
 \                'transform' : 'v' , 
 \                'height' : 'v' , 
 \                'width' : 'v',
 \                'appendRow' : 'f',
 \                'deleteRow' : 'f',
 \                'selectRow' : 'f',
 \                'updateRow' : 'f',
 \                'setData' : 'f',
 \                'data' : 'v',
 \                'headerTitle' : 'v',
 \                'footerTitle' : 'v',
 \                'rowHeight' : 'v',
 \                'separatorColor' : 'v'
 \    },
 \    'create': 'createTableView',
 \  },
 \  'WebView': {
 \    'member': { 'add' : 'f',
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'remove' : 'f' ,
 \                'hide' : 'f' ,
 \                'show' : 'f' , 
 \                'title' : 'v' ,
 \                'backgroundColor' : 'v' , 
 \                'borderColor' : 'v' , 
 \                'borderWidth' : 'v' , 
 \                'borderRadius' : 'v' , 
 \                'top' : 'v' , 
 \                'bottom' : 'v' , 
 \                'left' : 'v' , 
 \                'right' : 'v' , 
 \                'zIndex' : 'v' , 
 \                'opacity' : 'v' , 
 \                'transform' : 'v' , 
 \                'height' : 'v' , 
 \                'width' : 'v',
 \                'canGoBack' : 'f',
 \                'canGoForward' : 'f',
 \                'evalJS' : 'f',
 \                'goBack' : 'f',
 \                'goForward' : 'f',
 \                'reload' : 'f',
 \                'data' : 'v',
 \                'html' : 'v',
 \                'url' : 'v'
 \    },
 \    'create': 'createWebView',
 \  },
 \  'Button': {
 \    'create': 'createButton',
 \    'member': { 'add' : 'f',
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'remove' : 'f' ,
 \                'hide' : 'f' ,
 \                'show' : 'f' , 
 \                'title' : 'v' ,
 \                'backgroundColor' : 'v' , 
 \                'borderColor' : 'v' , 
 \                'borderWidth' : 'v' , 
 \                'borderRadius' : 'v' , 
 \                'top' : 'v' , 
 \                'bottom' : 'v' , 
 \                'left' : 'v' , 
 \                'right' : 'v' , 
 \                'zIndex' : 'v' , 
 \                'opacity' : 'v' , 
 \                'transform' : 'v' , 
 \                'height' : 'v' , 
 \                'width' : 'v',
 \                'color' : 'v',
 \                'selectedColor' : 'v'
 \    },
 \  },
 \  'Label': {
 \    'create': 'createLabel',
 \    'member': { 'add' : 'f',
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'remove' : 'f' ,
 \                'hide' : 'f' ,
 \                'show' : 'f' , 
 \                'title' : 'v' ,
 \                'backgroundColor' : 'v' , 
 \                'borderColor' : 'v' , 
 \                'borderWidth' : 'v' , 
 \                'borderRadius' : 'v' , 
 \                'top' : 'v' , 
 \                'bottom' : 'v' , 
 \                'left' : 'v' , 
 \                'right' : 'v' , 
 \                'zIndex' : 'v' , 
 \                'opacity' : 'v' , 
 \                'transform' : 'v' , 
 \                'height' : 'v' , 
 \                'width' : 'v',
 \                'text' : 'v',
 \                'textAlign' : 'v'
 \    },
 \  },
 \  'TextField': {
 \    'create': 'createTextField',
 \    'member': { 'add' : 'f',
 \                'addEventListener' : 'f' , 
 \                'fireEvent' : 'f' , 
 \                'removeEventListener' : 'f' , 
 \                'remove' : 'f' ,
 \                'hide' : 'f' ,
 \                'show' : 'f' , 
 \                'title' : 'v' ,
 \                'backgroundColor' : 'v' , 
 \                'borderColor' : 'v' , 
 \                'borderWidth' : 'v' , 
 \                'borderRadius' : 'v' , 
 \                'top' : 'v' , 
 \                'bottom' : 'v' , 
 \                'left' : 'v' , 
 \                'right' : 'v' , 
 \                'zIndex' : 'v' , 
 \                'opacity' : 'v' , 
 \                'transform' : 'v' , 
 \                'height' : 'v' , 
 \                'width' : 'v',
 \                'blur' : 'f',
 \                'focus' : 'f',
 \                'autocorrect' : 'v',
 \                'autocapitalization' : 'v',
 \                'borderStyle' : 'v',
 \                'editable' : 'v',
 \                'hintText' : 'v',
 \                'keybordType' : 'v',
 \                'passwordMask' : 'v',
 \                'value' : 'v'
 \    },
 \  },
 \}
" \  'Tab': {
" \    'member': { 'badge' : 'v', 
" \                'addEventListener' : 'f' , 
" \                'fireEvent' : 'f' , 
" \                'removeEventListener' : 'f' , 
" \                'icon' : 'v' ,
" \                'title' : 'v' ,
" \                'window' : 'v'
" \    },
" \    'create': 'createTab',
" \  },
" \  'TableViewRow': {
" \    'create': 'createTableViewRow',
" \    'member': { 'title' : 'v', 
" \                'Color' : 'v',
" \                'selectedColor' : 'v',
" \                'hasChild' : 'v',
" \                'hasDetail' : 'v',
" \                'hasCheck' : 'v'
" \                'addEventListener' : 'f' , 
" \                'fireEvent' : 'f' , 
" \                'removeEventListener' : 'f' , 
" \    },
" \  },
  let s:variables = {}
  let s:line = 0
  let s:temp_objects = {}
endfunction

function! s:source.finalize()
  unlet s:objects
  unlet s:temp_objects
  unlet s:keywords
  unlet s:line
  unlet s:variables
endfunction

function! timobile_complete#initialize()
  call s:source.finalize()
  call s:source.initialize()
  "let s:temp_objects["test"] = {}
endfunction

function! s:source.get_keyword_pos(cur_text)
  if neocomplcache#within_comment()
    return -1
  endif
  if line(".") != s:line
    let s:line = line(".")
    call timobile_complete#get_all_variables()
  endif
  for word1 in keys(s:variables)
    if a:cur_text =~ word1
      for word in keys(s:objects[s:variables[word1]['type']]['member'])
        call add(s:keywords, { 'word' : word1.".".word, 'menu': '[timobile]', 
         \ 'kind' : s:objects[s:variables[word1]['type']]['member'][word]})
      endfor
      return match(a:cur_text, word1.".")
      break
    endif
  endfor
endfunction

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)
  return neocomplcache#keyword_filter(copy(s:keywords), a:cur_keyword_str)
endfunction

function! timobile_complete#get_variables(line)
  let temp_line = substitute(a:line, '\s', '', 'g')
  if temp_line =~ "=" && temp_line =~ "\\."
    let list = matchlist(temp_line, '\(\w*\)\(=\)\(\w*\)\(\.\)\(\w*\)\(\.\)\(\w*\)')
    for k in keys(s:objects)
      if (len(list) > 0 ) && (list[7] =~ s:objects[k]['create'])
        if !has_key(s:variables, list[1])
          let s:variables[list[1]] = { 'type': k }
        endif
      endif
    endfor
  endif
endfunction

function! timobile_complete#get_all_variables()
  let s:variables = {}
  let lines = getline(0, line("$"))
  for line in lines
    call timobile_complete#get_variables(line)
  endfor
endfunction

function! timobile_complete#show_all_variables()
  for i in keys(s:variables)
    echo ' key: ' . i . ', type: ' . s:variables[i]['type']
  endfor
endfunction

function! timobile_complete#show_all_objects()
  for i in keys(s:objects)
    echo ' key: ' . i 
  endfor
endfunction

function! timobile_complete#test()
  echo s:temp_objects
endfunction

function! timobile_complete#add_temp_object(class, member, kind)
  echo "class:" . a:class . ", member:" . a:member . ", kind:" . a:kind
  if has_key(s:temp_objects, a:class)
    echo "has class"
    if has_key(s:temp_objects[a:class]["member"], a:member)
      echo "has member"
    else
      let s:temp_objects[a:class]["member"][a:member] = a:kind
    endif
  else
    if empty(a:member) || empty(a:kind)
      let s:temp_objects[a:class] = {'member':{}, 'create':'new'}
    else
      let s:temp_objects[a:class] = {'member':{}, 'create':'new'}
      let s:temp_objects[a:class]["member"][a:member] = a:kind
    "if has_key(s:temp_objects[a:class], member)
    "  echo "has member"
    endif
  endif
  ""if !has_key(s:temp_objects, a:class)
  "  if !has_key(s:temp_objects[a:class]["member"], a:member)
  "    let s:temp_objects[a:class] = {'create': 'new'}
  "    let s:temp_objects[a:class]["member"][a:class] = a:kind
  "  endif
  "  "if !has_key(s:temp_objects[a:class], "create")
  "  "  let s:temp_objects[a:class]["create"] = "new"
  "  "endif
  "endif
endfunction

function! timobile_complete#show_all_temp_objects()
  "echo " show all temp objects"
  for i in keys(s:temp_objects)
    echo 'key:' . i
    "for j in keys(s:temp_objects[i])
    "  let values = values(s:temp_objects[i])
    "  echo ' key1:' . i . ', keys2:' . s:temp_objects[i] . ', values:' . values
    "endfor
  endfor
endfunction

"function! timobile_complete#get_space_col(str)
"  let s_pos = len(a:str) - 1
"  while s_pos >= 0
"    if strpart(a:str, s_pos, 1) =~ ' '
"      break
"    endif
"    let s_pos -= 1
"  endwhile
"  return s_pos
"endfunction
