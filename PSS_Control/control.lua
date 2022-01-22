component = require("component")
term = require("term")
aw = require("adWrite")
sides = require("sides")
event = require("event")

-- Configs
local version = "1.5"
local auto = 1
local rs_output = sides.top
local Voltage = "ZPM "
local on = 45
local off = 95

-- initial setup
 component.gpu.setResolution(43,12)
 term.clear()
 term.setCursor(1,1)
-- end

-- Power-Sub Station calc & percent converter
function pss_calc()
 pss_max = component.gt_machine.getEUCapacity()
 pss_actual = component.gt_machine.getStoredEU()
 pss_percent = pss_actual/pss_max*100
 pss_print = string.format("%.2f", pss_percent)
end
-- end 

-- Automatik Turn on / off Function
function auto_rs()
 if pss_percent >= off then
  component.redstone.setOutput(rs_output, 0)
 end
 if pss_percent <= on then
  component.redstone.setOutput(rs_output, 15)
 end
end
 
-- UI Core
function UI_Build()
 print("|=========================================|")
 print("| PSS Control     "..version.." | made by Blade8895 |")      
 print("|=========================================|")
 print("|                                         |")
 print("|                                         |")
 print("| PSS % =                                 |")
 print("|                                         |")
 print("|                                         |")
 print("|=========================================|")
 print("| Charge State:              Voltage= "..Voltage.."|")
 print("|=========================================|")
end
-- UI Core end

-- Beschriftung
function refresh()
 pss_calc()
 if auto == 1 then 
  auto_rs()
 end
 os.sleep(0.1)

 term.setCursor(12,6)
  if pss_percent <= 0.8 then
 aw.write("<color fg=0x00ff00>"..pss_print.."% </color>")
 else if pss_percent <= 0.5 then
 aw.write("<color fg=0xffff00>"..pss_print.."% </color>")
 else if pss_percent <= 0.2 then
 aw.write("<color fg=0xff8000>"..pss_print.."% </color>")
 else if pss_percent > 0.2 then
 aw.write("<color fg=0xff0000>"..pss_print.."% </color>")
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