local function input(prompt)
    return vim.fn.input(prompt .. "\n> ")
end

local function cmd_surround(cmd)
    return {
        add = { { "\\" .. cmd .. "{" }, { "}" } },
        find = "\\" .. cmd .. "{.-}",
        change = { target = "(\\" .. cmd .. "{)().-(})()" },
        delete = "(\\" .. cmd .. "{)().-(})()"
    }
end

local function env_surround(env, close)
    if not close then
        close = env
    end
    return {
        add = { { "\\begin{" .. env .. "}" }, { "\\end{" .. close .. "}" } },
        find = "\\begin{" .. env .. "}.-\\end{" .. close .. "}",
        delete = "(\\begin{" .. env .. "})().-(\\end{" .. close .. "})()"
    }
end

require("nvim-surround").buffer_setup {
    surrounds = {
        ["c"] = {
            add = function()
                local cmd = input("Create Command: (empty to cancel)")
                if cmd == "" then
                    return nil
                end
                return { { "\\" .. cmd .. "{" }, { "}" } }
            end,
            find = "\\%a+{.-}",
        },
        ["e"] = {
            add = function ()
                local env = input("Create Environment: (empty to cancel)")
                if env == "" then
                    return nil
                end
                return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
            end
        },
        ["M"] = {
            add = { { "$$" }, { "$$"} },
            find = "%$%$.-%$%$",
            change = { target = "(%$%$)().-(%$%$)()" },
            delete = "(%$%$)().-(%$%$)()"
        },
        ["b"] = cmd_surround("textbf"),
        ["i"] = cmd_surround("textit"),
        ["t"] = cmd_surround("texttt"),
        ["C"] = env_surround("center"),
        ["d"] = {
            add = { "\\left(", "\\right)" }
        }
    },
    aliases = {
        ["m"] = "$",
        ["b"] = false,
    }
}
