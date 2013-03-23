if exists('g:loaded_textobj_latex')
  finish
endif

call textobj#user#plugin('latex', {
\   'environment': {
\     '*pattern*': ['\s*\\begin{[^}]\+}\s*\n\?', '\n\?\s*\\end{[^}]\+}'],
\     'select-a': 'ae',
\     'select-i': 'ie',
\   },
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

let g:loaded_textobj_latex = 1

