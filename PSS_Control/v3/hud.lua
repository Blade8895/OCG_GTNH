local term = require("term")
local component = require("component")
local colors = require "colors"
local time = require ("time")
gpu = component.gpu
EUflow = 0

fg_standart = component.gpu.getForeground()
bg_standart = component.gpu.getBackground()

function UI_Build()
term.clear()
component.gpu.setResolution(80,20)
component.gpu.setForeground(0x00FFFF)
term.setCursor(1,1)
print("╭───────────────────────┬──────────────────────────────────────────────────────╮")
print("│                       │                                                      │")
print("├───────────────────────╯                                                      │")
print("│   Max EU      :                                                              │")
print("│   Actual EU   :                                                              │")
print("│                                                                              │")
print("│   Average Out :                                                              │")
print("│   Average IN  :                                                              │")
print("│                                                                              │")
print("│                                                                              │")
print("│                                                                              │")
print("│                                                                              │")
print("│                                                                              │")
print("│                                                                              │")
print("│    ╭────────────────────────────────────────────────────────────────────╮    │")
print("│    │                                                                    │    │")
print("│    │                                                                    │    │")
print("│    ╰────────────────────────────────────────────────────────────────────╯    │")
print("╰──────────────────────────────────────────────────────────────────────────────╯")
term.setCursor(2,2)
component.gpu.setForeground(fg_standart)
print(header.." v"..version)
end

-- Format the Thousands
function format_number(number)
   number = tostring(number)
   local formatted = number
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
    if (k==0) then
      break
    end
  end
  return formatted
end
-- end

function UI_Values()
 term.setCursor(19,4)
 term.write(format_number(storage_max).." EU         ")
 term.setCursor(19,5)
 term.write(format_number(storage_actual).." EU      ")
 term.setCursor(19,7)
 term.write(format_number(component.gt_machine.getEUOutputAverage()).." EU/t          ")
 term.setCursor(19,8)
 term.write(format_number(component.gt_machine.getEUInputAverage()).." EU/t          ")

 -- Update Estimation
 EUflow = component.gt_machine.getEUInputAverage() - component.gt_machine.getEUOutputAverage()
 if avg > 0 then
  fillTime = math.floor((storage_max-storage_actual)/(avg*20))
  term.setCursor(5,10)
  term.write("Full        : "..time.format(math.abs(fillTime)).."            ")
 elseif avg <= 0 then
  fillTime = math.floor(storage_actual/(avg*20))
  term.setCursor(5,10)
  term.write("Empty       : "..time.format(math.abs(fillTime)).."            ")
 end
end
 -- End

function bar(storage_percent_bar) --????????????????
 --gpu.fill(Spalte, Zeile, Dicke nach rechts, Höhe, "█")
 component.gpu.setForeground(0x00CD00)
 gpu.fill(7, 16, storage_percent_bar, 2, "█")
 component.gpu.setForeground(0xCD0000)
 gpu.fill(storage_percent_bar+7, 16, 69-storage_percent_bar, 2, "█")
 component.gpu.setForeground(fg_standart)
end

-- █
return hud