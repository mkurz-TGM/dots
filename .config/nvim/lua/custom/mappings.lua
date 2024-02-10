---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!




function FindAndFocusGitFolder()
 local root = vim.fn.getcwd() -- Get the current working directory
 local git_dir = root .. "/.git" -- Append ".git" to the root directory

 -- Check if the .git directory exists
 if vim.fn.isdirectory(git_dir) == 1 then
    require('nvim-tree').find_file(git_dir) -- Focus on the .git directory
 else
    -- Recursively search for the .git directory in parent directories
    local parent_dir = vim.fn.fnamemodify(root, ":h")
    if parent_dir ~= root then
      FindAndFocusGitFolder(parent_dir)
    end
 end
end

function _G.compile_and_run()
  local filename = vim.fn.expand("%:r")
  vim.cmd(":!g++ -Wall % -o " .. filename .. ".o")
  vim.cmd(":!./" .. filename .. ".o")
end


vim.api.nvim_set_keymap('n', '<leader>cp', ":lua _G.compile_and_run()<cr>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>', ':lua FindAndFocusGitFolder()<CR>', {noremap = true, silent = true})

return M
