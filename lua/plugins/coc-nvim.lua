-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- Something here is messing ts, jsx identation

return {
  {
    "neoclide/coc.nvim",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        if not opts.options then opts.options = {} end
        if not opts.options.g then opts.options.g = {} end
        if not opts.options.opt then opts.options.opt = {} end
        opts.options.opt.cmdheight = 1
        opts.options.g.coc_global_extensions = {
          "coc-json",
          "coc-marketplace",
        }

        if not opts.commands then opts.commands = {} end
        opts.commands.Format = { function() vim.fn.CocAction "format" end, desc = "Format file with LSP" }
        if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
        local maps = assert(opts.mappings)
        maps.n["[d"] = { "<Plug>(coc-diagnostic-prev)", desc = "Previous diagnostic" }
        maps.n["]d"] = { "<Plug>(coc-diagnostic-next)", desc = "Next diagnostic" }
        maps.n["gD"] = { "<Plug>(coc-declaration)", desc = "Show the declaration of current symbol" }
        maps.n["gI"] = { "<Plug>(coc-implementation)", desc = "Show the implementation of current symbol" }
        maps.n["gT"] = { "<Plug>(coc-type-definition)", desc = "Show the definition of current type" }
        maps.n["gd"] = { "<Plug>(coc-definition)", desc = "Show the definition of current symbol" }
        maps.n["gr"] = { "<Plug>(coc-references)", desc = "Show the references of current symbol" }
        maps.n["<Leader>l"] = false
        -- maps.n["<Leader>L"] = { desc = "Lang tools" }
        maps.n["<Leader>la"] = false
        maps.n["<Leader>lc"] = false
        maps.n["<Leader>lf"] = false
        maps.n["<Leader>lm"] = false
        maps.n["<Leader>lr"] = false
        maps.n["<Leader>ls"] = false
        maps.n["<Leader>lS"] = false
        maps.n["<Leader>lL"] = false
        maps.n["<Leader>LR"] = maps.n.gr
        maps.n["<Leader>La"] = { "<Plug>(coc-codeaction-cursor)", desc = "LSP code action" }
        maps.n["<Leader>Lc"] = { "<Cmd>CocConfig<CR>", desc = "Configuration" }
        maps.n["<Leader>Lf"] = { function() vim.cmd.Format() end, desc = "Format buffer" }
        maps.n["<Leader>Lm"] = { "<Cmd>CocList marketplace<CR>", desc = "Marketplace" }
        maps.n["<Leader>Lr"] = { "<Plug>(coc-rename)", desc = "Rename current symbol" }
        maps.n["<Leader>Ls"] = { "<Cmd>CocList symbols<CR>", desc = "Search symbols" }
        maps.n["<Leader>LS"] = { "<Cmd>CocOutline<CR>", desc = "Symbols outline" }
        maps.n["<Leader>LL"] = { "<Plug>(coc-codelens-action)", desc = "LSP CodeLens run" }
        maps.n["<Leader>uL"] = { "<Cmd>CocCommand document.toggleCodeLens<CR>", desc = "Toggle CodeLens" }
        maps.n["<Leader>uh"] = { "<Cmd>CocCommand document.toggleInlayHint<CR>", desc = "Toggle LSP inlay hints" }
        maps.x["<Leader>LF"] = { "<Plug>(coc-format-selected)", desc = "Format selection" }
        maps.n["K"] = false
      end,
    },
  },
}
