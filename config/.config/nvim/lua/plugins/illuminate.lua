return {
    'RRethy/vim-illuminate',
    opts = {
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
    },
    config = function(_, opts)
        require('illuminate').configure(opts)
    end,
}
