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

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["<C-w>e"] = ":vsplit<CR>"
lvim.keys.normal_mode["<C-w>o"] = ":split<CR>"

lvim.builtin.which_key.mappings["bs"] = { "<cmd>mksession! ~/.nvim/sessions/default.vim<cr>", "Save session" }
lvim.builtin.which_key.mappings["br"] = { "<cmd>source ~/.nvim/sessions/default.vim<cr>", "Restore session" }

lvim.builtin.which_key.mappings["c"] = {
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

lvim.builtin.which_key.mappings["h"] = {
	name = "Harpoon",
	-- l = { "<CMD>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", "List" },
	l = { "<CMD>Telescope harpoon marks<CR>", "List" },
	m = { '<CMD>lua require("harpoon.mark").add_file()<CR>', "Mark" },
}

-- https://github.com/nvim-telescope/telescope.nvim/issues/758
-- lvim.builtin.which_key.mappings["sb"] = { "<CMD>Telescope", "Branch changes" }
lvim.builtin.which_key.mappings["sc"] = { "<CMD>Telescope git_status<CR>", "Changes (uncommitted)" }

lvim.builtin.which_key.mappings["f"] = { "<Plug>(leap-forward-to)", "Leap forward" }
lvim.builtin.which_key.mappings["F"] = { "<Plug>(leap-backward-to)", "Leap backward" }
lvim.builtin.which_key.vmappings["f"] = { "<Plug>(leap-forward-till)", "Move selection forward" }
lvim.builtin.which_key.vmappings["F"] = { "<Plug>(leap-backward-till)", "Move selection backward" }

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "vscode"
lvim.builtin.lualine.options.theme = "vscode"
-- lvim.builtin.lualine.style = "default"

lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.nvimtree.setup.view.width = 70
lvim.builtin.nvimtree.setup.filters.dotfiles = false

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.telescope.defaults = {
	path_display = { "absolute" },
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
	{
		"Mofiqul/vscode.nvim",
		config = function()
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				color_overrides = {
					vscDarkYellow = c.vscFront,
				},
			})
			require("vscode").load()
		end,
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
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
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
	{
		"ldelossa/gh.nvim",
		dependencies = { { "ldelossa/litee.nvim" } },
		config = function()
			require("litee.lib").setup()
			require("litee.gh").setup({
				-- deprecated, around for compatability for now.
				jump_mode = "invoking",
				-- remap the arrow keys to resize any litee.nvim windows.
				map_resize_keys = false,
				-- do not map any keys inside any gh.nvim buffers.
				disable_keymaps = false,
				-- the icon set to use.
				icon_set = "default",
				-- any custom icons to use.
				icon_set_custom = nil,
				-- whether to register the @username and #issue_number omnifunc completion
				-- in buffers which start with .git/
				git_buffer_completion = true,
				-- defines keymaps in gh.nvim buffers.
				keymaps = {
					-- when inside a gh.nvim panel, this key will open a node if it has
					-- any futher functionality. for example, hitting <CR> on a commit node
					-- will open the commit's changed files in a new gh.nvim panel.
					open = "<CR>",
					-- when inside a gh.nvim panel, expand a collapsed node
					expand = "zo",
					-- when inside a gh.nvim panel, collpased and expanded node
					collapse = "zc",
					-- when cursor is over a "#1234" formatted issue or PR, open its details
					-- and comments in a new tab.
					goto_issue = "gd",
					-- show any details about a node, typically, this reveals commit messages
					-- and submitted review bodys.
					details = "d",
					-- inside a convo buffer, submit a comment
					submit_comment = "<C-s>",
					-- inside a convo buffer, when your cursor is ontop of a comment, open
					-- up a set of actions that can be performed.
					actions = "<C-a>",
					-- inside a thread convo buffer, resolve the thread.
					resolve_thread = "<C-r>",
					-- inside a gh.nvim panel, if possible, open the node's web URL in your
					-- browser. useful particularily for digging into external failed CI
					-- checks.
					goto_web = "gx",
				},
			})

			local wk = require("which-key")
			wk.register({
				g = {
					name = "+Git",
					h = {
						name = "+Github",
						c = {
							name = "+Commits",
							c = { "<cmd>GHCloseCommit<cr>", "Close" },
							e = { "<cmd>GHExpandCommit<cr>", "Expand" },
							o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
							p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
							z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
						},
						i = {
							name = "+Issues",
							p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
						},
						l = {
							name = "+Litee",
							t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
						},
						r = {
							name = "+Review",
							b = { "<cmd>GHStartReview<cr>", "Begin" },
							c = { "<cmd>GHCloseReview<cr>", "Close" },
							d = { "<cmd>GHDeleteReview<cr>", "Delete" },
							e = { "<cmd>GHExpandReview<cr>", "Expand" },
							s = { "<cmd>GHSubmitReview<cr>", "Submit" },
							z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
						},
						p = {
							name = "+Pull Request",
							c = { "<cmd>GHClosePR<cr>", "Close" },
							d = { "<cmd>GHPRDetails<cr>", "Details" },
							e = { "<cmd>GHExpandPR<cr>", "Expand" },
							o = { "<cmd>GHOpenPR<cr>", "Open" },
							p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
							r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
							t = { "<cmd>GHOpenToPR<cr>", "Open To" },
							z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
						},
						t = {
							name = "+Threads",
							c = { "<cmd>GHCreateThread<cr>", "Create" },
							n = { "<cmd>GHNextThread<cr>", "Next" },
							t = { "<cmd>GHToggleThread<cr>", "Toggle" },
						},
					},
				},
			}, { prefix = "<leader>" })
		end,
	},
	{ "kdheepak/lazygit.nvim" },
	{
		"ggandor/leap.nvim",
		-- config = function()
		--   require('leap').add_default_mappings()
		-- end
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("telescope").load_extension("harpoon")
			require("harpoon").setup({
				global_settings = {
					-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
					save_on_toggle = false,
					-- saves the harpoon file upon every change. disabling is unrecommended.
					save_on_change = true,
					-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
					enter_on_sendcmd = false,
					-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
					tmux_autoclose_windows = false,
					-- filetypes that you want to prevent from adding to the harpoon list menu.
					excluded_filetypes = { "harpoon" },
					-- set marks specific to each git branch inside git repository
					mark_branch = false,
				},
			})
		end,
	},
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
