local component = require "component"
local term = require "term"
-------------------------------------------------------------------------------
local gpu = component.gpu

local adWrite = {}

function adWrite.write(s)
  local cbg, cfg = gpu.getBackground(), gpu.getForeground()
  local i = 1
  s:gsub('()<color(.-)>(.-)</color>()', function(i1, tag, content, i2)
    local bg, fg
    if not i1 then return end
    term.write(s:sub(i, i1-1))
    tag = tag:gsub('%s', "")  -- remove whites paces
    for colortype, color in tag:gmatch '([bfg][bfg])=(0[xX]%x+)' do
      if colortype == "bg" and color then
        bg = tonumber(color)
      elseif colortype == "fg" and color then
        fg = tonumber(color)
      end
    end
    if bg and bg ~= cbg then
      gpu.setBackground(bg)
    end
    if fg and fg ~= color then
      gpu.setForeground(fg)
    end
    term.write(content)
    gpu.setBackground(cbg)
    gpu.setForeground(cfg)
    i = i2
  end)
  if i <= #s then
    term.write(s:sub(i, #s))
  end
end

-------------------------------------------------------------------------------
return adWrite