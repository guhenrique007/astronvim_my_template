-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  {
    "AstroNvim/astrocore",
    --@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<leader>bD"] = {
            function()
              require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<leader>b"] = { name = "Buffers" },
          ["<leader>x"] = { name = "Copilot Chat"},

          -- quick save
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
          
          -- Disable global mappings
          ["|"] = {""},
          ["\\"] = {""},
          
          -- Moving
          ["<leader>j"] = { "J", desc = "Join line below" },
          ["J"] = {"5j", desc = "Jump 5 lines for j"},
          ["K"] = {"5k", desc = "Jump 5 lines for k"},
          ["<A-j>"] = { ":m+<cr>", desc = "Move to line below"}, -- need to enable alt key (MacOS)
          ["<A-k>"] = { ":m-2<cr>", desc = "Move to line above"}, -- need to enable alt key
          ["<M-j>"] = { ":m+<cr>", desc = "Move to line below"}, -- need to enable alt key
          ["<M-k>"] = { ":m-2<cr>", desc = "Move to line above"}, -- need to enable alt key
          ["<leader>l"] = {"$", desc = "go to end of line"},
          ["<leader>h"] = {"_", desc = "go to start of line"},

          -- Split window
          ["<leader>v"] = { ":vs<cr>", desc = "Vertical Split"},
          ["<leader>s"] = { ":sp<cr>", desc = "Horizontal Split"},

          -- Disable yank-on-delete
          ["dd"] = {"\"_dd"},
          ["D"] = {"\"_D"},
          ["cc"] = {"\"_cc"},
          ["C"] = {"\"_C"},
        },
        v = {
          ["c"] = {"\"_c"},
          ["d"] = {"\"_d"},
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          gh = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
