-- nvim-treesitter is used here ONLY as a parser/query fetcher (its Lua module is
-- incompatible with Neovim 0.12, so we never require it). Built-in treesitter
-- highlighting picks up parsers from stdpath('data')/site/parser and queries
-- from the plugin's runtime/queries, which we add to the runtimepath below.
local ts_runtime = vim.fn.stdpath("data") .. "/plugins/nvim-treesitter/runtime"
vim.opt.runtimepath:prepend(ts_runtime)

-- Map React filetypes to their tree-sitter languages so highlight queries resolve.
-- .tsx -> tsx parser; .jsx -> javascript parser (it parses JSX in one grammar).
vim.treesitter.language.register("tsx", "typescriptreact")
vim.treesitter.language.register("javascript", "javascriptreact")
