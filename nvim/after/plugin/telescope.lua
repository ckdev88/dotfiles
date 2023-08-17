local bi = require('telescope.builtin')
local km = vim.keymap

km.set('n', '<leader>sr', bi.oldfiles, { desc = '[S]earch [R]ecently opened files' })
km.set('n', '<leader>sb', bi.buffers, { desc = '[S]earch current [B]uffers' })

km.set('n', '<leader>sf', bi.find_files, { desc = '[S]earch [F]iles' })
km.set('n', '<leader>sh', bi.help_tags, { desc = '[S]earch [H]elp' })
km.set('n', '<leader>sw', bi.grep_string, { desc = '[S]earch current [W]ord' })
km.set('n', '<leader>sg', bi.live_grep, { desc = '[S]earch [G]rep' })
km.set('n', '<leader>sd', bi.diagnostics, { desc = '[S]earch [D]iagnostics' })
km.set('n', '<leader>gf', bi.git_files, { desc = 'Search [G]it [F]iles' })
