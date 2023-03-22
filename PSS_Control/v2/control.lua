component = require("component")
term = require("term")
aw = require("adWrite")
sides = require("sides")
event = require("event")
hud = require("hud")

-- Configs
version = "2.0"
header = "Energy Display"
local auto = 1
local rs_output = sides.top
local Voltage = "ZPM "
local on = 30
local off = 90

-- initial setup
 term.clear()
 term.setCursor(1,1)
-- end

-- Power-Sub Station calc & percent converter
function storage_calc()
 storage_max = component.gt_machine.getEUCapacity()
 storage_actual = component.gt_machine.getStoredEU()
 storage_percent = storage_actual/storage_max*100
 storage_percent_bar = storage_actual/storage_max*68
 storage_print = string.format("%.2f", storage_percent)
 return storage_percent_bar
end
-- end 


-- Automatik Turn on / off Function
function auto_rs()
 if storage_percent >= off then
  component.redstone.setOutput(rs_output, 0)
 end
 if storage_percent <= on then
  component.redstone.setOutput(rs_output, 15)
 end
end

-- Beschriftung
function refresh()
 storage_calc()
 if auto == 1 then 
  auto_rs()
 end
 bar(storage_percent_bar)
 os.sleep(2)

 term.setCursor(12,6)
  if storage_percent <= 0.8 then
 aw.write("<color fg=0x00ff00>"..storage_print.."% </color>")
 else if storage_percent <= 0.5 then
 aw.write("<color fg=0xffff00>"..storage_print.."% </color>")
 else if storage_percent <= 0.2 then
 aw.write("<color fg=0xff8000>"..storage_print.."% </color>")
 else if storage_percent > 0.2 then
 aw.write("<color fg=0xff0000>"..storage_print.."% </color>")
 end
 end
 end
 end

 if component.redstone.getOutput(rs_output) == 15 then
  term.setCursor(16,10)
  aw.write("<color bg=0x00ff00>Charging</color>   ")
 else
  term.setCursor(16,10)
  aw.write("<color bg=0xff0000>Discharging</color>   ")
 end
end

UI_Build()

while true do
 refresh()
 os.sleep(0.1)
end