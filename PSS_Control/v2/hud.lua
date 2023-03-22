local term = require("term")
local component = require("component")
local colors = require "colors"
gpu = component.gpu

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
print("│4                                                                             │")
print("│5                                                                             │")
print("│6                                                                             │")
print("│7                                                                             │")
print("│8                                                                             │")
print("│9                                                                             │")
print("│10                                                                            │")
print("│11                                                                            │")
print("│12                                                                            │")
print("│13                                                                            │")
print("│14                                                                            │")
print("│15  ╭────────────────────────────────────────────────────────────────────╮    │")
print("│16  │                                                                    │    │")
print("│17  │                                                                    │    │")
print("│18  ╰────────────────────────────────────────────────────────────────────╯    │")
print("╰──────────────────────────────────────────────────────────────────────────────╯")
term.setCursor(2,2)
component.gpu.setForeground(fg_standart)
print(header.." v"..version)
end

function bar(storage_percent_bar) --????????????????
 --gpu.fill(Spalte, Zeile, Dicke nach rechts, Höhe, "█")
 gpu.fill(7, 16, storage_percent_bar, 2, "█")
end

-- █
return hud