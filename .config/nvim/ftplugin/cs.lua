local lfs = require("lfs")
local xml2lua = require("xml2lua")
local xmlhandler = require("xmlhandler.tree")

local function up_dirs(path)
    return
    function (unused, path)
        if path:find("/") then
            local remaining, last = path:match("^(.*)/(.+)$")
            if not remaining then
                return nil
            elseif remaining:len() == 0 then
                return '/', last
            end
            return remaining, last
        end
    end,
    nil,
    path
end

local function set_csproj(context)
    if vim.b[context.buf].csproj ~= nil then
        return
    end

    local csproj = {}
    for dir, comp in up_dirs(context.match:gsub("(.*)/.+", "%1")) do
        for filename in lfs.dir(dir .. '/' .. comp) do
            local name = filename:match("(.+)%.csproj$")
            if name then
                csproj.dir = dir .. '/' .. comp
                csproj.file = csproj.dir .. '/' .. filename
                csproj.name = name
                local handler = xmlhandler:new()
                local xml = xml2lua.loadFile(csproj.file)
                xml2lua.parser(handler):parse(xml)
                local PropertyGroup = handler.root.Project.PropertyGroup
                csproj.framework = PropertyGroup.TargetFramework
                csproj.output_type = PropertyGroup.OutputType
            end
        end
    end

    vim.b[context.buf].csproj = csproj
    if csproj.output_type == "Exe" then
        vim.g.cs_exe_proj = csproj
    end
end


vim.api.nvim_create_autocmd({ "BufWinEnter", "BufAdd" }, { pattern = {"*.cs", "*.csproj"}, callback = set_csproj })
