vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim bootstrap

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },

    -- LSP Configuration (Updated for Neovim 0.11 API)
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Define the configuration for nixd
            vim.lsp.config('nixd', {
                -- You can add nixd specific settings here if needed
                -- settings = { ... }
            })

            -- Automatically start/enable it
            vim.lsp.enable('nixd')
        end,
    },

    -- Completion Engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require('cmp')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            -- Apply capabilities to all LSPs (Neovim 0.11 way)
            vim.lsp.config('*', { capabilities = capabilities })

            cmp.setup({
                snippet = {
                    expand = function(args) require('luasnip').lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ 
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false 
                    }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                })
            })
        end,
    },
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
        dashboard = {
          enabled = true,
          sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
          preset = {
            -- You can customize your dashboard header here
            header = [[
                        ██
                      ░░
 ███████   █████   ██████  ██    ██ ██ ██████████
░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
 ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
 ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
 ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░]],
            -- Custom buttons
            keys = {
              { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
              { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
              { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
              { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('recent')" },
              { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
              { icon = " ", key = "s", desc = "Restore Session", section = "session" },
              { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
              { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
          },
        },
        picker = { 
          enabled = true,
          sources = {
            files = { 
              hidden = true, 
              ignored = true 
            }, 
            explorer = {
              hidden = true,
              ignored = true,
            }
          }
        },
        explorer = { enabled = true },
      },
    },
})

---
-- Options & Keymaps
---
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"

-- Diagnostics settings
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Keybindings
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show LSP hover information" })
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "Toggle Explorer" })
