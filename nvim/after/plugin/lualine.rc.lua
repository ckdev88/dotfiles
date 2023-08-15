local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
  options = {
    theme = 'gruvbox_dark'
  }
} -- all other default settings are fine so far
    
