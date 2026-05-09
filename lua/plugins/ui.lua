return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        ---@param buf number
        ---@param buf_nums number[]
        filter = function(buf, buf_nums)
          -- Hide terminal buffers from the bufferline
          if vim.bo[buf].buftype == "terminal" then
            return false
          end
          return true
        end,
      },
    },
  },
}
