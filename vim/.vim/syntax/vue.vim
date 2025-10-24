vim9script

echo "asdffsdafasdfasdfasdfasdfasf"
# Ultra-fast Vue syntax with consistent structure

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

syntax sync minlines=100
b:current_syntax = "vue"
