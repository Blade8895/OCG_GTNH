local component = require("component")
local term = require("term")
gpu = component.gpu

fg_standart = component.gpu.getForeground()
bg_standart = component.gpu.getBackground()

function UI_Build()
    term.clear()
    gpu.setResolution(160,40)
    gpu.setForeground(0x00FFFF)
    term.setCursor(1,1)
    print("╭───────────────────────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮")
    print("│                       │                                                                                                                                      │")
    print("├───────────────────────╯                                                                                                                                      │")
    print("│                                                                                                                                                              │")
    print("│                                                                                                                                                              │")
    print("│      ╭────────────╮      ╭────────────╮                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      │            │      │            │                                                                                                                      │")
    print("│      ╰────────────╯      ╰────────────╯                                                                                                                      │")
    print("│                                                                                                                                                              │")
    print("│                                                                                                                                                              │")
    print("╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯")
    term.setCursor(2,2)
    gpu.setForeground(fg_standart)
    print(header.." v"..version)
    end

function radiation_logo(x, y)
    local pattern = [[
       █████                █████
     ████████              ████████
    ███████████          ███████████
   █████████████        █████████████
  ███████████████      ███████████████
  ████████████████    ████████████████
 █████████████████    █████████████████
 ████████████████      ████████████████
████████████████   ██   ████████████████
                  ████
                   ██

                  ████
                 ██████
                ████████
               ██████████
              ████████████
             ██████████████
            ████████████████
              ████████████
]]
gpu.set(x, y, pattern)
gpu.flush()
end

function reactor_status(status_1, status_2)
 --gpu.fill(Spalte, Zeile, Dicke nach rechts, tiefe, "█")
    --reactor 1
    gpu.fill(115, 3, 12, 6, "█")
    term.setCursor(116,4)
    print("Reactor  1")
    --reactor 2
    gpu.fill(130, 3, 12, 6, "█")
    term.setCursor(131,4)
    print("Reactor  2")
end

function bar_water(tank_water_bar)
    --gpu.fill(Spalte, Zeile, Dicke nach rechts, tiefe, "█")
    component.gpu.setForeground(0xCD0000) -- redbar
    gpu.fill(9, 7, 12, 30-tank_water_bar, "█")
    component.gpu.setForeground(0x00CD00) -- bluebar
    gpu.fill(22, 30-tank_water_bar+7, 12, tank_water_bar, "█")
    component.gpu.setForeground(fg_standart)
   end

   function bar_coolant(tank_coolant_bar)
    --gpu.fill(Spalte, Zeile, Dicke nach rechts, tiefe, "█")
    component.gpu.setForeground(0xCD0000) -- redbar
    gpu.fill(9, 7, 12, 30-tank_coolant_bar, "█")
    component.gpu.setForeground(0x008888) -- cyanbar
    gpu.fill(22, 31-tank_coolant_bar+7, 12, tank_coolant_bar, "█")
    component.gpu.setForeground(fg_standart)
   end