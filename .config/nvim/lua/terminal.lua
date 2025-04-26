local M = {}

---@class TerminalInfo
---@field buffer integer
---@field job integer
---@field win integer|nil
local TerminalInfo = {}

function TerminalInfo:open_terminal(...)
    self.win = vim.api.nvim_open_win(self.buffer, ...)
end

function TerminalInfo:close_terminal()
    vim.api.nvim_win_hide(self.win)
    self.win = nil
end

---Creates or gets already created TerminalInfo
---@return TerminalInfo
function M.get_terminal()
    if vim.g.term then
        return setmetatable(vim.g.term, { __index = TerminalInfo })
    end

    local buf = vim.api.nvim_create_buf(false,  true)
    local job
    vim.api.nvim_buf_call(buf, function ()
        job = vim.fn.jobstart(vim.o.shell, { term = true })
    end)
    vim.g.term = {
        buffer = buf,
        job = job,
        win = nil
    }
    return setmetatable(vim.g.term, { __index = TerminalInfo })
end

---@param term TerminalInfo
function M.set_terminal(term)
    vim.g.term = term
end

function M.open_terminal(...)
    local term = M.get_terminal()
    term:open_terminal(...)
    M.set_terminal(term)
end

function M.close_terminal()
    local term = M.get_terminal()
    term:close_terminal()
    M.set_terminal(term)
end


function M.toggle_terminal(...)
    local term = M.get_terminal()
    if not term.win then
        term:open_terminal(...)
    else
        term:close_terminal()
    end
    M.set_terminal(term)
    return term.win
end

return M
