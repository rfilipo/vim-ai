" vim-ai — K-AIDF integration for Vim
" A Vim front-end for the local `kob` CLI (K-AIDF framework).
" Developed with K-AIDF itself; see README.md and docs/.

if exists('g:loaded_vim_ai')
  finish
endif
let g:loaded_vim_ai = 1

" Configuration (override in your vimrc)
let g:vim_ai_kob   = get(g:, 'vim_ai_kob', 'kob')
let g:vim_ai_model = get(g:, 'vim_ai_model', '')

command! -nargs=? KobAudit     call vim_ai#Audit(<q-args>)
command! -nargs=+ KobChat      call vim_ai#Chat(<q-args>)
command! -nargs=* KobMentor    call vim_ai#Mentor(<q-args>)
command! -nargs=0 KobContracts call vim_ai#Contracts()
command! -nargs=0 KobApps      call vim_ai#Apps()
