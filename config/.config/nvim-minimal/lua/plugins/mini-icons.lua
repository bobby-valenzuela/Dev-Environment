return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = {
    file = {
      [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
      ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      ["pl"] = { glyph = "", hl = "MiniIconsBlue" }, -- Perl scripts
      ["pm"] = { glyph = "", hl = "MiniIconsBlue" }, -- Perl modules
      ["t"] = { glyph = "", hl = "MiniIconsBlue" }, -- Perl test files
    },
    filetype = {
      dotenv = { glyph = "", hl = "MiniIconsYellow" },
    },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
