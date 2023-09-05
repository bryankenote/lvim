--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.so = 16
vim.opt.list = true
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("lead:·")

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua,*.tsx,*.ts",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.fillchars = { eob = " " }
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["<C-w>e"] = ":vsplit<CR>"
lvim.keys.normal_mode["<C-w>o"] = ":split<CR>"

lvim.keys.normal_mode["<C-d>"] = "<C-d>M"
lvim.keys.normal_mode["<C-u>"] = "<C-u>M"

vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

lvim.builtin.which_key.mappings["bs"] = { "<cmd>mksession! ~/.nvim/sessions/default.vim<cr>", "Save session" }
lvim.builtin.which_key.mappings["br"] = { "<cmd>source ~/.nvim/sessions/default.vim<cr>", "Restore session" }

lvim.builtin.which_key.mappings["x"] = {
    name = "Close",
    b = { ":bd<CR>", "Buffer" },
    w = { ":close<CR>", "Window" },
    a = { ":qa<CR>", "all" },
}

lvim.builtin.which_key.mappings["D"] = {
    name = "Diffview",
    o = { ":DiffviewOpen<CR>", "Open" },
    c = { ":DiffviewClose<CR>", "Close" },
}

lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["l>"] = { "<cmd>LspStart<cr>", "Enable lsp" }
lvim.builtin.which_key.mappings["l<"] = { "<cmd>LspStop<cr>", "Disable lsp" }
-- https://github.com/nvim-telescope/telescope.nvim/issues/758
-- lvim.builtin.which_key.mappings["sb"] = { "<CMD>Telescope", "Branch changes" }
lvim.builtin.which_key.mappings["sc"] = { "<CMD>Telescope git_status<CR>", "Changes (uncommitted)" }

lvim.builtin.which_key.mappings["f"] = { "<Plug>(leap-forward-to)", "Leap forward" }
lvim.builtin.which_key.mappings["F"] = { "<Plug>(leap-backward-to)", "Leap backward" }
lvim.builtin.which_key.vmappings["f"] = { "<Plug>(leap-forward-till)", "Move selection forward" }
lvim.builtin.which_key.vmappings["F"] = { "<Plug>(leap-backward-till)", "Move selection backward" }

lvim.builtin.which_key.mappings["bf"] = { "<cmd>Telescope buffers initial_mode=insert previewer=true<cr>", "Find" }
-- lvim.builtin.which_key.mappings["bo"] = { "<cmd>Telescope buffers initial_mode=insert previewer=true<cr>", "Find" }
lvim.builtin.which_key.mappings["bt"] = { "<cmd>Telescope scope buffers initial_mode=insert previewer=true<cr>", "Tab" }
lvim.builtin.which_key.mappings["sT"] = { "<cmd>Telescope telescope-tabs list_tabs initial_mode=insert<cr>", "Tabs" }

lvim.builtin.which_key.mappings["r"] = { ":%s/<c-r><c-w>/<c-r>0/g<cr>", "Replace" }

lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" }

-- -- Change theme settings
lvim.colorscheme = "vscode"
lvim.builtin.lualine.options.theme = "vscode"
-- lvim.colorscheme = "onedark"
-- lvim.builtin.lualine.options.theme = "onedark"
-- lvim.builtin.lualine.style = "default"

lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.nvimtree.setup.filters.dotfiles = false
lvim.builtin.nvimtree.setup.filters.custom = nil

local NVIMTREE_HEIGHT_RATIO = 0.8 -- You can change this
local NVIMTREE_WIDTH_RATIO = 0.5  -- You can change this too
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.width = function()
    return math.floor(vim.opt.columns:get() * NVIMTREE_WIDTH_RATIO)
end
lvim.builtin.nvimtree.setup.view.float = {
    enable = true,
    open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * NVIMTREE_WIDTH_RATIO
        local window_h = screen_h * NVIMTREE_HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
            - vim.opt.cmdheight:get()
        return {
            border = "rounded",
            relative = "editor",
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
        }
    end,
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 40
lvim.builtin.terminal.start_in_insert = true

vim.opt.diffopt:append({ "iwhite" })

vim.opt.foldmethod = "manual"
vim.opt.foldenable = true

---@diagnostic disable-next-line: unused-local
local function custom_path_display(opts, path)
    local cwd = vim.loop.cwd()

    if cwd == nil or not cwd:match("AcademicServices") or cwd:match("LogosWebApp") then
        return path
    end

    local display_name = ""
    local segment = ""
    local segments = vim.split(path, "/", {})

    if cwd:match("LogosWebApp") then
        if #segments < 2 then
            return path
        end

        segment = segments[2]

        if segment ~= nil then
            if string.find(segment, "app") then
                display_name = "[App]"
            elseif string.find(segment, "server") then
                display_name = "[Server]"
            elseif string.find(segment, "utility") then
                display_name = "[Utility]"
            end
        end
    elseif cwd:match("AcademicServices") then
        if #segments < 2 then
            return path
        end

        segment = segments[2]

        if segment ~= nil then
            if string.find(segment, "Faithlife.AcademicDesk.Client") then
                display_name = "[Desk.C]"
            elseif string.find(segment, "Faithlife.AcademicDesk.Server") then
                display_name = "[Desk.S]"
            elseif string.find(segment, "Faithlife.AcademicPortal.Client") then
                display_name = "[Portal.C]"
            elseif string.find(segment, "Faithlife.AcademicPortal.Server") then
                display_name = "[Portal.S]"
            elseif string.find(segment, "Faithlife.AcademicServices.AcademicApi.v1.WebApi") then
                display_name = "[WebApi]"
            elseif string.find(segment, "Faithlife.AcademicServices.Subscriber") then
                display_name = "[Subscriber]"
            elseif string.find(segment, "Faithlife.AcademicServices.Services") then
                display_name = "[Services]"
            elseif string.find(segment, "Faithlife.AcademicServices.Scheduler") then
                display_name = "[Scheduler]"
            elseif string.find(segment, "Faithlife.AcademicServices.JobConsole") then
                display_name = "[JobConsole]"
            elseif string.find(segment, "Faithlife.AcademicServices.Data.Entities") then
                display_name = "[Entities]"
            elseif string.find(segment, "Faithlife.AcademicServices.Data") then
                display_name = "[Data]"
            elseif string.find(segment, "Faithlife.AcademicServices.IntegrationTests") then
                display_name = "[IntegrationTests]"
            elseif string.find(segment, "Faithlife.AcademicServices.AcademicApi.Tests") then
                display_name = "[AcademicApi.Tests]"
            elseif string.find(segment, "Faithlife.AcademicServices.LtiProvider.v1.Web.Tests") then
                display_name = "[LtiProvider.Tests]"
            end
        end
    end

    if display_name == "" or segment == nil then
        return path
    end

    -- Get the remaining path after the segment
    local index = string.find(path, segment) + #segment + 1
    local sub_path = string.sub(path, index)

    -- Get path past "/src" if possible
    sub_path = vim.fn.substitute(sub_path, "^src", "", "")

    -- Return the formatted path
    return display_name .. " " .. sub_path
end

lvim.builtin.telescope.defaults = {
    path_display = custom_path_display,
    wrap_results = true,
    layout_strategy = "horizontal",
    layout_config = {
        prompt_position = "top",
        width = 0.95,
        height = 0.90,
        preview_width = 0.5,
    },
    sorting_strategy = "ascending",
}

vim.lsp.handlers["textDocument/references"] = require("telescope.builtin").lsp_references
vim.lsp.handlers["textDocument/definition"] = require("telescope.builtin").lsp_definitions
-- vim.lsp.handlers["textDocument/definition"] = require("telescope.builtin").lsp_type_definitions

-- lvim.builtin.telescope.pickers = {
-- 	find_files = {
-- 		layout_config = {
-- 			width = 0.95,
-- 			preview_width = 0.5,
-- 		},
-- 	},
-- 	git_files = {
-- 		layout_config = {
-- 			width = 0.95,
-- 			preview_width = 0.5,
-- 		},
-- 	},
-- 	git_commits = {
-- 		width = 0.95,
-- 		preview_width = 0.5,
-- 	},
-- 	grep_string = {
-- 		layout_config = {
-- 			width = 0.95,
-- 			preview_width = 0.5,
-- 		},
-- 	},
-- 	live_grep = {
-- 		layout_config = {
-- 			width = 0.95,
-- 			preview_width = 0.5,
-- 		},
-- 	},
-- }

lvim.builtin.telescope.on_config_done = function()
    ---@diagnostic disable-next-line: redundant-parameter
    require("telescope").setup({
        defaults = {
            file_ignore_patterns = { "%.g%.cs$" },
        },
    })
end

-- Don't let lvim change the root directory
lvim.builtin.project.manual_mode = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    { command = "stylua" },
    {
        command = "prettier",
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
    {
        command = "eslint_d",
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    },
    --   { command = "flake8", filetypes = { "python" } },
    --   {
    --     command = "shellcheck",
    --     args = { "--severity", "warning" },
    --   },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
    {
        exe = "eslint_d",
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    },
})

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    -- { "tomasiser/vim-code-dark" },
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                -- style = "darker",
                transparent = true,
            })
            require("onedark").load()
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                transparent = true,
            })
            require("vscode").load()
        end,
    },
    {
        "LukasPietzschmann/telescope-tabs",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit",
        },
        ft = { "fugitive" },
    },
    { "tpope/vim-sleuth" },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    { "Issafalcon/lsp-overloads.nvim" },
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("hlslens").setup()
            require("scrollbar.handlers.search").setup()

            local kopts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap(
                "n",
                "n",
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap(
                "n",
                "N",
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

            vim.api.nvim_set_keymap("n", "<Esc>", "<Cmd>noh<CR>", kopts)
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar.handlers.gitsigns").setup()
            local colors = require("tokyonight.colors").setup()

            require("scrollbar").setup({
                handle = {
                    color = colors.bg_highlight,
                },
                marks = {
                    Search = { color = colors.orange },
                    Error = { color = colors.error },
                    Warn = { color = colors.warning },
                    Info = { color = colors.info },
                    Hint = { color = colors.hint },
                    Misc = { color = colors.purple },
                },
            })
        end,
    },
    -- {
    --     "ldelossa/gh.nvim",
    --     dependencies = { { "ldelossa/litee.nvim" } },
    --     config = function()
    --         require("litee.lib").setup()
    --         require("litee.gh").setup({
    --             -- deprecated, around for compatability for now.
    --             jump_mode = "invoking",
    --             -- remap the arrow keys to resize any litee.nvim windows.
    --             map_resize_keys = false,
    --             -- do not map any keys inside any gh.nvim buffers.
    --             disable_keymaps = false,
    --             -- the icon set to use.
    --             icon_set = "default",
    --             -- any custom icons to use.
    --             icon_set_custom = nil,
    --             -- whether to register the @username and #issue_number omnifunc completion
    --             -- in buffers which start with .git/
    --             git_buffer_completion = true,
    --             -- defines keymaps in gh.nvim buffers.
    --             keymaps = {
    --                 -- when inside a gh.nvim panel, this key will open a node if it has
    --                 -- any futher functionality. for example, hitting <CR> on a commit node
    --                 -- will open the commit's changed files in a new gh.nvim panel.
    --                 open = "<CR>",
    --                 -- when inside a gh.nvim panel, expand a collapsed node
    --                 expand = "zo",
    --                 -- when inside a gh.nvim panel, collpased and expanded node
    --                 collapse = "zc",
    --                 -- when cursor is over a "#1234" formatted issue or PR, open its details
    --                 -- and comments in a new tab.
    --                 goto_issue = "gd",
    --                 -- show any details about a node, typically, this reveals commit messages
    --                 -- and submitted review bodys.
    --                 details = "d",
    --                 -- inside a convo buffer, submit a comment
    --                 submit_comment = "<C-s>",
    --                 -- inside a convo buffer, when your cursor is ontop of a comment, open
    --                 -- up a set of actions that can be performed.
    --                 actions = "<C-a>",
    --                 -- inside a thread convo buffer, resolve the thread.
    --                 resolve_thread = "<C-r>",
    --                 -- inside a gh.nvim panel, if possible, open the node's web URL in your
    --                 -- browser. useful particularily for digging into external failed CI
    --                 -- checks.
    --                 goto_web = "gx",
    --             },
    --         })

    --         local wk = require("which-key")
    --         wk.register({
    --             g = {
    --                 name = "+Git",
    --                 h = {
    --                     name = "+Github",
    --                     c = {
    --                         name = "+Commits",
    --                         c = { "<cmd>GHCloseCommit<cr>", "Close" },
    --                         e = { "<cmd>GHExpandCommit<cr>", "Expand" },
    --                         o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
    --                         p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
    --                         z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
    --                     },
    --                     i = {
    --                         name = "+Issues",
    --                         p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
    --                     },
    --                     l = {
    --                         name = "+Litee",
    --                         t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
    --                     },
    --                     r = {
    --                         name = "+Review",
    --                         b = { "<cmd>GHStartReview<cr>", "Begin" },
    --                         c = { "<cmd>GHCloseReview<cr>", "Close" },
    --                         d = { "<cmd>GHDeleteReview<cr>", "Delete" },
    --                         e = { "<cmd>GHExpandReview<cr>", "Expand" },
    --                         s = { "<cmd>GHSubmitReview<cr>", "Submit" },
    --                         z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
    --                     },
    --                     p = {
    --                         name = "+Pull Request",
    --                         c = { "<cmd>GHClosePR<cr>", "Close" },
    --                         d = { "<cmd>GHPRDetails<cr>", "Details" },
    --                         e = { "<cmd>GHExpandPR<cr>", "Expand" },
    --                         o = { "<cmd>GHOpenPR<cr>", "Open" },
    --                         p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
    --                         r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
    --                         t = { "<cmd>GHOpenToPR<cr>", "Open To" },
    --                         z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
    --                     },
    --                     t = {
    --                         name = "+Threads",
    --                         c = { "<cmd>GHCreateThread<cr>", "Create" },
    --                         n = { "<cmd>GHNextThread<cr>", "Next" },
    --                         t = { "<cmd>GHToggleThread<cr>", "Toggle" },
    --                     },
    --                 },
    --             },
    --         }, { prefix = "<leader>" })
    --     end,
    -- },
    { "ggandor/leap.nvim" },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    -- height and width can be:
                    -- * an absolute number of cells when > 1
                    -- * a percentage of the width / height of the editor when <= 1
                    -- * a function that returns the width or the height
                    width = 0.80, -- width of the Zen window
                    height = 1,   -- height of the Zen window
                    -- by default, no options are changed for the Zen window
                    -- uncomment any of the options below, or add other vim.wo options you want to apply
                    options = {
                        -- signcolumn = "no", -- disable signcolumn
                        -- number = false, -- disable number column
                        -- relativenumber = false, -- disable relative numbers
                        -- cursorline = false, -- disable cursorline
                        -- cursorcolumn = false, -- disable cursor column
                        -- foldcolumn = "0", -- disable fold column
                        -- list = false, -- disable whitespace characters
                    },
                },
                plugins = {
                    -- disable some global vim options (vim.o...)
                    -- comment the lines to not apply the options
                    options = {
                        enabled = true,
                        ruler = false,              -- disables the ruler text in the cmd line area
                        showcmd = false,            -- disables the command in the last line of the screen
                    },
                    twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
                    gitsigns = { enabled = false }, -- disables git signs
                    tmux = { enabled = true },      -- disables the tmux statusline
                },
                -- callback where you can add custom code when the Zen window opens
                on_open = function(win)
                end,
                -- callback where you can add custom code when the Zen window closes
                on_close = function()
                end,
            }
        end
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup({
                restore_state = false, -- experimental
            })
            require("telescope").load_extension("scope")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" }
    },
    { "github/copilot.vim" },
    -- {
    -- 	"karb94/neoscroll.nvim",
    -- 	config = function()
    -- 		require("neoscroll").setup({
    -- 			-- performance_mode = true,
    -- 		})
    -- 	end
    -- },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
