-- ----------------------------------------
-- nvim/lua/base.lua 
-- ----------------------------------------
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true

vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Also search in subforlders
vim.opt.wildignore:append { '*/node_modules/*' }
-- .../nvim/lua/base.lua

-- ----------------------------------------
-- nvim/lua/highlights.lua
-- ----------------------------------------

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

-- .../nvim/lua/highlights.lua


-- ----------------------------------------
-- nvim/lua/maps.lua
-- ----------------------------------------

local keymap = vim.keymap

-- disables
-- nnoremap <c-z> <nop> -- TODO: test
-- nnoremap <C-z> <nop> -- TODO: test

-- selection & modification
keymap.set('n', 'x', '"_x') -- prevent yanking with x
keymap.set('n', '<C-a>', 'gg<S-v>G') -- select all

-- tabs
keymap.set('n', 'te', ':tabedit<Return>', {silent = true})
keymap.set('n','ts',':vsplit<Return><C-w>w', {silent = true})
-- keymap.set('','tt','<C-w>w<Return>') -- should be toggle prev/curr, not working
keymap.set('','ty',':tabnext<Return>')
keymap.set('','tr',':tabprevious<Return>')
keymap.set('','tq',':tabclose<Return>')

-- LSP
local opts = { noremap=true, silent=true }

keymap.set('n','<space>d',vim.diagnostic.open_float,opts)
keymap.set('n','[d',vim.diagnostic.goto_prev,opts)
keymap.set('n',']d',vim.diagnostic.goto_next,opts)
keymap.set('n','<space>q',vim.diagnostic.setloclist,opts)

-- on_attach function to only map following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc','v:lua.vim.lsp.imnifunc')

  -- LSP functions
  keymap.set('n','gD',vim.lsp.buf.declaration, bufopts)
  keymap.set('n','gd',vim.lsp.buf.definition,bufopts)
  keymap.set('n','gk',vim.lsp.buf.hover,bufopts)
  keymap.set('n','gi',vim.lsp.implementation,bufopts)
  keymap.set('n','gK',vim.lsp.buf.signature_help,bufopts)
  keymap.set('n','<space>D',vim.lsp.buf.rename,bufopts)
  keymap.set('n','<space>rn',vim.lsp.buf.rn,bufopts)
  keymap.set('n','<space>ca',vim.lsp.buf.code_action, bufopts)
  keymap.set('n','gr',vim.lsp.buf.references,bufopts)
  keymap.set('n','<space>f',function() vim.lsp.buf.format { async=true } end, bufopts)
end

-- Prettier
keymap.set("n","<leader>re","<Plug>(Prettier)",opts)
keymap.set("v","<leader>re",":PrettierFragment<cr>",opts)
-- .../nvim/lua/maps.lua

-- ----------------------------------------
-- plugins
-- ----------------------------------------

-- nvim/lua/plugins.lua
local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup({function(use)
  use 'wbthomason/packer.nvim'
  -- LSP & autocomplete
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Formatting
  use {
    'prettier/vim-prettier',
    run = 'npm install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'astro'}
  }
  -- Interface
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt=true }
  }
end})
-- /nvim/lua/plugins.lua

-- nvim/after/plugin/lualine.lua.rc
require('lualine').setup {
  options = {
    theme = 'gruvbox_dark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
  }
} 
-- /nvim/after/plugin/lualine.lua.rc 

-- nvim/after/plugin/lspconfig.lua.rc
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- activate lsp
local lspconfig=require('lspconfig')
local servers = {'tailwindcss','tsserver','jsonls','eslint'}
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach=on_attach,
    capabilities=capabilities,
  }
end

-- html & css have separate runners... why?
lspconfig.cssls.setup{
  on_attach=on_attach,
  capabilities=capabilities
}

lspconfig.html.setup{
  on_attach=on_attach,
  capabilities=capabilities
}

-- Luasnip ... snippets, examine later if this is the best option
local luasnip = require("luasnip")
require("luasnip.loaders.from_lua").lazy_load()
-- keybinds, TODO: move to maps.lua later
vim.api.nvim_set_keymap("i","<C-n>","<Plug>luasnip-next-choice",{})
vim.api.nvim_set_keymap("s","<C-n>","<Plug>luasnip-next-choice",{})
vim.api.nvim_set_keymap("i","<C-p>","<Plug>luasnip-prev-choice",{})
vim.api.nvim_set_keymap("s","<C-p>","<Plug>luasnip-prev-choice",{})
-- setup check voor nvim-cmp tab mapping
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0)) -- TODO: unpack is deprecated in current Lua version.. needs fix
  return col ~= 0 and vim.api.nvim_buf_get_lines(0,line - 1,line,true)[1]:sub(col,col):match("%s") == nil
end
-- Set easy editing of snippets
keymap.set("n","<leader>sn",":lua require('luasnip.loaders').edit_snippet_files()<cr>",opts)
-- cmp: autocompletion
local cmp=require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- specifically for Luasnip
    end,
  },
  mapping = {
    ['<C-p>']=cmp.mapping.select_prev_item(),
    ['<C-n>']=cmp.mapping.select_next_item(),
    ['<C-d>']=cmp.mapping.scroll_docs(-4),
    ['<C-f>']=cmp.mapping.scroll_docs(4),
    ['<C-Space>']=cmp.mapping.complete(),
    ['<C-e>']=cmp.mapping.close(),
    ['<CR>']=cmp.mapping.confirm{
      behavior=cmp.ConfirmBehavior.Replace,
      select=true
    },
    ["<Tab>"]=cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable()  then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {"i","s"}),

    ["<S-Tab>"]=cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i","s"}),
  },
  sources = {
    {name='nvim_lsp'},
    {name='nvim_lsp_signature_help'},
    {name='luasnip'},
    {name='buffer'},
    {name='path'}
  },
}
-- /nvim/after/plugin/lspconfig.lua.rc

-- .../plugins
