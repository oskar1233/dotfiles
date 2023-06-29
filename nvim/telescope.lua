print('hey!')

local actions = require('telescope.actions');

require("telescope").setup {
  defaults = {
    mappings = {
      -- n = {
      --   ["<C-q>"] = require('telescope.actions').send_selected_to_qflist
      -- },
      i = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      },
    },
    additional_args = {
      "--hidden"
    }
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><space>', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})

vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

vim.keymap.set('n', '<leader>r', builtin.git_commits, {})
