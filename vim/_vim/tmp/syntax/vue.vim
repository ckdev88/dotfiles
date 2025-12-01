vim9script

if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

# Define the closing tag patterns first
syntax match vueScriptClosingTag "^</script>" contained
syntax match vueStyleClosingTag "^</style>" contained
syntax match vueTemplateClosingTag "^</template>" contained

# TypeScript in script tags - match from start of line
if !empty(globpath(&runtimepath, 'syntax/typescript.vim', 1))
  syntax include @typescript syntax/typescript.vim
  unlet! b:current_syntax

  syntax region vueTypescript
        \ start=+^<script[^>]*>+
        \ end=+^</script>+me=s-1
        \ contains=@typescript,htmlTag
        \ keepend
        \ fold

  syntax match vueScriptClosingRegion "^</script>" contains=vueScriptClosingTag

  # Set comment string for TypeScript regions
  syntax cluster typescriptTop add=vueTypescriptComment
endif

# Template - use transparent to allow HTML syntax through
syntax region vueTemplate
      \ start=+^<template[^>]*>+
      \ end=+^</template>+me=s-1
      \ transparent
      \ contains=TOP
      \ keepend
      \ fold

syntax match vueTemplateClosingRegion "^</template>" contains=vueTemplateClosingTag

# CSS in style tags - match from start of line
if !empty(globpath(&runtimepath, 'syntax/css.vim', 1))
  syntax include @css syntax/css.vim
  unlet! b:current_syntax

  syntax region vueStyle
        \ start=+^<style[^>]*>+
        \ end=+^</style>+me=s-1
        \ contains=@css,htmlTag
        \ keepend
        \ fold

  syntax match vueStyleClosingRegion "^</style>" contains=vueStyleClosingTag
endif

# Vue interpolation in templates
if !empty(globpath(&runtimepath, 'syntax/javascript.vim', 1))
  syntax include @javascript syntax/javascript.vim
  unlet! b:current_syntax

  syntax region vueInterpolation
        \ start=+{{+
        \ end=+}}+
        \ contains=@typescript
        \ keepend
endif

# Add Vue attributes
syntax keyword htmlArg contained ts setup lang scoped
syntax match htmlArg "[@v:][-:.0-9_a-z]*\>" contained

# Link highlighting
highlight link vueScriptClosingTag htmlTagName
highlight link vueStyleClosingTag htmlTagName
highlight link vueTemplateClosingTag htmlTagName
highlight link vueInterpolation Special

# Set buffer-local comment format for different regions
def SetVueComments()
  # Save the original comment format
  if !exists("b:original_commentstring")
    b:original_commentstring = &commentstring
  endif

  # Check current syntax region
  var synstack = synstack(line("."), col("."))
  var in_script = false
  var in_style = false

  for synid in synstack
    var synname = synIDattr(synid, "name")
    if synname =~? 'vueTypescript\|vueScript\|typescript\|javascript'
      in_script = true
      break
    elseif synname =~? 'vueStyle\|css'
      in_style = true
      break
    endif
  endfor

  if in_script
    # Use JavaScript comments in script blocks
    &l:commentstring = "// %s"
  elseif in_style
    # Use CSS comments in style blocks
    &l:commentstring = "/* %s */"
  else
    # Use HTML comments elsewhere (template and outside regions)
    &l:commentstring = "<!-- %s -->"
  endif
enddef

# Set up autocommand to detect comment style
augroup VueComment
  autocmd!
  autocmd CursorMoved *.vue SetVueComments()
  autocmd CursorMovedI *.vue SetVueComments()
  autocmd BufEnter *.vue SetVueComments()
augroup END

# Initialize comment format
SetVueComments()

syntax sync minlines=100
b:current_syntax = "vue"
