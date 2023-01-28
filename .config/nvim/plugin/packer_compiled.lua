-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/iamnotagenius/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/iamnotagenius/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/iamnotagenius/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/iamnotagenius/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/iamnotagenius/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["coc.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0+\1\2\0=\1\4\0K\0\1\0*coc_default_semantic_highlight_groups\6g\bvim\fcockeys\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["color-picker.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\16\0\0265\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\n\0'\3\v\0B\1\2\0029\1\f\0015\3\14\0005\4\r\0=\4\15\3B\1\2\1K\0\1\0\nicons\1\0\0\1\3\0\0\b█\b\nsetup\17color-picker\frequire\29<cmd>PickColorInsert<cr>\n<M-c>\6i\23<cmd>PickColor<cr>\14<leader>c\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/color-picker.nvim",
    url = "https://github.com/ziontee113/color-picker.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�;\0\0\5\0\v\0\0254\0\a\0005\1\0\0>\1\1\0005\1\1\0>\1\2\0005\1\2\0>\1\3\0005\1\3\0>\1\4\0005\1\4\0>\1\5\0005\1\5\0>\1\6\0006\1\6\0009\1\a\0016\3\b\0009\3\t\3B\3\1\0A\1\0\0016\1\6\0009\1\n\1\21\3\0\0B\1\2\0028\1\1\0L\1\2\0\vrandom\ttime\aos\15randomseed\tmath\1\17\0\0\5Y⢰⡟⣡⡟⣱⣿⡿⠡⢛⣋⣥⣴⣌⢿⣿⣿⣿⣿⣷⣌⠻⢿⣿⣿⣿⣿⣿⣿Y⠏⢼⡿⣰⡿⠿⠡⠿⠿⢯⣉⠿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣦⣍⠻⢿⣿⣿⣿Y⣼⣷⢠⠀⠀⢠⣴⡖⠀⠀⠈⠻⣿⡿⣿⣿⣿⣿⣿⣛⣯⣝⣻⣿⣶⣿⣿⣿Y⣿⡇⣿⡷⠂⠈⡉⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣍⡤⣤⣤⣤⡀⠀⠉⠛⠿Y⣿⢸⣿⡅⣠⣬⣥⣤⣴⣴⣿⣿⢿⣿⣿⣿⣿⣿⣟⡭⡄⣀⣉⡀⠀⠀⠀⠀Y⡟⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣶⣦⣈⠀⠀⠀⢀⣶Y⡧⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿Y⡇⣿⠃⣿⣿⣿⣿⣿⠛⠛⢫⣿⣿⣻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿Y⡇⣿⠘⡇⢻⣿⣿⣿⡆⠀⠀⠀⠀⠈⠉⠙⠻⠏⠛⠻⣿⣿⣿⣿⣿⣭⡾⢁Y⡇⣿⠀⠘⢿⣿⣿⣿⣧⢠⣤⠀⡤⢀⣠⣀⣀⠀⠀⣼⣿⣿⣿⣿⣿⠟⣁⠉Y⣧⢻⠀⡄⠀⠹⣿⣿⣿⡸⣿⣾⡆⣿⣿⣿⠿⣡⣾⣿⣿⣿⣿⡿⠋⠐⢡⣶Y⣿⡘⠈⣷⠀⠀⠈⠻⣿⣷⣎⠐⠿⢟⣋⣤⣾⣿⣿⣿⡿⠟⣩⠖⢠⡬⠈⠀Y⣿⣧⠁⢻⡇⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⢀⠈⢀⡴⠈⠁⠀⠀K⠻⣿⣆⠘⣿⠀⠀  ⠀⠈⠙⠛⠋⠉⠀⠀⠀⠀⡀⠤⠚⠁     \5\1\16\0\0\5_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠉⠙⠻⣅⠀⠈⢧⠀⠈⠛⠉⠉⢻⣿⣿_⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⠟⠀⠀⣈⠓⢤⣶⡶⠿⠛⠻⣿_⣿⣿⣿⣿⣿⢣⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⣴⠶⠿⠿⢷⡄⠀⠀⢀⣤⣾⣿_⣿⣿⣿⣿⣡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⣤⣤⡀⠀⢷⡀⠀⠀⣻⣿⣿_⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠛⠶⠛⠃⠈⠈⢿⣿⣿_⣿⣿⠟⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠈⣿⣿_⣿⠏⠀⠁⠀⠀⠀⠀⠀⠀⠀⢀⣶⡄⠀⠀⠀⠀⠀⠀⣡⣄⣿⡆⠀⠀⠀⠀⣿⣿_⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠛⢛⣲⣶⣿⣷⣉⠉⢉⣥⡄⠀⠀⠀⠨⣿⣿_⡇⢠⡆⠀⠀⢰⠀⠀⠀⠀⢸⣿⣧⣠⣿⣿⣿⣿⣿⣿⣷⣾⣿⡅⠀⠀⡄⠠⢸⣿_⣧⠸⣇⠀⠀⠘⣤⡀⠀⠀⠘⣿⣿⣿⣿⣿⠟⠛⠻⣿⣿⣿⡿⢁⠀⠀⢰⠀⢸⣿_⣿⣷⣽⣦⠀⠀⠙⢷⡀⠀⠀⠙⠻⠿⢿⣷⣾⣿⣶⠾⢟⣥⣾⣿⣧⠀⠂⢀⣿⣿_⣿⣿⣿⣿⣷⣆⣠⣤⣤⣤⣀⣀⡀⠀⠒⢻⣶⣾⣿⣿⣿⣿⣿⣿⣿⢀⣀⣾⣿⣿\5\1\17\0\0\5_⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕_⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕_⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑_⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐_⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐_⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔_⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕_⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕_⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕_⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕_⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁_⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿\5\1\18\0\0\5a ⡿⠉⠄⠄⠄⠄⠈⠙⠿⠟⠛⠉⠉⠉⠄⠄⠄⠈⠉⠉⠉⠛⠛⠻⢿⣿⣿⣿⣿⣿ a ⠁⠄⠄⠄⢀⡴⣋⣵⣮⠇⡀⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⡀⠄⠄⠄⠈⠛⠿⠋⠉ a ⠄⠄⠄⢠⣯⣾⣿⡿⣳⡟⣰⣿⣠⣂⡀⢀⠄⢸⡄⠄⢀⣈⢆⣱⣤⡀⢄⠄⠄⠄ a ⠄⠄⠄⣼⣿⣿⡟⣹⡿⣸⣿⢳⣿⣿⣿⣿⣴⣾⢻⣆⣿⣿⣯⢿⣿⣿⣷⣧⣀⣤ a ⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏⠋ a ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄ a ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄ a ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄ a ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄ a ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄ a ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄ a ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄ a ⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁⣸ a ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿ a ⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇⠸⢾ \5\1\16\0\0\5[ ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿ [ ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿ [ ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿ [ ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿ [ ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮ W   ⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀ W   ⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸ W   ⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀ W   ⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾ W   ⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿ S    ⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇ ⢸⣿⣿⣿ Q    ⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏  ⢸⣿⣿⣿ M    ⣿⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟    ⢿⣿⣿ \5\1\17\0\0\5a ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ a ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ a ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ a ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ a ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ a ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ a ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ a ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ a ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ a ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ a ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ a ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ a ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ a ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ \5�\4\1\0\3\0\t\0\0166\0\0\0'\2\1\0B\0\2\0023\1\3\0=\1\2\0004\1\5\0005\2\5\0>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\0015\2\b\0>\2\4\1=\1\4\0K\0\1\0\1\0\4\tdesc+Find  word                            \rshortcut\b\\fg\ticon\n  \vaction\24Telescope live_grep\1\0\4\tdesc+File Browser                          \rshortcut\b\\ff\ticon\n  \vaction\27Telescope file_browser\1\0\4\tdesc+Find File                             \rshortcut\b\\fF\ticon\n  \vaction%Telescope find_files hidden=true\1\0\4\tdesc+Recent files                          \rshortcut\b\\fr\ticon\n  \vaction\23Telescope oldfiles\18custom_center\0\18custom_header\14dashboard\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\2\19char_blankline\b┊\25show_current_context\2\nsetup\21indent_blankline\frequire>hi IndentBlankLineContextChar gui=nocombine guifg=#5961697hi IndentBlankLineChar gui=nocombine guifg=#353d45\bcmd\bvim\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\6\0\0146\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\2\a\0\4\0X\1\2�'\1\4\0L\1\2\0'\1\5\0\18\2\0\0&\1\2\1L\1\2\0\t \5\bget\vkeymap\bopt\bvim�\3\1\0\a\0\22\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0005\6\n\0=\6\v\5>\5\1\4=\4\f\3=\3\r\0025\3\16\0004\4\3\0005\5\14\0005\6\15\0=\6\v\5>\5\1\4=\4\17\0035\4\19\0003\5\18\0>\5\1\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\rsections\14lualine_x\1\3\0\0\0\rfiletype\0\14lualine_c\1\0\0\1\0\4\rreadonly\t \fnewfile\t ﱐ\rmodified\t \funnamed\b\1\2\2\0\rfilename\tpath\3\1\19newfile_status\2\ftabline\14lualine_z\fsymbols\1\0\3\19alternate_file\t \rmodified\t \14directory\b\1\2\0\0\fbuffers\14lualine_a\1\0\0\1\2\1\0\ttabs\tmode\3\1\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\v\0\0166\0\0\0009\0\1\0009\0\2\0\v\0\0\0X\1\3�6\1\3\0'\3\4\0B\1\2\0019\1\5\0'\2\6\0009\3\a\0'\4\b\0009\5\t\0'\6\n\0&\1\6\1L\1\2\0\t.dll\tname\6/\14framework\16/bin/Debug/\bdir\26No executable project\nerror\16cs_exe_proj\6g\bvim�\t\1\0\a\0.\0�\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0006\4\15\0'\6\16\0B\4\2\0029\4\17\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\18\0006\4\15\0'\6\16\0B\4\2\0029\4\19\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0006\4\15\0'\6\16\0B\4\2\0029\4\21\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\22\0006\4\15\0'\6\16\0B\4\2\0029\4\23\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\24\0006\4\15\0'\6\16\0B\4\2\0029\4\25\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\26\0006\4\15\0'\6\16\0B\4\2\0029\4\27\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\28\0006\4\15\0'\6\16\0B\4\2\0029\4\29\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\30\0006\4\15\0'\6\16\0B\4\2\0029\4\31\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3 \0006\4\15\0'\6\16\0B\4\2\0029\4!\4B\0\4\0016\0\15\0'\2\16\0B\0\2\0029\1\"\0005\2$\0005\3%\0=\3&\2=\2#\0019\1'\0004\2\3\0005\3)\0005\4*\0=\4+\0033\4,\0=\4-\3>\3\1\2=\2(\1K\0\1\0\fprogram\0\benv\1\0\2\23DOTNET_ENVIRONMENT\16Development\20ASPNETCORE_URLS1http://localhost:5170;https://localhost:7113\1\0\3\frequest\vlaunch\tname\24launch - netcoredbg\ttype\fcoreclr\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\fcommand\15netcoredbg\ttype\15executable\fcoreclr\radapters\18run_to_cursor\15<leader>dr\tdown\15<leader>dj\aup\15<leader>dk\rstep_out\16<leader>dsk\14step_into\16<leader>dsj\14step_over\15<leader>dn\14terminate\15<leader>dt\rcontinue\15<leader>dc\22toggle_breakpoint\bdap\frequire\15<leader>db\6n\bset\vkeymap\1\0\4\vtexthl\vString\vlinehl\fCocBold\nnumhl\5\ttext\b\15DapStopped\1\0\4\vtexthl\rQuestion\vlinehl\5\nnumhl\5\ttext\b\16DapLogPoint\1\0\4\vtexthl\rErrorMsg\vlinehl\5\nnumhl\5\ttext\b\26DapBreakpointRejected\1\0\4\vtexthl\15Identifier\vlinehl\5\nnumhl\nTitle\ttext\b\18DapBreakpoint\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nD\0\0\4\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0+\2\0\0005\3\3\0B\0\3\1K\0\1\0\1\0\1\nenter\2\teval\ndapui\frequire�\1\1\0\a\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\b\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\t\0'\3\n\0003\4\v\0B\0\4\1K\0\1\0\0\15<leader>dh\1\3\0\0\6n\6v\vtoggle\15<leader>du\6n\bset\vkeymap\bvim\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\fdisable\1\6\0\0\6c\bcpp\thelp\bman\acs\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["omnisharp-vim"] = {
    config = { "\27LJ\2\n�\15\0\0\5\0?\0�\0016\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0+\1\1\0=\1\v\0006\0\0\0009\0\1\0)\1\2\0=\1\f\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0006\0\0\0009\0\1\0'\1\16\0=\1\15\0006\0\0\0009\0\1\0)\1\0\0=\1\17\0006\0\0\0009\0\1\0)\1\0\0=\1\18\0006\0\0\0009\0\1\0+\1\2\0=\1\19\0006\0\0\0009\0\1\0)\1\3\0=\1\20\0006\0\0\0009\0\1\0+\1\2\0=\1\21\0006\0\0\0009\0\1\0005\1\23\0=\1\22\0006\0\0\0009\0\1\0005\1\26\0005\2\25\0=\2\27\0015\2\28\0=\2\29\0015\2\30\0=\2\31\1=\1\24\0006\0\0\0009\0\1\0005\1!\0=\1 \0006\0\0\0009\0\"\0009\0#\0'\2$\0'\3%\0'\4&\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\3'\0'\4(\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\3)\0'\4*\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\3+\0'\4,\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\3-\0'\4.\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\3/\0'\0040\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\0031\0'\0042\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\0033\0'\0044\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\0035\0'\0046\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\0037\0'\0048\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\0039\0'\4:\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2$\0'\3;\0'\4<\0B\0\4\0016\0\0\0009\0\"\0009\0#\0'\2=\0'\3>\0'\4.\0B\0\4\1K\0\1\0\n<C-s>\6i\30<Plug>(ale_previous_wrap)\a[g\26<Plug>(ale_next_wrap)\a]g\29<Plug>(omnisharp_rename)\t<F2>#<Plug>(omnisharp_code_actions)\14<leader>a+<Plug>(omnisharp_find_implementations)\14<leader>i$<Plug>(omnisharp_documentation)\14<leader>h\"<Plug>(omnisharp_find_usages)\14<leader>u%<Plug>(omnisharp_signature_help)\14<leader>s)<Plug>(omnisharp_preview_definition)\14<leader>y(<Plug>(omnisharp_run_tests_in_file)\14<leader>R\31<Plug>(omnisharp_run_test)\14<leader>r'<Plug>(omnisharp_go_to_definition)\agd\6n\bset\vkeymap\1\0\18\22TypeParameterName\20@type.parameter\fKeyword\r@keyword\15StructName\f@struct\17PropertyName\14@property\18ParameterName\15@parameter\18NamespaceName\15@namespace\15MethodName\f@method\14LocalName\14@variable\18InterfaceName\15@interface\14FieldName\14@variable\24ExtensionMethodName\16@ext.method\14EventName\n@type\rEnumName\n@enum\19EnumMemberName\14@constant\17DelegateName\n@type\19ControlKeyword\17@conditional\17ConstantName\14@constant\14ClassName\n@type\31OmniSharp_highlight_groups\fIDE0008\1\0\1\ttype\tNone\fIDE0160\1\0\1\ttype\tNone\vSA1309\1\0\0\1\0\1\ttype\tNone#OmniSharp_diagnostic_overrides\1\0\2\vborder\frounded\rwinblend\3(\28OmniSharp_popup_options OmniSharp_diagnostic_showid\27OmniSharp_highlighting\30OmniSharp_server_use_net6\26ale_virtualtext_delay\19ale_lint_delay\valways\29ale_lint_on_text_changed\b<- \27ale_virtualtext_prefix\27ale_virtualtext_cursor\20ale_echo_cursor\b\21ale_sign_warning\b\19ale_sign_error\20ale_disable_lsp\acs\1\0\0\1\2\0\0\14OmniSharp\16ale_linters\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim",
    url = "https://github.com/OmniSharp/omnisharp-vim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-glyph.nvim"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/telescope-glyph.nvim",
    url = "https://github.com/ghassan0/telescope-glyph.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nc\0\1\5\1\4\0\n6\1\0\0'\3\1\0B\1\2\2-\2\0\0009\2\2\2\18\4\0\0B\2\2\0019\2\3\1B\2\1\1K\0\1\0\1�\17put_template\23create_from_prompt\14templates\frequireL\0\1\a\0\5\0\v6\1\0\0009\1\1\0019\1\2\0014\3\3\0009\4\3\0>\4\1\3'\4\4\0+\5\1\0+\6\2\0B\1\5\1K\0\1\0\6c\nvalue\rnvim_put\bapi\bvimy\0\0\6\1\b\0\r-\0\0\0009\0\0\0009\0\1\0009\0\1\0005\2\2\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2=\3\a\2B\0\2\1K\0\1\0\0�\bcwd\n%:p:h\vexpand\afn\bvim\1\0\1\fgrouped\2\17file_browser\15extensions�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\1\5\0\0\14~/scripts\14~/.config\14~/Sources\14~/Writing\15find_files\22telescope.builtin\frequire[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20grep_open_files\2\14live_grep\22telescope.builtin\frequire�\1\0\0\a\0\b\1\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4B\4\1\0?\4\0\0=\3\a\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\15buffer_dir\20telescope.utils\1\2\0\0\6.\14live_grep\22telescope.builtin\frequire\5����\4�\1\0\0\4\1\5\0\t-\0\0\0009\0\0\0009\0\1\0009\0\1\0005\2\2\0005\3\3\0=\3\4\2B\0\2\1K\0\1\0\0�\18layout_config\1\0\2\vheight\4\0����\3\nwidth\4����\t����\3\1\0\1\20layout_strategy\vcursor\nglyph\15extensions�\a\1\0\v\0009\0�\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\1\4\0013\2\5\0009\3\6\0005\5\14\0005\6\a\0005\a\t\0005\b\b\0=\b\n\a5\b\v\0=\b\f\a=\a\r\6=\6\15\0055\6\19\0005\a\17\0003\b\16\0=\b\18\a=\a\20\0065\a\28\0005\b\23\0005\t\21\0=\2\22\t=\t\24\b5\t\25\0=\2\26\t=\t\27\b=\b\29\a=\a\3\6=\6\2\5B\3\2\0019\3\30\0'\5\31\0B\3\2\0019\3\30\0'\5\20\0B\3\2\0019\3\30\0'\5\3\0B\3\2\0015\3 \0006\4\0\0'\6!\0B\4\2\0026\5\"\0009\5#\0059\5$\5'\a\24\0'\b%\0003\t&\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b'\0009\t(\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b)\0003\t*\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b+\0003\t,\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b-\0003\t.\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b/\0009\t0\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b1\0009\t2\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b3\0009\t4\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b5\0003\t6\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b7\0009\t8\4\18\n\3\0B\5\5\0012\0\0�K\0\1\0\15treesitter\15<leader>ft\0\15<leader>fe\14man_pages\15<leader>fm\14help_tags\15<leader>fh\fbuffers\15<leader>fb\0\15<leader>fG\0\15<leader>fg\0\15<leader>fF\roldfiles\15<leader>fr\0\15<leader>ff\bset\vkeymap\bvim\22telescope.builtin\1\0\1\nremap\1\bfzf\19load_extension\rmappings\1\0\0\6i\v<S-CR>\1\0\0\6n\1\0\0\6c\1\0\0\nglyph\1\0\0\vaction\1\0\0\0\rdefaults\1\0\0\18layout_config\rvertical\1\0\2\vmirror\2\20prompt_position\btop\tflex\1\0\2\nwidth\4͙��\f̙��\3\19preview_cutoff\3\n\1\0\1\17flip_columns\3U\1\0\1\20layout_strategy\tflex\nsetup\0\factions\17file_browser\15extensions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-cpp-enhanced-highlight"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/vim-cpp-enhanced-highlight",
    url = "https://github.com/octol/vim-cpp-enhanced-highlight"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  vimagit = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/vimagit",
    url = "https://github.com/jreybert/vimagit"
  },
  vimtex = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vvimtex\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�;\0\0\5\0\v\0\0254\0\a\0005\1\0\0>\1\1\0005\1\1\0>\1\2\0005\1\2\0>\1\3\0005\1\3\0>\1\4\0005\1\4\0>\1\5\0005\1\5\0>\1\6\0006\1\6\0009\1\a\0016\3\b\0009\3\t\3B\3\1\0A\1\0\0016\1\6\0009\1\n\1\21\3\0\0B\1\2\0028\1\1\0L\1\2\0\vrandom\ttime\aos\15randomseed\tmath\1\17\0\0\5Y⢰⡟⣡⡟⣱⣿⡿⠡⢛⣋⣥⣴⣌⢿⣿⣿⣿⣿⣷⣌⠻⢿⣿⣿⣿⣿⣿⣿Y⠏⢼⡿⣰⡿⠿⠡⠿⠿⢯⣉⠿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣦⣍⠻⢿⣿⣿⣿Y⣼⣷⢠⠀⠀⢠⣴⡖⠀⠀⠈⠻⣿⡿⣿⣿⣿⣿⣿⣛⣯⣝⣻⣿⣶⣿⣿⣿Y⣿⡇⣿⡷⠂⠈⡉⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣍⡤⣤⣤⣤⡀⠀⠉⠛⠿Y⣿⢸⣿⡅⣠⣬⣥⣤⣴⣴⣿⣿⢿⣿⣿⣿⣿⣿⣟⡭⡄⣀⣉⡀⠀⠀⠀⠀Y⡟⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣶⣦⣈⠀⠀⠀⢀⣶Y⡧⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿Y⡇⣿⠃⣿⣿⣿⣿⣿⠛⠛⢫⣿⣿⣻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿Y⡇⣿⠘⡇⢻⣿⣿⣿⡆⠀⠀⠀⠀⠈⠉⠙⠻⠏⠛⠻⣿⣿⣿⣿⣿⣭⡾⢁Y⡇⣿⠀⠘⢿⣿⣿⣿⣧⢠⣤⠀⡤⢀⣠⣀⣀⠀⠀⣼⣿⣿⣿⣿⣿⠟⣁⠉Y⣧⢻⠀⡄⠀⠹⣿⣿⣿⡸⣿⣾⡆⣿⣿⣿⠿⣡⣾⣿⣿⣿⣿⡿⠋⠐⢡⣶Y⣿⡘⠈⣷⠀⠀⠈⠻⣿⣷⣎⠐⠿⢟⣋⣤⣾⣿⣿⣿⡿⠟⣩⠖⢠⡬⠈⠀Y⣿⣧⠁⢻⡇⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⢀⠈⢀⡴⠈⠁⠀⠀K⠻⣿⣆⠘⣿⠀⠀  ⠀⠈⠙⠛⠋⠉⠀⠀⠀⠀⡀⠤⠚⠁     \5\1\16\0\0\5_⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿_⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠉⠙⠻⣅⠀⠈⢧⠀⠈⠛⠉⠉⢻⣿⣿_⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⠟⠀⠀⣈⠓⢤⣶⡶⠿⠛⠻⣿_⣿⣿⣿⣿⣿⢣⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⣴⠶⠿⠿⢷⡄⠀⠀⢀⣤⣾⣿_⣿⣿⣿⣿⣡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⣤⣤⡀⠀⢷⡀⠀⠀⣻⣿⣿_⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠛⠶⠛⠃⠈⠈⢿⣿⣿_⣿⣿⠟⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠈⣿⣿_⣿⠏⠀⠁⠀⠀⠀⠀⠀⠀⠀⢀⣶⡄⠀⠀⠀⠀⠀⠀⣡⣄⣿⡆⠀⠀⠀⠀⣿⣿_⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠛⢛⣲⣶⣿⣷⣉⠉⢉⣥⡄⠀⠀⠀⠨⣿⣿_⡇⢠⡆⠀⠀⢰⠀⠀⠀⠀⢸⣿⣧⣠⣿⣿⣿⣿⣿⣿⣷⣾⣿⡅⠀⠀⡄⠠⢸⣿_⣧⠸⣇⠀⠀⠘⣤⡀⠀⠀⠘⣿⣿⣿⣿⣿⠟⠛⠻⣿⣿⣿⡿⢁⠀⠀⢰⠀⢸⣿_⣿⣷⣽⣦⠀⠀⠙⢷⡀⠀⠀⠙⠻⠿⢿⣷⣾⣿⣶⠾⢟⣥⣾⣿⣧⠀⠂⢀⣿⣿_⣿⣿⣿⣿⣷⣆⣠⣤⣤⣤⣀⣀⡀⠀⠒⢻⣶⣾⣿⣿⣿⣿⣿⣿⣿⢀⣀⣾⣿⣿\5\1\17\0\0\5_⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕_⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕_⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕_⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑_⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐_⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐_⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔_⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕_⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕_⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕_⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕_⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁_⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿\5\1\18\0\0\5a ⡿⠉⠄⠄⠄⠄⠈⠙⠿⠟⠛⠉⠉⠉⠄⠄⠄⠈⠉⠉⠉⠛⠛⠻⢿⣿⣿⣿⣿⣿ a ⠁⠄⠄⠄⢀⡴⣋⣵⣮⠇⡀⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⡀⠄⠄⠄⠈⠛⠿⠋⠉ a ⠄⠄⠄⢠⣯⣾⣿⡿⣳⡟⣰⣿⣠⣂⡀⢀⠄⢸⡄⠄⢀⣈⢆⣱⣤⡀⢄⠄⠄⠄ a ⠄⠄⠄⣼⣿⣿⡟⣹⡿⣸⣿⢳⣿⣿⣿⣿⣴⣾⢻⣆⣿⣿⣯⢿⣿⣿⣷⣧⣀⣤ a ⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏⠋ a ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄ a ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄ a ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄ a ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄ a ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄ a ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄ a ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄ a ⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁⣸ a ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿ a ⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇⠸⢾ \5\1\16\0\0\5[ ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿ [ ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿ [ ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿ [ ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿ [ ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮ W   ⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀ W   ⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸ W   ⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀ W   ⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾ W   ⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿ S    ⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇ ⢸⣿⣿⣿ Q    ⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏  ⢸⣿⣿⣿ M    ⣿⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟    ⢿⣿⣿ \5\1\17\0\0\5a ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ a ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ a ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ a ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ a ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ a ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ a ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ a ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ a ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ a ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ a ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ a ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ a ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ a ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ \5�\4\1\0\3\0\t\0\0166\0\0\0'\2\1\0B\0\2\0023\1\3\0=\1\2\0004\1\5\0005\2\5\0>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\0015\2\b\0>\2\4\1=\1\4\0K\0\1\0\1\0\4\tdesc+Find  word                            \rshortcut\b\\fg\ticon\n  \vaction\24Telescope live_grep\1\0\4\tdesc+File Browser                          \rshortcut\b\\ff\ticon\n  \vaction\27Telescope file_browser\1\0\4\tdesc+Find File                             \rshortcut\b\\fF\ticon\n  \vaction%Telescope find_files hidden=true\1\0\4\tdesc+Recent files                          \rshortcut\b\\fr\ticon\n  \vaction\23Telescope oldfiles\18custom_center\0\18custom_header\14dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vvimtex\frequire\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nc\0\1\5\1\4\0\n6\1\0\0'\3\1\0B\1\2\2-\2\0\0009\2\2\2\18\4\0\0B\2\2\0019\2\3\1B\2\1\1K\0\1\0\1�\17put_template\23create_from_prompt\14templates\frequireL\0\1\a\0\5\0\v6\1\0\0009\1\1\0019\1\2\0014\3\3\0009\4\3\0>\4\1\3'\4\4\0+\5\1\0+\6\2\0B\1\5\1K\0\1\0\6c\nvalue\rnvim_put\bapi\bvimy\0\0\6\1\b\0\r-\0\0\0009\0\0\0009\0\1\0009\0\1\0005\2\2\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2=\3\a\2B\0\2\1K\0\1\0\0�\bcwd\n%:p:h\vexpand\afn\bvim\1\0\1\fgrouped\2\17file_browser\15extensions�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\1\5\0\0\14~/scripts\14~/.config\14~/Sources\14~/Writing\15find_files\22telescope.builtin\frequire[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20grep_open_files\2\14live_grep\22telescope.builtin\frequire�\1\0\0\a\0\b\1\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4B\4\1\0?\4\0\0=\3\a\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\15buffer_dir\20telescope.utils\1\2\0\0\6.\14live_grep\22telescope.builtin\frequire\5����\4�\1\0\0\4\1\5\0\t-\0\0\0009\0\0\0009\0\1\0009\0\1\0005\2\2\0005\3\3\0=\3\4\2B\0\2\1K\0\1\0\0�\18layout_config\1\0\2\vheight\4\0����\3\nwidth\4����\t����\3\1\0\1\20layout_strategy\vcursor\nglyph\15extensions�\a\1\0\v\0009\0�\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\1\4\0013\2\5\0009\3\6\0005\5\14\0005\6\a\0005\a\t\0005\b\b\0=\b\n\a5\b\v\0=\b\f\a=\a\r\6=\6\15\0055\6\19\0005\a\17\0003\b\16\0=\b\18\a=\a\20\0065\a\28\0005\b\23\0005\t\21\0=\2\22\t=\t\24\b5\t\25\0=\2\26\t=\t\27\b=\b\29\a=\a\3\6=\6\2\5B\3\2\0019\3\30\0'\5\31\0B\3\2\0019\3\30\0'\5\20\0B\3\2\0019\3\30\0'\5\3\0B\3\2\0015\3 \0006\4\0\0'\6!\0B\4\2\0026\5\"\0009\5#\0059\5$\5'\a\24\0'\b%\0003\t&\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b'\0009\t(\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b)\0003\t*\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b+\0003\t,\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b-\0003\t.\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b/\0009\t0\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b1\0009\t2\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b3\0009\t4\4\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b5\0003\t6\0\18\n\3\0B\5\5\0016\5\"\0009\5#\0059\5$\5'\a\24\0'\b7\0009\t8\4\18\n\3\0B\5\5\0012\0\0�K\0\1\0\15treesitter\15<leader>ft\0\15<leader>fe\14man_pages\15<leader>fm\14help_tags\15<leader>fh\fbuffers\15<leader>fb\0\15<leader>fG\0\15<leader>fg\0\15<leader>fF\roldfiles\15<leader>fr\0\15<leader>ff\bset\vkeymap\bvim\22telescope.builtin\1\0\1\nremap\1\bfzf\19load_extension\rmappings\1\0\0\6i\v<S-CR>\1\0\0\6n\1\0\0\6c\1\0\0\nglyph\1\0\0\vaction\1\0\0\0\rdefaults\1\0\0\18layout_config\rvertical\1\0\2\vmirror\2\20prompt_position\btop\tflex\1\0\2\nwidth\4͙��\f̙��\3\19preview_cutoff\3\n\1\0\1\17flip_columns\3U\1\0\1\20layout_strategy\tflex\nsetup\0\factions\17file_browser\15extensions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0+\1\2\0=\1\4\0K\0\1\0*coc_default_semantic_highlight_groups\6g\bvim\fcockeys\frequire\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: color-picker.nvim
time([[Config for color-picker.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\16\0\0265\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\n\0'\3\v\0B\1\2\0029\1\f\0015\3\14\0005\4\r\0=\4\15\3B\1\2\1K\0\1\0\nicons\1\0\0\1\3\0\0\b█\b\nsetup\17color-picker\frequire\29<cmd>PickColorInsert<cr>\n<M-c>\6i\23<cmd>PickColor<cr>\14<leader>c\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0", "config", "color-picker.nvim")
time([[Config for color-picker.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\6\0\0146\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\2\a\0\4\0X\1\2�'\1\4\0L\1\2\0'\1\5\0\18\2\0\0&\1\2\1L\1\2\0\t \5\bget\vkeymap\bopt\bvim�\3\1\0\a\0\22\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0005\6\n\0=\6\v\5>\5\1\4=\4\f\3=\3\r\0025\3\16\0004\4\3\0005\5\14\0005\6\15\0=\6\v\5>\5\1\4=\4\17\0035\4\19\0003\5\18\0>\5\1\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\rsections\14lualine_x\1\3\0\0\0\rfiletype\0\14lualine_c\1\0\0\1\0\4\rreadonly\t \fnewfile\t ﱐ\rmodified\t \funnamed\b\1\2\2\0\rfilename\tpath\3\1\19newfile_status\2\ftabline\14lualine_z\fsymbols\1\0\3\19alternate_file\t \rmodified\t \14directory\b\1\2\0\0\fbuffers\14lualine_a\1\0\0\1\2\1\0\ttabs\tmode\3\1\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\v\0\0166\0\0\0009\0\1\0009\0\2\0\v\0\0\0X\1\3�6\1\3\0'\3\4\0B\1\2\0019\1\5\0'\2\6\0009\3\a\0'\4\b\0009\5\t\0'\6\n\0&\1\6\1L\1\2\0\t.dll\tname\6/\14framework\16/bin/Debug/\bdir\26No executable project\nerror\16cs_exe_proj\6g\bvim�\t\1\0\a\0.\0�\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0006\4\15\0'\6\16\0B\4\2\0029\4\17\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\18\0006\4\15\0'\6\16\0B\4\2\0029\4\19\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0006\4\15\0'\6\16\0B\4\2\0029\4\21\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\22\0006\4\15\0'\6\16\0B\4\2\0029\4\23\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\24\0006\4\15\0'\6\16\0B\4\2\0029\4\25\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\26\0006\4\15\0'\6\16\0B\4\2\0029\4\27\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\28\0006\4\15\0'\6\16\0B\4\2\0029\4\29\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\30\0006\4\15\0'\6\16\0B\4\2\0029\4\31\4B\0\4\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3 \0006\4\15\0'\6\16\0B\4\2\0029\4!\4B\0\4\0016\0\15\0'\2\16\0B\0\2\0029\1\"\0005\2$\0005\3%\0=\3&\2=\2#\0019\1'\0004\2\3\0005\3)\0005\4*\0=\4+\0033\4,\0=\4-\3>\3\1\2=\2(\1K\0\1\0\fprogram\0\benv\1\0\2\23DOTNET_ENVIRONMENT\16Development\20ASPNETCORE_URLS1http://localhost:5170;https://localhost:7113\1\0\3\frequest\vlaunch\tname\24launch - netcoredbg\ttype\fcoreclr\acs\19configurations\targs\1\2\0\0\25--interpreter=vscode\1\0\2\fcommand\15netcoredbg\ttype\15executable\fcoreclr\radapters\18run_to_cursor\15<leader>dr\tdown\15<leader>dj\aup\15<leader>dk\rstep_out\16<leader>dsk\14step_into\16<leader>dsj\14step_over\15<leader>dn\14terminate\15<leader>dt\rcontinue\15<leader>dc\22toggle_breakpoint\bdap\frequire\15<leader>db\6n\bset\vkeymap\1\0\4\vtexthl\vString\vlinehl\fCocBold\nnumhl\5\ttext\b\15DapStopped\1\0\4\vtexthl\rQuestion\vlinehl\5\nnumhl\5\ttext\b\16DapLogPoint\1\0\4\vtexthl\rErrorMsg\vlinehl\5\nnumhl\5\ttext\b\26DapBreakpointRejected\1\0\4\vtexthl\15Identifier\vlinehl\5\nnumhl\nTitle\ttext\b\18DapBreakpoint\16sign_define\afn\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\fdisable\1\6\0\0\6c\bcpp\thelp\bman\acs\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\2\19char_blankline\b┊\25show_current_context\2\nsetup\21indent_blankline\frequire>hi IndentBlankLineContextChar gui=nocombine guifg=#5961697hi IndentBlankLineChar gui=nocombine guifg=#353d45\bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\nD\0\0\4\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0+\2\0\0005\3\3\0B\0\3\1K\0\1\0\1\0\1\nenter\2\teval\ndapui\frequire�\1\1\0\a\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\b\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\t\0'\3\n\0003\4\v\0B\0\4\1K\0\1\0\0\15<leader>dh\1\3\0\0\6n\6v\vtoggle\15<leader>du\6n\bset\vkeymap\bvim\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cs ++once lua require("packer.load")({'omnisharp-vim', 'ale'}, { ft = "cs" }, _G.packer_plugins)]]
vim.cmd [[au FileType csproj ++once lua require("packer.load")({'omnisharp-vim', 'ale'}, { ft = "csproj" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/cake.vim]], true)
vim.cmd [[source /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/cake.vim]]
time([[Sourcing ftdetect script at: /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/cake.vim]], false)
time([[Sourcing ftdetect script at: /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/csx.vim]], true)
vim.cmd [[source /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/csx.vim]]
time([[Sourcing ftdetect script at: /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/csx.vim]], false)
time([[Sourcing ftdetect script at: /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/omnisharplog.vim]], true)
vim.cmd [[source /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/omnisharplog.vim]]
time([[Sourcing ftdetect script at: /home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/omnisharp-vim/ftdetect/omnisharplog.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
