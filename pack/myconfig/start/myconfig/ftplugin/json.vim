augroup json_linting
  autocmd!

  let b:neoformat_json_prettier_simple = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }
  let b:neoformat_enabled_json = ['prettier_simple']
augroup END
