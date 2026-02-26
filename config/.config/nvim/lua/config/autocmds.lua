vim.api.nvim_create_autocmd("BufEnter", {
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

  end,
  desc = "Simulate toggles only on real file buffers",
})
