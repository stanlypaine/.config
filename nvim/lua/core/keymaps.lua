-- Set leader key to space (command prefix)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Stay in indent mode (keep selection when indenting)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Better paste (doesn't replace the clipboard)
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Yank whole file to system clipboard
vim.keymap.set("n", "<leader>y", "<cmd>%y+<CR>", { desc = "Yank whole file to system clipboard" })

-- Format file
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })end, { desc = "Format file" })

-- Quick save
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Quick quit
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Toggle file manager
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer', silent = true })

-- LSP Keybindings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- Built-in LSP keys (Neovim 0.11+), active once a server attaches.
-- Nothing to define here. See :help lsp-defaults
--   grr  references           gri  implementation
--   grn  rename               grt  type definition
--   gra  code actions (also works in Visual mode)

-- Toggle inline hints
vim.keymap.set('n', '<leader>hi', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Toggle inlay hints" })

-- Toggle diagnostic virtual lines
vim.keymap.set("n", "<leader>hl", function()
  local on = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = not on, virtual_text = false })
end, { desc = "Toggle diagnostic lines" })

-- Popup for the diagnostic under the cursor
vim.keymap.set("n", "<leader>hn", vim.diagnostic.open_float, { desc = "Diagnostic popup" })
