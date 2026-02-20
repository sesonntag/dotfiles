-- ============================================================
-- Neovim 2026 Fast Config
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

vim.g.mapleader = " "

-- ============================================================
-- Plugins
-- ============================================================
require("lazy").setup({

  -- Colorscheme
  { "joshdick/onedark.vim" },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = { theme = "onedark" }
      })
    end
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  { "tpope/vim-fugitive" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "bash", "yaml", "json", "markdown", "dockerfile"
        },
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  -- Auto pairs (lightweight)
  { "echasnovski/mini.pairs", version = false, config = true },

  -- Commenting
  { "numToStr/Comment.nvim", config = true },

  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          yaml = { "prettier" },
          json = { "prettier" },
          markdown = { "prettier" }
        }
      })
    end
  },

})

-- ============================================================
-- Options
-- ============================================================

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 5
opt.splitbelow = true
opt.splitright = true
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.ignorecase = true
opt.smartcase = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.undofile = true
opt.colorcolumn = "81"

vim.cmd.colorscheme("onedark")

-- ============================================================
-- Autocommands
-- ============================================================

local autocmd = vim.api.nvim_create_autocmd

-- Reload config on save
autocmd("BufWritePost", {
  pattern = "init.lua",
  command = "source <afile>"
})

-- Spell in markdown / text
autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end
})

-- Strip trailing whitespace
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save)
  end
})

-- ============================================================
-- Keymaps (Deine gewohnte UX)
-- ============================================================

local map = vim.keymap.set

-- Save / Quit
map("n", "<leader>w", "<cmd>w!<CR>")
map("n", "<leader>q", "<cmd>q!<CR>")
map("n", "<leader>x", "<cmd>x<CR>")

-- Clear search
map("n", "_", "<cmd>nohl<CR>")

-- File tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-b>", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<CR>")
map("n", "<leader>bN", "<cmd>bprevious<CR>")
map("n", "<leader>k", "<cmd>bd<CR>")

-- Toggle spell
map("n", "<leader>s", function()
  vim.opt_local.spell = not vim.opt_local.spell:get()
end)

-- Terminal escape
map("t", "<Esc>", [[<C-\><C-n>]])

-- ============================================================
-- Custom Command: Tig
-- ============================================================

vim.api.nvim_create_user_command("Tig", function()
  vim.cmd("below new")
  vim.fn.termopen("tig status")
  vim.cmd("startinsert")
end, {})