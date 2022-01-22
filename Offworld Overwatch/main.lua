-- Requirements
local component = require("component")
local term = require("term")
rs = component.redstone

-- Configs
-- Color syntax: aw.write("<color bg=0xff00ff> TEXT </color>")

fg_standart = component.gpu.getForeground()
bg_standart = component.gpu.getBackground()

align_pump = 26
align_miner = 67

color__bg_off = 0xff0000

color_bg_on = 0x00ff00

Version = "1.1"
Header = "Offworld Overwatch "..Version.." "

SignalCount = 8

Signal1_Name = "Moon, Helium-3:"
Signal1_Maintenance = 1869

Signal2_Name = "Ross ba, SaltWater:"
Signal2_Maintenance = 2013

Signal3_Name = "Mars, Chlorobenzene:"
Signal3_Maintenance = 2012

Signal4_Name = "Pluto, Fluorine:"
Signal4_Maintenance = 2025

Signal5_Name = "BarnadaF:"
Signal5_Maintenance = 2014

Signal6_Name = "VegaB-1:"
Signal6_Maintenance = 2588

Signal7_Name = "VegaB-2:"
Signal7_Maintenance = 2589

Signal8_Name = "Radon, Production:"
Signal8_Maintenance = 2887
good8 = "  High "
bad8 = "     Low    "
-- Configs Ende

-- UI Build
function UI_Build1()
term.clear()
component.gpu.setResolution(80,20)
component.gpu.setForeground(0x00FFFF)
term.setCursor(1,1)
print("╭───────────────────────┬────────────────┬─────────────────────────────────┬───╮")
print("│                       │                │                                 │   │")
print("├───────────────────────╯                │                                 ╰───┤")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("├────────────────────────────────────────┼─────────────────────────────────────┤")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("│                                        │                                     │")
print("╰────────────────────────────────────────┴─────────────────────────────────────╯")
term.setCursor(2,2)
component.gpu.setForeground(fg_standart)
print(Header)
end

UI_Build1()

function sleep_timer()
 term.setCursor(78,2)
 print("┼")
 os.sleep(0.5)
 term.setCursor(78,2)
 print("╳")
 os.sleep(0.5)
end
-- UI Stuff ende

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
 refresh_wireless_state(Signal1_Maintenance, Signal1_Name, nil, nil, align_pump, 7)
 refresh_wireless_state(Signal2_Maintenance, Signal2_Name, nil, nil, align_pump, 9)
 refresh_wireless_state(Signal3_Maintenance, Signal3_Name, nil, nil, align_pump, 11)
 refresh_wireless_state(Signal4_Maintenance, Signal4_Name, nil, nil, align_pump, 13)
 refresh_wireless_state(Signal8_Maintenance, Signal8_Name, good8, bad8, align_pump, 15)
 
 refresh_wireless_state(Signal5_Maintenance, Signal5_Name, nil, nil, align_miner, 7)
 refresh_wireless_state(Signal6_Maintenance, Signal6_Name, nil, nil, align_miner, 9)
 refresh_wireless_state(Signal7_Maintenance, Signal7_Name, nil, nil, align_miner, 11)
 
 -- Next Step: Refresh UI mit Array lösen? (z.B. Signal.1.Name / Signal.1.Freq (Maintenance)) um es dann mit Signal.X.Name mit X+1 zu rechnen probaly???)
 
end

-- Running Loop
while true do
 sleep_timer()
 refresh_ui()
end