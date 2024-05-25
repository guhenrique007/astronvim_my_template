return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = {
      options = {
        opt = {
          -- showtabline = 0,
          laststatus = 0,
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      -- opts.tabline = nil -- remove tabline
      -- opts.statusline = nil
      opts.winbar = nil
    end,
  },
}
