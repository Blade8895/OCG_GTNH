-- Requirements
local component = require("component")
local term = require("term")
hud = require("hud")
rs = component.redstone

-- Configs
-- Color syntax: aw.write("<color bg=0xff00ff> TEXT </color>")

fg_standart = component.gpu.getForeground()
bg_standart = component.gpu.getBackground()

align_pump = 26
align_miner = 67

color__bg_off = 0xff0000

color_bg_on = 0x00ff00

Version = "2.0"
Header = "Offworld Overwatch "..Version.." "

signals = {}
	signals[1] = { Signal_Maintenance = 1869, Signal_Name = "Moon, Helium-3:", good = nil, bad = nil, align = align_pump, row = 7 }
	signals[2] = { Signal_Maintenance = 2013, Signal_Name = "Ross ba, SaltWater:", good = nil, bad = nil, align= align_pump, row = 9 }
	signals[3] = { Signal_Maintenance = 2012, Signal_Name = "Mars, Chlorobenzene:", good = nil, bad = nil, align= align_pump, row = 11 }
	signals[4] = { Signal_Maintenance = 2025, Signal_Name = "Pluto, Fluorine:", good = nil, bad = nil, align= align_pump, row = 13 }
	signals[5] = { Signal_Maintenance = 2014, Signal_Name = "BarnadaF:", good = nil, bad = nil, align= align_miner, row = 7 }
	signals[6] = { Signal_Maintenance = 2588, Signal_Name = "VegaB-1", good = nil, bad = nil, align= align_miner, row = 9 }
	signals[7] = { Signal_Maintenance = 2588, Signal_Name = "VegaB-2", good = nil, bad = nil, align= align_miner, row = 11 }
	signals[8] = { Signal_Maintenance = 2887, Signal_Name = "Radon, Production:", good = "  High ", bad = "     Low    ", align= align_pump, row = 15 }

-- Configs Ende

function refresh_wireless_state(frequency, Name, good, bad, xcord, ycord)
 good = good or "  Fine "
 bad = bad or "    Error   "
 term.setCursor(xcord-22, ycord)
 print(Name)
rs.setWirelessFrequency(frequency)
if tostring(rs.getWirelessInput()) == "false" then
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