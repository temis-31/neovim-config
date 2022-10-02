require('base')
require('highlights')
require('maps')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_ubu = has "unix"

if is_mac then
  require('macos')
end
if is_ubu then
  require('ubuntu')
end

