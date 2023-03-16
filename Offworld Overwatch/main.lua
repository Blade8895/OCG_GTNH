-- Requirements
local component = require("component")
local term = require("term")
hud = require("hud")
rs = component.redstone

-- Configs
-- Color syntax: aw.write("<color bg=0xff00ff> TEXT </color>")

fg_standart = component.gpu.getForeground()
bg_standart = component.gpu.getBackground()

-- Align Variables. Sets the X Cord on the Screen
align_pump = 26
align_miner = 67

color__bg_off = 0xff0000

color_bg_on = 0x00ff00

Version = "2.0"
Header = "Offworld Overwatch "..Version.." "
-- You can ADD Your machines here
-- this is the clean table:
-- signals[i] = { Signal_Maintenance = Wireless Frequency Number, Signal_Name = Display Name on the Screen as a String, good = Alternate text as a String when there is no Signal. otherwise just use nil, bad = Alternate text as a String when there is a Signal. otherwise just use nil, align = Left or Right (use Variables), row = Wich Row the Line will be in. (7, 9, 11, 13, 15, 17}
signals = {}
	signals[1] = { Signal_Maintenance = nil, Signal_Name = "Good Name", good = nil, bad = nil, align = align_X, row = 7 }

-- Configs Ende

function refresh_wireless_state(frequency, Name, good, bad, xcord, ycord)
 good = good or "  Fine "
 bad = bad or "    Error   "
 term.setCursor(xcord-22, ycord)
 print(Name)
rs.setWirelessFrequency(frequency)
if not rs.getWirelessInput() then
 term.setCursor(xcord, ycord)
 component.gpu.setBackground(color_bg_on)
 component.gpu.setForeground(0xFFFF00)
 print(good..frequency.." ")
 component.gpu.setBackground(bg_standart)
 component.gpu.setForeground(fg_standart)
else
 term.setCursor(xcord, ycord)
 component.gpu.setBackground(color__bg_off)
  component.gpu.setForeground(0x00FFFF)
 print(bad)
 component.gpu.setBackground(bg_standart)
  component.gpu.setForeground(fg_standart)
end
end

function refresh_ui()
for i = 1, #signals, 1 do
 refresh_wireless_state(signals[i].Signal_Maintenance, signals[i].Signal_Name, signals[i].good, signals[i].bad, signals[i].align, signals[i].row)
end
 
end

-- Running Program
UI_Build()
while true do
 sleep_timer()
 refresh_ui()
end