vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4048" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#5c6370" })
require("ibl").setup({ scope = { enabled = false } })
