require'nvim_lsp'.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio"};
}
require'nvim_lsp'.vimls.setup{}
require'nvim_lsp'.sumneko_lua.setup{}
