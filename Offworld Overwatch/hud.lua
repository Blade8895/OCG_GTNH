local term = require("term")
local component = require("component")

fg_standart = component.gpu.getForeground()
bg_standart = component.gpu.getBackground()

function UI_Build()
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

function sleep_timer()
 term.setCursor(78,2)
 print("┼")
 os.sleep(0.5)
 term.setCursor(78,2)
 print("╳")
 os.sleep(0.5)
end

return hud