component = require("component")
term = require("term")
aw = require("adWrite")
sides = require("sides")
event = require("event")

-- initial setup
 component.gpu.setResolution(43,12)
 term.clear()
 term.setCursor(1,1)
-- end

-- Power-Sub Station Prozentrechner
function pss_calc()
 pss_max = component.gt_machine.getEUCapacity()
 pss_actual = component.gt_machine.getStoredEU()
 pss_percent = pss_actual/pss_max*100
 pss_print = string.format("%.2f", pss_percent)
end
-- end  
 
-- UI Core
function UI_Build()
 print("|=========================================|")
 print("| PSS Control     1.0 | made by Blade8895 |")      
 print("|=========================================|")
 print("|  PSS % =                                |")
 print("|  EU/t IN  =                             |")
 print("|  EU/t Out =                             |")
 print("|                                         |")
 print("|                                         |")
 print("|=========================================|")
 print("| Charge State:          Voltage=         |")
 print("|=========================================|")
end
-- UI Core end

-- Beschriftung
function refresh()
 pss_calc()
 os.sleep(0.5)  

 term.setCursor(12,4)
 aw.write("<color fg=0xffff00>"..pss_print.."% </color>")

 --if component.redstone.getOutput(sides.east) == 15 then
  --term.setCursor(16,5)
  --aw.write("<color bg=0x00ff00>ON</color>/OFF")
  --term.setCursor(16,6)
  --aw.write("<color bg=0x00ff00>ON</color>/OFF")
 --else
  --term.setCursor(16,5)
  --aw.write("ON/<color bg=0xff0000>OFF</color>")
  --term.setCursor(16,6)
  --aw.write("ON/<color bg=0xff0000>OFF</color>")
 --end
end

UI_Build()

while true do
 refresh()
 os.sleep(0.5)
end