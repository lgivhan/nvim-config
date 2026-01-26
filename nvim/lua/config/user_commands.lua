vim.api.nvim_create_user_command('H', function(table)
  vim.cmd('help ' .. table.args .. ' | only')
end, { desc = 'Open [H]elp in new tab', nargs = 1 })

-- Custom Git Sync (gs) command
-- Usage: :Gs "your commit message"
vim.api.nvim_create_user_command('Gs', function(opts)
    local msg = opts.args
    if msg == "" then
        print("Error: Commit message required!")
        return
    end

    -- The '!' runs it in your system shell
    -- '&&' ensures each step succeeds before moving to the next
    vim.cmd('!git add . && git commit -m "' .. msg .. '" && git push')
end, { nargs = 1 })
