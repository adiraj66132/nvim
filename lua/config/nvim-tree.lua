-- nvim-tree file explorer
require("nvim-tree").setup({
    view = {
        side = "right",
        width = 30,
    },
    filters = {
        dotfiles = false,
    },
})
