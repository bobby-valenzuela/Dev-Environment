vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local bufnr = args.buf
    -- Skip if not a normal file buffer
    if vim.bo[bufnr].buftype ~= ""          -- no buftype (help, terminal, quickfix, etc.)
      or vim.bo[bufnr].filetype == ""        -- or empty filetype (often scratch/new buffers)
      or not vim.api.nvim_buf_get_name(bufnr) -- or no file name
    then
      return
    end

    -- Only run for real file buffers
    vim.cmd("IBLDisable")
    -- vim.diagnostic.disable()

    -- vim.cmd("normal! 20dd")  -- optional: force recompute
    -- vim.cmd("normal! zx")  -- optional: force recompute
  end,
  desc = "Simulate toggles only on real file buffers",
})



-- On first fold toggle (za) refresh fold method first with zx
vim.keymap.set('n', 'za', function()
  -- Run the sequence you want (zx + za)
  vim.cmd('normal! zxza')

  -- Immediately remove this temporary mapping
  -- so next za is the builtin one again
  vim.keymap.del('n', 'za')
end, { noremap = true, silent = true, desc = "One-time: zx + za (fold refresh + toggle)" })

