return {
  {
    "vyfor/cord.nvim",
    -- build = "./build",
    event = "VeryLazy",
    opts = {},
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require("presence").setup({
        auto_update = true,
        main_image = "neovim",
        show_time = true,
      })
    end,
  },
}

