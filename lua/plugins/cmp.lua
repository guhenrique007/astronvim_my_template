local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- modify the mapping part of the table
    opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
    opts.mapping["<Tab>"] = cmp.config.disable
    opts.mapping["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.snippet and vim.snippet.active { direction = 1 } then
        vim.schedule(function() vim.snippet.jump(1) end)
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.snippet and vim.snippet.active { direction = -1 } then
        vim.schedule(function() vim.snippet.jump(-1) end)
      else
        fallback()
      end
    end, { "i", "s" })
  end,
}
