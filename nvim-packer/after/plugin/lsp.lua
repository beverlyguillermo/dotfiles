local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- here you can setup the language servers

local solargraph_opts = {
  cmd = {
    "asdf",
    "exec",
    "solargraph",
    "stdio"
  }
--   },
--  capabilities = capabilities,
--  on_init = on_init,
}

require('lspconfig').solargraph.setup(solargraph_opts)
