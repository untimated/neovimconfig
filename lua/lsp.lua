local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['html'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- require('lspconfig')['vuels'].setup{
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }

require('lspconfig')['clangd'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require('lspconfig')['tsserver'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- local util = require('lspconfig.util')
-- local ccls_server_config = {
--     filetypes = {"c", "cpp", "objc", "objcpp", "opencl"},
--     root_dir = function(fname)
--         return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
--             or util.find_git_ancestor(fname)
--     end,
--     init_options = {cache = {
--         directory = --vim.env.XDG_CACHE_HOME .. "/ccls/",
-- 		vim.fs.normalize "~/.cache/ccls"
--     }},
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }
-- require('ccls').setup {
--     lsp = {lspconfig = ccls_server_config}
-- }
-- require('lspconfig')['ccls'].setup{
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }

require('lspconfig')['lua_ls'].setup{
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
}
