require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Functionality
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'lervag/vimtex'
        use 'kyazdani42/nvim-tree.lua'
        use { 'nvim-telescope/telescope.nvim',
              requires = 'nvim-lua/plenary.nvim' }
        use 'romgrk/barbar.nvim'

    -- Theming
    use 'rose-pine/neovim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-lualine/lualine.nvim'
end)

-- Neovim config
local g = vim.g
local o = vim.o

o.ff = 'unix'
o.mouse = 'a'
o.number = true
o.termguicolors = true

o.expandtab = true
o.shiftwidth = 4
o.si = false
o.softtabstop = 4

-- Theme config
g.bufferline = {
    icons = false
}
g.nvim_tree_show_icons = {
    git = 0,
    folders = 0,
    files = 0,
    folder_arrows = 0
}
g.vimtex_view_method = 'zathura'

-- All configuration that cannot be done with lua goes here
vim.cmd[[
colorscheme rose-pine
syntax on
]]

-- Plugin config
require('nvim-tree').setup {
    view = {
        width = 36
    }
}

require('lualine').setup {
    options = { theme = 'rose-pine' }
}

-- Keybinds
local setkey = vim.api.nvim_set_keymap

setkey('n', '<M-c>', ':BufferClose<CR>', { noremap = true })
setkey('n', '<M-.>', ':BufferNext<CR>', { noremap = true })
setkey('n', '<M-,>', ':BufferPrevious<CR>', { noremap = true })

setkey('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
setkey('n', '<Leader>n', ':NvimTreeFocus<CR>', { noremap = true })

setkey('i', '<C-Space>', vim.fn['coc#refresh'](), { noremap = true })
setkey('n', 'gd', '<Plug>(coc-definition)', {})
setkey('n', 'ff', ':Telescope find_files<CR>', { noremap = true })
