component = require("component")
term = require("term")
aw = require("adWrite")
sides = require("sides")
event = require("event")
hud = require("hud")

-- Configs
version = "2.1"
header = "Energy Display"
local auto = 1
local rs_output = sides.top
local on = 30
local off = 90
local rs_wireless = true
rs_wireless_freq = 1145
debugUI = false

-- initial setup
 term.clear()
 term.setCursor(1,1)
 component.redstone.setWirelessFrequency(rs_wireless_freq)
 UI_Build()
 term.setCursor(30,2)
 aw.write("<color fg=0xff0000>BOOTING...</color>")
 os.sleep(1)
-- end

-- Power Unit calc & percent converter
function storage_calc()
 storage_max = component.gt_machine.getEUCapacity()
 storage_actual = component.gt_machine.getStoredEU()
 storage_percent = storage_actual/storage_max*100
 storage_percent_bar = storage_actual/storage_max*68
 storage_print = string.format("%.2f", storage_percent)
 return storage_percent_bar, storage_percent, storage_max, storage_actual
end
-- end 


-- Automatik Turn on / off Function
function auto_rs()
 if rs_wireless == false then
  if storage_percent >= off then
   component.redstone.setOutput(rs_output, 0)
	 if debugUI == true then
	    term.setCursor(50,13)
        term.write("Physical Logic: false")
	 end
  end
  if storage_percent <= on then
   component.redstone.setOutput(rs_output, 15)
	 if debugUI == true then
	    term.setCursor(50,13)
        term.write("Physical Logic: True")
	 end
  end
 end
 if rs_wireless == true then
  if storage_percent >= off then
    component.redstone.setWirelessOutput(false)
	 if debugUI == true then
	    term.setCursor(50,13)
        term.write("Wireless Logic: false ")
	 end
  end
  if storage_percent <= on then
     component.redstone.setWirelessOutput(true)
	 if debugUI == true then
	    term.setCursor(50,13)
        term.write("Wireless Logic: True  ")
	 end
  end
 end
end

-- Beschriftung
function refresh()
 storage_calc()
 if auto == 1 then 
  auto_rs()
 end
 bar(storage_percent_bar)

 term.setCursor(36,14)
 aw.write("<color fg=0x00ff00> "..storage_print.."% </color>")

 
 os.sleep(0.1)
 UI_Values()
 
 -- here more refresh code
 
 
 
 -- DEBUG HERE
 if debugUI == true then
  rs_wireless_state = component.redstone.getWirelessOutput()
  term.setCursor(8,14)
  term.write("Wireless? "..tostring(rs_wireless))
  term.setCursor(50,14)
  term.write("Wireless Active? "..tostring(rs_wireless_state))
 end
 
 
end
-- Old Charge / Discharge Visual
 -- if component.redstone.getOutput(rs_output) == 15 then
  -- term.setCursor(16,10)
  -- aw.write("<color bg=0x00ff00>Charging</color>   ")
 -- else
  -- term.setCursor(16,10)
  -- aw.write("<color bg=0xff0000>Discharging</color>   ")
 -- end
-- end

term.setCursor(30,2)
term.write("                      ")

-- while true do
   -- _, _, key, _ = event.pull("key_down")
 -- if key == 8 then
	-- component.redstone.setWirelessOutput(false)
	-- refresh()
 -- else
  -- if key == 9 then
	-- component.redstone.setWirelessOutput(true)
	-- refresh()
 -- else
  -- if key == nil then
  -- refresh()
-- end
-- end
-- end
-- os.sleep(0.1)
-- end

while true do
 refresh()
 os.sleep(1)
end