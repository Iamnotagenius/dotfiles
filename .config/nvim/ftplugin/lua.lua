require("nvim-surround").buffer_setup {
    surrounds = {
        ["f"] = {
            add = { { "function ()" }, { "end"} },
            find = "function ().-end",
            change = { target = "(function %(%))().-(end)()" },
            delete = "(function %(%))().-(end)()"
        },
        ["F"] = {
            add = { { "function () " }, { " end"} },
            find = "function () .- end",
            change = { target = "(function %(%) )().-( end)()" },
            delete = "(function %(%) )().-( end)()"
        }
    },
    aliases = {
        ["f"] = false
    }
}
