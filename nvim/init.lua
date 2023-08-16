require('ck')
-- LSP, TODO: check if still necessary
local augroup = vim.api.nvim_create_augroup
local ckGroup = augroup('ck', {})
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufWritePre" }, {
        group = ckGroup,
        pattern = "*",
        command = [[%s/\s\+$//e]],
})
