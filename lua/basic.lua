--------------------
-- basic settings
--------------------

--- 属性索引：https://neovim.io/doc/user/options.html
--- vim.g/vim.o/... 参考：https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

--------------------
-- neovim api alias
--------------------
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd            -- execute neovim cmd

--------------------
-- global settings
--------------------
g.swapfile = false
g.laststatus = 2               -- always show status line
g.mapleader = " "
g.maplocalleader = " "

opt.swapfile = false           -- don't use swap files

--------------------
-- use system clipboard
--------------------
vim.o.clipboard = 'unnamedplus'-- doesn't work

--------------------
-- editor settings
--------------------
opt.number = true              -- show line numbers
opt.relativenumber = true      -- show relative line number
opt.cursorline = true          -- highlight current line
-- tabs & indent settings
opt.expandtab = true           -- use spaces instead of tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
-- syntax highlighting
cmd("syntax enable")

--------------------
-- color
--------------------
opt.termguicolors = true       -- use 24bit rgb color
opt.background = 'dark'
cmd('colorscheme NeoSolarized') -- use NeoSolarized theme: https://github.com/overcache/NeoSolarized

--------------------
-- ignore case
--------------------
opt.ignorecase = true
opt.smartcase = true

--------------------
-- scroll settings
--------------------
opt.scrolloff = 8
opt.sidescrolloff = 8


--------------------
-- split window
--------------------
opt.splitbelow = true
opt.splitright = true


--------------------
-- others
--------------------
opt.showtabline = 2            -- always show tab page lines
