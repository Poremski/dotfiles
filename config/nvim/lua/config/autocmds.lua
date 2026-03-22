local group = vim.api.nvim_create_augroup("javier-config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "gitcommit", "markdown" },
  desc = "Enable wrapping for text-heavy file types",
  callback = function(event)
    vim.opt_local.wrap = true
    vim.opt_local.spell = event.match == "gitcommit"
  end,
})
