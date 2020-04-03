setlocal tabstop=2
setlocal backspace=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=100
augroup js_linting
  autocmd!

  let b:neomake_javascript_enabled_makers = []
  let b:neomake_jsx_enabled_makers = []

  let s:eslint_d_exe = nrun#Which('eslint_d')

  let s:eslint_config = nrun#Where('.eslintrc.json')
  if s:eslint_config == ".eslintrc.json not found"
    let s:eslint_config = nrun#Where('.eslintrc.js')
  endif

  if s:eslint_d_exe != "eslint_d not found"
    let b:neomake_javascript_enabled_makers = ['eslint_d']
    let b:neomake_jsx_enabled_makers = ['eslint_d']

    let b:neoformat_javascript_eslint_d = {
          \ 'exe': s:eslint_d_exe,
          \ 'args': ['--stdin', '--fix-to-stdout', '-c', '"' . s:eslint_config . '"', '--no-eslintrc'],
          \ 'replace': 0,
          \ 'stdin': 1,
          \ 'no_append': 0
          \ }
    let b:neoformat_enabled_javascript = ['eslint_d']

    autocmd BufEnter *.jsx\= let b:neomake_javascript_eslint_d_exe = s:eslint_d_exe
    autocmd BufEnter *.jsx\= let b:neomake_javascript_eslint_d_args = neomake#makers#ft#javascript#eslint()['args'] + ['-c', s:eslint_config, '--no-eslintrc']
    autocmd VimLeave * call system(s:eslint_d_exe . ' stop')
  else
    let s:eslint_exe = nrun#Which('eslint')
    if s:eslint_exe != "eslint not found"
      let b:neomake_javascript_enabled_makers = ['eslint']
      let b:neomake_jsx_enabled_makers = ['eslint']

      " Currently produces empty files:
      " let b:neoformat_javascript_eslint = {
      "       \ 'exe': s:eslint_exe,
      "       \ 'args': ['--fix-dry-run', '-c', '"' . s:eslint_config . '"', '--no-eslintrc'],
      "       \ 'replace': 0,
      "       \ 'stdin': 0,
      "       \ 'no_append': 0
      "       \ }
      " let b:neoformat_enabled_javascript = ['eslint']

      autocmd BufEnter *.jsx\= let b:neomake_javascript_eslint_exe = s:eslint_exe
      autocmd BufEnter *.jsx\= let b:neomake_javascript_eslint_args = neomake#makers#ft#javascript#eslint()['args'] + ['-c', s:eslint_config, '--no-eslintrc']
    endif
  endif

  if len(b:neomake_javascript_enabled_makers) == 1
    autocmd BufWritePost * Neomake
  endif
augroup END
