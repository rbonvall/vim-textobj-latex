if exists('g:loaded_textobj_latex')
  finish
endif

call textobj#user#plugin('latex', {
\    })

let g:loaded_textobj_latex = 1

