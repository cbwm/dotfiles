--[[ keymaps.lua ]]
local map = vim.api.nvim_set_keymap

-- Y yank until the end of line
map('n', 'Y', 'y$', { noremap = true })

---- window actions
--map('n', '<Leader>w', '<C-w>', { noremap = true })
map('n', '<C-h>', [[<cmd>wincmd h<cr>]], { noremap = true })
map('n', '<C-j>', [[<cmd>wincmd j<cr>]], { noremap = true })
map('n', '<C-k>', [[<cmd>wincmd k<cr>]], { noremap = true })
map('n', '<C-l>', [[<cmd>wincmd l<cr>]], { noremap = true })

---- barbar
-- move to previous/next buffer
map('n', '<A-,>', [[<cmd>BufferPrevious<cr>]], { noremap=true, silent=true })
map('n', '<A-.>', [[<cmd>BufferNext<cr>]], { noremap=true, silent=true })
-- reorder previous/next buffer
map('n', '<A-[>', [[<cmd>BufferMovePrevious<cr>]], { noremap=true, silent=true }) -- These aint workin
map('n', '<A-]>', [[<cmd>BufferMoveNext<cr>]], { noremap=true, silent=true }) -- no worky
-- go to buffer in position
map('n', '<A-1>', [[<cmd>BufferGoto 1<cr>]], { noremap=true, silent=true })
map('n', '<A-2>', [[<cmd>BufferGoto 2<cr>]], { noremap=true, silent=true })
map('n', '<A-3>', [[<cmd>BufferGoto 3<cr>]], { noremap=true, silent=true })
map('n', '<A-4>', [[<cmd>BufferGoto 4<cr>]], { noremap=true, silent=true })
map('n', '<A-5>', [[<cmd>BufferGoto 5<cr>]], { noremap=true, silent=true })
map('n', '<A-6>', [[<cmd>BufferGoto 6<cr>]], { noremap=true, silent=true })
map('n', '<A-7>', [[<cmd>BufferGoto 7<cr>]], { noremap=true, silent=true })
map('n', '<A-8>', [[<cmd>BufferGoto 8<cr>]], { noremap=true, silent=true })
map('n', '<A-9>', [[<cmd>BufferGoto 9<cr>]], { noremap=true, silent=true })
map('n', '<A-0>', [[<cmd>BufferLast 1<cr>]], { noremap=true, silent=true })
-- pin/unpin buffer
map('n', '<A-p>', [[<cmd>BufferPin<cr>]], { noremap=true, silent=true })
-- close buffer
map('n', '<A-c>', [[<cmd>BufferClose<cr>]], { noremap=true, silent=true })
-- auto-sort buffers

---- nvim-tree
map('n', '<Leader>tt', "<cmd>NvimTreeFindFileToggle<cr>", { noremap = true })
--map('n', '<Leader>tt', "<cmd>NvimTreeToggle<cr>", { noremap = true })
--map('n', '<Leader>tf', "<cmd>NvimTreeFindFile<cr>", { noremap = true })
map('n', '<Leader>tr', "<cmd>NvimTreeRefresh<cr>", { noremap = true })
map('n', '<Leader>tc', "<cmd>NvimTreeCollapse<cr>", { noremap = true })

---- toggleterm
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
