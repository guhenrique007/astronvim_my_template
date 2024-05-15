return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
    debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
    disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
    prompts = {
      OptimizePrompt = {
        prompt = "/COPILOT_REFACTOR Optimize the selected code to improve performance and readablilty.",
      },
    },
    language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
    -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
    -- temperature = 0.1,
  },
  build = function()
    vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
  end,
  event = "VeryLazy",
  keys = {
    { "<leader>xb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
    { "<leader>xe", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>xt", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    {
      "<leader>xT",
      "<cmd>CopilotChatVsplitToggle<cr>",
      desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
    },
    {
      "<leader>xv",
      ":CopilotChatVisual ",
      mode = "x",
      desc = "CopilotChat - Open in vertical split",
    },
    {
      "<leader>xx",
      ":CopilotChatInPlace<cr>",
      mode = "x",
      desc = "CopilotChat - Run in-place code",
    },
    {
      "<leader>xf",
      "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
      desc = "CopilotChat - Fix diagnostic",
    },
    {
      "<leader>xr",
      "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
      desc = "CopilotChat - Reset chat history and clear buffer",
    },
    {
      "<leader>xo",
      ":CopilotChatOpen<cr>",
      desc = "CopilotChat - Open chat window",
    },
    {
      "<leader>xO",
      "<cmd>CopilotChatBuffer  /COPILOT_REFACTOR Optimize the selected code to improve performance and readablilty.<cr>",
      desc = "CopilotChat - Optimize the selected code to improve performance and readablilty.",
    },
  },
}
