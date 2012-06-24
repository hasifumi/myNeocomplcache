function! test#test1()"{{{
  echo "test1!"
endfunction"}}}

function! test#test2()"{{{
  "let str = " aa = require(\"AA\").AA "
  let str = " aa = require('AA').AA "
  let aft0 = substitute(str, " ", "", "g")
  echo "aft0:" . aft0
  let aft1 = substitute(aft0, "'", "\"", "g")
  echo "aft1:" . aft1
  if aft1 =~ "require"
    echo "found require"
  endif
  let list = matchlist(aft1, '\(\w*\)=\w*("\(\w*\)"')
  echo list[2]
  call test#test3(list[2])
endfunction"}}}

function! test#test3(filename)"{{{
  "let base = "./" . "AA" . ".coffee"
  let base = "./" . a:filename . ".coffee"
  "echo base
  let filelist = glob(base)
  let splitted = split(filelist)
  for file in splitted
    "echo file
    if filereadable(file)
      "echo "readable!"
      for line in readfile(file)
        echo line
      endfor
    endif
  endfor
endfunction"}}}

function! test#test4()"{{{
  call test#test3("AA")
endfunction"}}}

function! test#test5()"{{{
  let str = "  self.aa = ()->  "
  "if a:line =~ ""
  "  let str = "  self.aa = ()->  "
  "else
  "  let str = a:line
  "endif
  let aft0 = substitute(str, " ", "", "g")
  echo "aft0:" . aft0
  if aft0 =~ "->"
    echo "found coffee function"
  endif
  let list = matchlist(aft0, '\w*\.\(\w*\)=\.*')
  echo list[1]
endfunction"}}}

