-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

for _, mode in ipairs({ "n", "t" }) do
  pcall(vim.keymap.del, mode, "<C-/>")
  pcall(vim.keymap.del, mode, "<C-_>")
end

local function focus_terminal()
  Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
end

vim.keymap.set({ "n", "t" }, "<C-t>", focus_terminal, { desc = "Terminal (Root Dir)" })
