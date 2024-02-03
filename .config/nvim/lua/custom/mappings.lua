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


function _G.compile_and_run()
  local filename = vim.fn.expand("%:r")
  vim.cmd(":!g++ -Wall % -o " .. filename .. ".o")
  vim.cmd(":!./" .. filename .. ".o")
end


vim.api.nvim_set_keymap('n', '<leader>cp', ":lua _G.compile_and_run()<cr>", {noremap = true, silent = true})

return M
