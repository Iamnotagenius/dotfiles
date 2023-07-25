local cmd = require('neo-tree.command')
local neotree = require('neo-tree')
vim.keymap.set('n', "<leader>o", function()
    cmd.execute {
        toggle = true,
        reveal = true
    }
end)

neotree.setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    window = {
        mappings = {
            h = function(state)
                local node = state.tree:get_node()
                if (node.type == "directory" or node:has_children()) and node:is_expanded() then
                    state.commands.toggle_node(state)
                else
                    require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                end
            end,
            l = function(state)
                local node = state.tree:get_node()
                if node.type == "directory" or node:has_children() then
                    if not node:is_expanded() then
                        state.commands.toggle_node(state)
                    else
                        require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                    end
                end
                if node.type == "file" then
                    neotree.config.filesystem.commands.open(state)
                end
            end,
            ["<C-d>"] = function (state)
                local node = state.tree:get_node()
                vim.fn.jobstart({ "ripdrag", "-x",  node.path }, { detach = true })
            end,
        }
    },
    filesystem = {
        components = {
            harpoon_index = function(config, node, state)
                local Marked = require("harpoon.mark")
                local path = node:get_id()
                local succuss, index = pcall(Marked.get_index_of, path)
                if succuss and index and index > 0 then
                    return {
                        text = string.format("⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
                        highlight = config.highlight or "NeoTreeDirectoryIcon",
                    }
                else
                    return {}
                end
            end
        },
        renderers = {
            file = {
                { "icon" },
                { "name",         use_git_status_colors = true },
                { "git_status",   highlight = "NeoTreeDimText" },
                { "diagnostics" },
                { "harpoon_index" }, --> This is what actually adds the component in where you want it
            }
        }
    },
})
