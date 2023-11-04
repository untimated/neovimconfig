
-- Surround
require("nvim-surround").setup({})

-- Auto Pair
-- require("nvim-autopairs").setup({
--     check_ts = true,
--     ts_config = {
--         lua = {'string'},
--         javascript = {'template_string'},
--         java=false
--     }
-- })

-- ====================
-- Comment
-- ====================

-- require('nvim_comment').setup({})
vim.api.nvim_create_autocmd({'BufEnter', 'BufFilePost'},
    {
        pattern="*.cpp, *.h",
        callback = function()
            vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
        end
    }
)

-- ====================
-- Lua Line
-- ====================

require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = '16color',
        component_separators = { left = '', right = ''},
        -- component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = false,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {{ 'buffers', max_length=vim.o.columns  } },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
  winbar = {
      -- lualine_a = {'buffers'}
  },
  inactive_winbar = {},
  extensions = {}
})



-- ====================
-- NVIM TREE
-- ====================

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
local on_attach_nvim_tree = require('nvim-tree-on-attach')
require('nvim-web-devicons').setup({
    default=true;
})
require("nvim-tree").setup({
    on_attach = on_attach_nvim_tree,
    --open_on_setup = true,
    --open_on_setup_file = true,
    sort_by = "case_sensitive",
    auto_reload_on_write=true,
    remove_keymaps ={"<C-t>"},
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                {key="u", aciton="dir_up"},
            },
        }
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
    },
    diagnostics = {
        enable =true,
    },
    filters = {
        dotfiles = false
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
})

local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1
	if not directory then
		return
	end
	vim.cmd.cd(data.file)
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})

-- ====================
-- NVIM Treesitter
-- ====================

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim","query" },
  modules ={},
  ignore_install={},

  indent = {
    enable=false,
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
