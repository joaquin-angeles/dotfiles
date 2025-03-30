-- Load Lackluster color definitions without overriding habamax
vim.cmd("runtime colors/lackluster.lua")

-- Apply lackluster theme to Tree-sitter
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "lackluster",
    callback = function()
        local highlights = {
            ["@function"] = { link = "Function" },
            ["@variable"] = { link = "Identifier" },
            ["@type"] = { link = "Type" },
            ["@string"] = { link = "String" },
            ["@comment"] = { link = "Comment" },
        }

        for group, hl in pairs(highlights) do
            vim.api.nvim_set_hl(0, group, hl)
        end
    end,
})
