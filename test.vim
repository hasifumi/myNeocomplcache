function! test#test1()
  echo "test1!"
endfunction

function! test#test2()
  "let str = " aa = require(\"AA\").AA "
  let str = " aa = require('AA').AA "
  let aft0 = substitute(str, " ", "", "g")
  echo "aft0:" . aft0
  let aft1 = substitute(aft0, "'", "\"", "g")
  echo "aft1:" . aft1
  if aft1 =~ "require"
    echo "found require"
  endif
  "echo matchlist(aft1, '\(\w*\)(=\)\(\w*\)("\(\w*\)"')
  echo matchlist(aft1, '\(\w*\)=\w*("\(\w*\)"')
endfunction
