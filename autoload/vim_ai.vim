" vim-ai — core functions
" Thin, honest shell over the local `kob` CLI: detect the project root,
" invoke kob, render the result in a scratch split.

" Project root: nearest ancestor holding .kaidf/, else the cwd.
function! vim_ai#ProjectRoot() abort
  let l:dir = expand('%:p:h')
  if empty(l:dir)
    let l:dir = getcwd()
  endif
  let l:found = finddir('.kaidf', l:dir . ';')
  if !empty(l:found)
    return fnamemodify(l:found, ':p:h:h')
  endif
  return getcwd()
endfunction

function! s:KobCmd() abort
  let l:cmd = g:vim_ai_kob
  if !empty(g:vim_ai_model)
    let l:cmd .= ' --model ' . shellescape(g:vim_ai_model)
  endif
  return l:cmd
endfunction

" Render lines in a scratch split (reused per title).
function! s:Show(title, lines) abort
  let l:bufname = '[vim-ai] ' . a:title
  let l:win = bufwinnr(l:bufname)
  if l:win > 0
    execute l:win . 'wincmd w'
    setlocal modifiable
    silent %delete _
  else
    execute 'botright split ' . fnameescape(l:bufname)
    setlocal buftype=nofile bufhidden=hide noswapfile
  endif
  call setline(1, a:lines)
  setlocal nomodifiable
  wincmd p
endfunction

" :KobAudit [path] — run `kob audit` and show the scorecard.
function! vim_ai#Audit(...) abort
  let l:target = a:0 >= 1 && !empty(a:1) ? a:1 : vim_ai#ProjectRoot()
  if !executable(g:vim_ai_kob)
    echohl ErrorMsg | echomsg 'vim-ai: kob executable not found: ' . g:vim_ai_kob | echohl None
    return
  endif
  echomsg 'vim-ai: running kob audit on ' . l:target . ' …'
  let l:out = systemlist(s:KobCmd() . ' audit ' . shellescape(l:target))
  call s:Show('audit', l:out)
endfunction

" :KobChat {prompt} — ask the project's model, current buffer as context.
" Integration point: the model round-trip is rendered in the chat split;
" wiring to the kob chat surface lands with the generated implementation.
function! vim_ai#Chat(prompt) abort
  let l:lines = ['# vim-ai chat', '', 'Project: ' . vim_ai#ProjectRoot(),
        \ 'Prompt: ' . a:prompt, '',
        \ '(model round-trip integration point — see docs/03_design_simulation/blueprint.md)']
  call s:Show('chat', l:lines)
endfunction

" :KobMentor [answer] — continue the mentor workflow from the editor.
" Integration point: mirrors `mentor` in the kob shell.
function! vim_ai#Mentor(...) abort
  let l:lines = ['# vim-ai mentor', '', 'Project: ' . vim_ai#ProjectRoot(), '',
        \ '(mentor workflow integration point — see docs/03_design_simulation/blueprint.md)']
  call s:Show('mentor', l:lines)
endfunction

" :KobContracts — list contracts/ of the project (id + title from contract.json).
function! vim_ai#Contracts() abort
  let l:root = vim_ai#ProjectRoot() . '/contracts'
  let l:lines = ['# contracts — ' . l:root, '']
  let l:dirs = filter(glob(l:root . '/*', 0, 1), 'isdirectory(v:val)')
  if empty(l:dirs)
    call add(l:lines, '(no contracts yet — create one with the mentor flow or contract-create)')
  endif
  for l:d in l:dirs
    call add(l:lines, '- ' . fnamemodify(l:d, ':t'))
  endfor
  call s:Show('contracts', l:lines)
endfunction

" :KobApps — list apps/ of the project (instant apps).
function! vim_ai#Apps() abort
  let l:root = vim_ai#ProjectRoot() . '/apps'
  let l:lines = ['# instant apps — ' . l:root, '']
  let l:dirs = filter(glob(l:root . '/*', 0, 1), 'isdirectory(v:val)')
  if empty(l:dirs)
    call add(l:lines, '(no instant apps yet — create one with app-create)')
  endif
  for l:d in l:dirs
    call add(l:lines, '- ' . fnamemodify(l:d, ':t'))
  endfor
  call s:Show('apps', l:lines)
endfunction
