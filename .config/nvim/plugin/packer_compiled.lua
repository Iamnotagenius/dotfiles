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
  ["coc.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0)\1\1\0=\1\4\0K\0\1\0*coc_default_semantic_highlight_groups\6g\bvim\fcockeys\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\6\0\0146\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\2\a\0\4\0X\1\2Ä'\1\4\0L\1\2\0'\1\5\0\18\2\0\0&\1\2\1L\1\2\0\tÔÑú \5\bget\vkeymap\bopt\bvimæ\3\1\0\a\0\22\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0005\6\n\0=\6\v\5>\5\1\4=\4\f\3=\3\r\0025\3\16\0004\4\3\0005\5\14\0005\6\15\0=\6\v\5>\5\1\4=\4\17\0035\4\19\0003\5\18\0>\5\1\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\rsections\14lualine_x\1\3\0\0\0\rfiletype\0\14lualine_c\1\0\0\1\0\4\rmodified\t ÔÄÖ\funnamed\bÔäõ\fnewfile\t Ô±ê\rreadonly\t Ô†Ω\1\2\2\0\rfilename\tpath\3\3\19newfile_status\2\ftabline\14lualine_z\fsymbols\1\0\3\rmodified\t ÔÄÖ\19alternate_file\tÔú° \14directory\bÓóæ\1\2\0\0\fbuffers\14lualine_a\1\0\0\1\2\1\0\ttabs\tmode\3\1\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\23TSEnable highlight\17nvim_command\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
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
    config = { "\27LJ\2\nL\0\1\a\0\5\0\v6\1\0\0009\1\1\0019\1\2\0014\3\3\0009\4\3\0>\4\1\3'\4\4\0+\5\1\0+\6\2\0B\1\5\1K\0\1\0\6c\nvalue\rnvim_put\bapi\bvimã\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\1\5\0\0\14~/scripts\14~/.config\14~/Sources\14~/Writing\15find_files\22telescope.builtin\frequirem\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16search_dirs\1\0\1\vhidden\2\1\2\0\0\6~\15find_files\22telescope.builtin\frequire[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20grep_open_files\2\14live_grep\22telescope.builtin\frequireù\1\0\0\a\0\b\1\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4B\4\1\0?\4\0\0=\3\a\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\15buffer_dir\20telescope.utils\1\2\0\0\6.\14live_grep\22telescope.builtin\frequire\5ÄÄ¿ô\4é\6\1\0\t\0'\0q6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\2\0'\3\4\0B\1\2\0019\1\5\0005\3\n\0005\4\t\0005\5\a\0003\6\6\0=\6\b\5=\5\4\4=\4\v\3B\1\2\0015\1\f\0006\2\0\0'\4\r\0B\2\2\0026\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\18\0009\a\19\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\20\0003\a\21\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\22\0003\a\23\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\24\0003\a\25\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\26\0003\a\27\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\28\0009\a\29\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\30\0009\a\31\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6 \0009\a!\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\"\0009\a#\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6$\0009\a\v\0009\a\4\a9\a\4\a\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6%\0009\a&\2\18\b\1\0B\3\5\1K\0\1\0\15treesitter\15<leader>ft\15<leader>fe\14man_pages\15<leader>fm\30current_buffer_fuzzy_find\15<leader>fs\14help_tags\15<leader>fh\fbuffers\15<leader>fb\0\15<leader>fG\0\15<leader>fg\0\15<leader>FF\0\15<leader>fF\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\1\0\1\nremap\1\15extensions\1\0\0\1\0\0\vaction\1\0\0\0\nsetup\nglyph\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-cpp-enhanced-highlight"] = {
    loaded = true,
    path = "/home/iamnotagenius/.local/share/nvim/site/pack/packer/start/vim-cpp-enhanced-highlight",
    url = "https://github.com/octol/vim-cpp-enhanced-highlight"
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
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nL\0\1\a\0\5\0\v6\1\0\0009\1\1\0019\1\2\0014\3\3\0009\4\3\0>\4\1\3'\4\4\0+\5\1\0+\6\2\0B\1\5\1K\0\1\0\6c\nvalue\rnvim_put\bapi\bvimã\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\1\5\0\0\14~/scripts\14~/.config\14~/Sources\14~/Writing\15find_files\22telescope.builtin\frequirem\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16search_dirs\1\0\1\vhidden\2\1\2\0\0\6~\15find_files\22telescope.builtin\frequire[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20grep_open_files\2\14live_grep\22telescope.builtin\frequireù\1\0\0\a\0\b\1\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4B\4\1\0?\4\0\0=\3\a\2B\0\2\1K\0\1\0\16search_dirs\1\0\0\15buffer_dir\20telescope.utils\1\2\0\0\6.\14live_grep\22telescope.builtin\frequire\5ÄÄ¿ô\4é\6\1\0\t\0'\0q6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\2\0'\3\4\0B\1\2\0019\1\5\0005\3\n\0005\4\t\0005\5\a\0003\6\6\0=\6\b\5=\5\4\4=\4\v\3B\1\2\0015\1\f\0006\2\0\0'\4\r\0B\2\2\0026\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\18\0009\a\19\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\20\0003\a\21\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\22\0003\a\23\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\24\0003\a\25\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\26\0003\a\27\0\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\28\0009\a\29\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\30\0009\a\31\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6 \0009\a!\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6\"\0009\a#\2\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6$\0009\a\v\0009\a\4\a9\a\4\a\18\b\1\0B\3\5\0016\3\14\0009\3\15\0039\3\16\3'\5\17\0'\6%\0009\a&\2\18\b\1\0B\3\5\1K\0\1\0\15treesitter\15<leader>ft\15<leader>fe\14man_pages\15<leader>fm\30current_buffer_fuzzy_find\15<leader>fs\14help_tags\15<leader>fh\fbuffers\15<leader>fb\0\15<leader>fG\0\15<leader>fg\0\15<leader>FF\0\15<leader>fF\15find_files\15<leader>ff\6n\bset\vkeymap\bvim\22telescope.builtin\1\0\1\nremap\1\15extensions\1\0\0\1\0\0\vaction\1\0\0\0\nsetup\nglyph\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\6\0\0146\0\0\0009\0\1\0009\0\2\0\18\2\0\0009\0\3\0B\0\2\2\a\0\4\0X\1\2Ä'\1\4\0L\1\2\0'\1\5\0\18\2\0\0&\1\2\1L\1\2\0\tÔÑú \5\bget\vkeymap\bopt\bvimæ\3\1\0\a\0\22\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0034\4\3\0005\5\t\0005\6\n\0=\6\v\5>\5\1\4=\4\f\3=\3\r\0025\3\16\0004\4\3\0005\5\14\0005\6\15\0=\6\v\5>\5\1\4=\4\17\0035\4\19\0003\5\18\0>\5\1\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\rsections\14lualine_x\1\3\0\0\0\rfiletype\0\14lualine_c\1\0\0\1\0\4\rmodified\t ÔÄÖ\funnamed\bÔäõ\fnewfile\t Ô±ê\rreadonly\t Ô†Ω\1\2\2\0\rfilename\tpath\3\3\19newfile_status\2\ftabline\14lualine_z\fsymbols\1\0\3\rmodified\t ÔÄÖ\19alternate_file\tÔú° \14directory\bÓóæ\1\2\0\0\fbuffers\14lualine_a\1\0\0\1\2\1\0\ttabs\tmode\3\1\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vvimtex\frequire\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0)\1\1\0=\1\4\0K\0\1\0*coc_default_semantic_highlight_groups\6g\bvim\fcockeys\frequire\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cs ++once lua require("packer.load")({'nvim-treesitter'}, { ft = "cs" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
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
