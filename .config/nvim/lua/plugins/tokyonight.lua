--
-- Tokio Night Configuration
--

-- tokyonight optionse
require("tokyonight").setup({
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, 

  on_colors = function(colors) end
})
