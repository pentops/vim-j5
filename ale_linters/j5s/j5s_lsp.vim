call ale#Set('j5s_lsp_executable', 'j5')

function! ale_linters#j5s#j5s_lsp#GetProjectRoot(buffer) abort
    let l:root_file = ale#path#FindNearestFile(a:buffer, 'j5.yaml')

    return !empty(l:root_file) ? fnamemodify(l:root_file, ':h') : ''
endfunction

call ale#linter#Define('j5s', {
\   'name': 'j5s_lsp',
\   'lsp': 'stdio',
\   'executable': {b -> ale#Var(b, 'j5_lsp_executable')},
\   'command': '%e lsp',
\   'project_root': function('ale_linters#j5s#j5s_lsp#GetProjectRoot'),
\})
