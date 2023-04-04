local cmd = require('neo-tree.command')
vim.keymap.set('n', "<leader>o", function()
    cmd.execute {
        toggle = true,
        reveal = true
    }
end)

require("neo-tree").setup({
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
                        text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
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
                { "harpoon_index" }, --> This is what actually adds the component in where you want it
                { "diagnostics" },
                { "git_status",   highlight = "NeoTreeDimText" },
            }
        }
    },
})

-- -- CoC diagnostics (does not work at the moment)
-- local events = require("neo-tree.events")
-- local utils = require('neo-tree.utils')
-- events.destroy_event(events.VIM_DIAGNOSTIC_CHANGED)
-- events.define_autocmd_event(events.VIM_DIAGNOSTIC_CHANGED, { "User CocDiagnosticChange" }, 500, function(args)
--     args.diagnostics_lookup = utils.get_diagnostic_counts() -- <-- your handler here
--     return args
-- end)
