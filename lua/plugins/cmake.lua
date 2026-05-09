return {
  -- Import fitur bahasa resmi dari LazyVim (Highlighting, LSP, Linting, dll)
  { import = "lazyvim.plugins.extras.lang.cmake" },
  { import = "lazyvim.plugins.extras.lang.clangd" },

  -- Kostumisasi shortcut untuk cmake-tools
  {
    "Civitasv/cmake-tools.nvim",
    keys = {
      { "<C-c>g", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
      { "<C-c>b", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
      { "<C-c>r", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
      { "<C-c>d", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
      { "<C-c>t", "<cmd>CMakeSelectTarget<cr>", desc = "CMake Select Target" },
      { "<C-c>k", "<cmd>CMakeStop<cr>", desc = "CMake Stop" },
      { "<C-c>s", "<cmd>CMakeSettings<cr>", desc = "CMake Settings" },
    },
    opts = {
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    }
  },
}
