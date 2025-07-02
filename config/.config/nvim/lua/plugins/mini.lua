return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            -- Configure mini.move
            require("mini.move").setup({
                mappings = {
                    comment = "gc",
                    comment_line = "gcc",
                    textobject = "gc",
                },
                  options = {
                    -- Automatically reindent selection during linewise vertical move
                    reindent_linewise = true,
              },
            })

            -- Configure mini.cursorword
            require("mini.cursorword").setup({
            })
        end,
    },
}
-- return { 'echasnovski/mini.move', version = '*' }

