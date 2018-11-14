" textobj-latex - Text objects for LaTeX code
" Author: Roberto Bonvallet <rbonvall@gmail.com>
" GetLatestVimScripts: 2100 1 textobj-user
" GetLatestVimScripts: 4506 1 :AutoInstall: textobj-latex"

if exists('g:loaded_textobj_latex')
  finish
endif

let s:re_begin = '\\begin{[^}]\+}'
let s:re_end = '\\end{[^}]\+}'


"
" Join alternatives for a regular expression
function! s:ReJoin(...)
  return join(a:000, '\|')
endfunction

"
" Make sure RE matches whole line
function! s:ReWholeLine(re)
  return '^\('.a:re.'\)\n'
endfunction


call textobj#user#plugin('latex', {
\  'environment': {
\    '*pattern*': [s:re_begin, s:re_end],
\    'select-a': 'ae',
\    'select-i': 'ie',
\  },
\  'outside-environ': {
\    '*sfile*': expand('<sfile>:p'),
\    'select-a': 'ar',  '*select-a-function*': 's:select_a',
\    'select-i': 'ir',  '*select-i-function*': 's:select_i'
\  },
\  'bracket-math': {
\    '*pattern*': ['\\\[', '\\\]'],
\    'select-a': 'ab',
\    'select-i': 'ib',
\  },
\  'paren-math': {
\     '*pattern*': ['\\(', '\\)'],
\     'select-a': 'a\',
\     'select-i': 'i\',
\   },
\  'dollar-math-a': {
\     '*pattern*': '[$][^$]*[$]',
\     'select': 'a$',
\   },
\  'dollar-math-i': {
\     '*pattern*': '[$]\zs[^$]*\ze[$]',
\     'select': 'i$',
\   },
\  'quote': {
\     '*pattern*': ['`', "'"],
\     'select-a': 'aq',
\     'select-i': 'iq',
\   },
\  'double-quote': {
\     '*pattern*': ['``', "''"],
\     'select-a': 'aQ',
\     'select-i': 'iQ',
\   },
\ })


function! s:select_a()
  " echom s:ReWholeLine(s:ReJoin(s:re_end, ''))
  let start_pos = search(s:ReWholeLine(s:ReJoin(s:re_end, '')), 'bnW')
  if 0 == start_pos
    return 0  " We did not find the start of the text object
  endif
  let end_pos = search(s:ReWholeLine(s:ReJoin(s:re_begin, '')), 'nW')
  if 0 == end_pos
    return 0  " We did not find the end of the text object
  endif
  return ['V', [0, start_pos, 0, 0], [0, end_pos, 0, 0]]
endfunction

function! s:select_i()
  let start_pos = search(s:ReWholeLine(s:ReJoin(s:re_end, '')), 'bnW')
  if 0 == start_pos
    return 0  " We did not find the start of the text object
  endif
  let end_pos = search(s:ReWholeLine(s:ReJoin(s:re_begin, '')), 'nW')
  if 0 == end_pos
    return 0  " We did not find the end of the text object
  endif
  return ['V', [0, start_pos + 1, 0, 0], [0, end_pos - 1, 0, 0]]
endfunction

let g:loaded_textobj_latex = 1
