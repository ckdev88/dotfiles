syntax match methodCall "\v\zs\w+\ze\("
highlight link methodCall Method

syntax match objectMethodCall "\v\.\zs\w+\ze\("
highlight link objectMethodCall Define

