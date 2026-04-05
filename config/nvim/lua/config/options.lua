vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.python3_host_prog = vim.fn.exepath("pynvim-python")

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = { "menu", "menuone", "noselect" }

opt.list = true
opt.listchars = {
  tab = "> ",
  trail = ".",
  nbsp = "_",
}
