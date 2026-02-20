-- ============================================================
-- Neovim Configuration
-- Author: Sebastian Sonntag
-- License: MIT
-- ============================================================

-- ============================================================
-- Bootstrap lazy.nvim
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================
-- Leader
-- ============================================================
vim.g.mapleader = " "

-- ============================================================
-- Plugins
-- ============================================================
require("lazy").setup({

  { "scrooloose/nerdtree", cmd = "NERDTreeToggle" },
  { "ctrlpvim/ctrlp.vim" },
  { "itchyny/lightline.vim" },
  { "joshdick/onedark.vim" },

  { "tpope/vim-fugitive" },
  { "mhinz/vim-signify" },
  { "junegunn/gv.vim" },
  { "gregsexton/gitv" },

  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "tpope/vim-eunuch" },
  { "jiangmiao/auto-pairs" },
  { "ntpeters/vim-better-whitespace" },
  { "machakann/vim-highlightedyank" },

  { "w0rp/ale" },
  { "pseewald/vim-anyfold" },
  { "inside/vim-search-pulse" },
  { "google/vim-searchindex" },
  { "Yggdroot/indentLine" },

  { "lervag/vimtex", ft = "latex" },
  { "janko-m/vim-test" },
  { "mhinz/vim-startify" },
  { "majutsushi/tagbar", cmd = "TagbarToggle" },

})

-- ============================================================
-- Options
-- ============================================================
vim.opt.history = 1000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = { "longest", "menuone" }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "81"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undo//")
vim.opt.foldlevel = 1
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd.colorscheme("onedark")

-- ============================================================
-- Autocommands
-- ============================================================
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  pattern = "init.lua",
  command = "source <afile>"
})

autocmd("FileType", {
  pattern = { "markdown", "latex", "text" },
  callback = function()
    vim.opt_local.spell = true
  end
})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save)
  end
})

autocmd("FileType", {
  pattern = "*",
  command = "AnyFoldActivate"
})

-- ============================================================
-- Keymaps
-- ============================================================
local map = vim.keymap.set

-- Save / Quit
map("n", "<leader>w", ":w!<CR>")
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>x", ":x<CR>")

-- Clear search
map("n", "_", ":nohl<CR>")

-- Buffer navigation
map("n", "<leader>bn", ":bn<CR>")
map("n", "<leader>bN", ":bp<CR>")
map("n", "<leader>k", ":bd<CR>")
map("n", "<leader>K", ":bd!<CR>")

-- NERDTree
map("n", "<C-n>", ":NERDTreeToggle<CR>")

-- Tagbar
map("n", "<leader>ct", ":TagbarToggle<CR>")

-- Tests
map("n", "<leader>t", ":TestNearest<CR>")
map("n", "<leader>T", ":TestFile<CR>")
map("n", "<leader>a", ":TestSuite<CR>")
map("n", "<leader>l", ":TestLast<CR>")
map("n", "<leader>g", ":TestVisit<CR>")

-- Insert escape
map("i", "kj", "<Esc>")
map("i", ",,", "<Esc>")

-- Terminal escape
map("t", "<Esc>", [[<C-\><C-n>]])

-- Toggle spell
map("n", "<leader>s", function()
  vim.opt_local.spell = not vim.opt_local.spell:get()
  print(vim.opt_local.spell:get() and "Spell ON" or "Spell OFF")
end)

-- ============================================================
-- Plugin Settings
-- ============================================================

-- ALE
vim.g.ale_sign_column_always = 1
vim.g.ale_sign_error = ">>"
vim.g.ale_sign_warning = "--"
vim.g.ale_linters = {
  python = { "flake8" },
}
vim.g.ale_python_flake8_executable = "python3"
vim.g.ale_python_flake8_options = "-m flake8"

-- IndentLine
vim.g.indentLine_char = "¦"

-- CtrlP
vim.g.ctrlp_map = "<c-p>"
vim.g.ctrlp_working_path_mode = "c"
vim.g.ctrlp_use_caching = 0

-- Signify
vim.g.signify_realtime = 1

-- Highlight yanks
vim.g.highlightedyank_highlight_duration = 250

-- Startify
vim.g.startify_disable_at_vimenter = 1

-- ============================================================
-- Tig Command
-- ============================================================
vim.api.nvim_create_user_command("Tig", function()
  vim.cmd("below new")
  vim.fn.termopen("tig status")
  vim.cmd("startinsert")
end, {})
