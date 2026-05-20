-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

for _, mode in ipairs({ "n", "t" }) do
  pcall(vim.keymap.del, mode, "<C-/>")
  pcall(vim.keymap.del, mode, "<C-_>")
end
local function open_or_focus_terminal()
  local term_buf = vim.g.my_term_buf

  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_set_current_win(win)
        return
      end
    end

    vim.cmd("botright split")
    vim.api.nvim_win_set_buf(0, term_buf)
    return
  end

  -- Deteksi OS & Shell: Gunakan shell aktif ($SHELL) di Linux/macOS, powershell di Windows
  local shell_cmd = os.getenv("SHELL") or "bash"
  if vim.fn.has("win32") == 1 then
    shell_cmd = "powershell"
  end

  vim.cmd("botright split | terminal " .. shell_cmd)
  vim.g.my_term_buf = vim.api.nvim_get_current_buf()
end

vim.keymap.set("n", "<C-t>", open_or_focus_terminal, { desc = "Open or focus terminal" })

vim.keymap.set("t", "<C-t>", function()
  vim.cmd("stopinsert")
  open_or_focus_terminal()
  vim.cmd("startinsert")
end, { desc = "Open or focus terminal" })
