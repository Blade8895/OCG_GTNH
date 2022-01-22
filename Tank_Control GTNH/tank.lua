component = require("component")
term = require("term")
sides = require("sides")
event = require("event")
colors = require("colors")

rs = component.redstone

ID1 = "0b8a6b21-896b-4eb9-b2bc-9490d721d092"
ID2 = "20fa06e4-b1fd-40d6-9db8-6f136c02a71c"
ID3 = "229e0c91-b165-4e0b-967e-0186676c6093"
ID4 = "3e3337f8-c228-4780-b75e-7a102a8b7a63"
ID5 = "44c1bb28-013d-45e3-869d-e6738c00e1fb"
ID6 = "da59534c-6504-430c-a978-230cdd5936fe"
ID7 = "8853a69f-dbb2-4957-a8e8-cf376e08e538"

-- initial setup
 term.clear()
 term.setCursor(1,1)
 component.gpu.setResolution(50,18)
-- end

-- Must perfom ID Reading
function tank_calc_cl()
 component.setPrimary("tank_controller", ID1)
 os.sleep(0.2)
 tank = component.tank_controller
 tInfo = tank.getFluidInTank(1)
 tank_max = tInfo[1].capacity
 tank_actual = tInfo[1].amount
 tank1_percent = tank_actual/tank_max*100
 tank1_print = string.format("%.2f", tank1_percent)
end

function tank_calc_hcl()
 component.setPrimary("tank_controller", ID2)
 os.sleep(0.2)
 tank = component.tank_controller
 tInfo = tank.getFluidInTank(1)
 tank_max = tInfo[1].capacity
 tank_actual = tInfo[1].amount
 tank2_percent = tank_actual/tank_max*100
 tank2_print = string.format("%.2f", tank2_percent)
end

function tank_calc_ammonia()
 component.setPrimary("tank_controller", ID3)
 os.sleep(0.2)
 tank = component.tank_controller
 tInfo = tank.getFluidInTank(1)
 tank_max = tInfo[1].capacity
 tank_actual = tInfo[1].amount
 tank3_percent = tank_actual/tank_max*100
 tank3_print = string.format("%.2f", tank3_percent)
end

function tank_calc_hydrogen()
 component.setPrimary("tank_controller", ID4)
 os.sleep(0.2)
 tank = component.tank_controller
 tInfo = tank.getFluidInTank(1)
 tank_max = tInfo[1].capacity
 tank_actual = tInfo[1].amount
 tank4_percent = tank_actual/tank_max*100
 tank4_print = string.format("%.2f", tank4_percent)
end

function tank_calc_o2()
 component.setPrimary("tank_controller", ID5)
 os.sleep(0.2)
 tank = component.tank_controller
 tInfo = tank.getFluidInTank(1)
 tank_max = tInfo[1].capacity
 tank_actual = tInfo[1].amount
 tank5_percent = tank_actual/tank_max*100
 tank5_print = string.format("%.2f", tank5_percent)
end

function tank_calc_f()
 component.setPrimary("tank_controller", ID6)
 os.sleep(0.2)
 tank = component.tank_controller
 tInfo = tank.getFluidInTank(1)
 tank_max = tInfo[1].capacity
 tank_actual = tInfo[1].amount
 tank6_percent = tank_actual/tank_max*100
 tank6_print = string.format("%.2f", tank6_percent)
end

function tank_calc_h2so4()
 component.setPrimary("tank_controller", ID7)
 os.sleep(0.2)
 tank = component.tank_controller
 tInfo = tank.getFluidInTank(1)
 tank_max = tInfo[1].capacity
 tank_actual = tInfo[1].amount
 tank7_percent = tank_actual/tank_max*100
 tank7_print = string.format("%.2f", tank7_percent)
end
-- end  
 
-- UI Core
function UI_Build()
 print("|================================================|")
 print("| Tank Vent Script 1.1 | made by Blade8895       |")
 print("|================================================|")
 print("| Chlorine :                                     |")
 print("|------------------------------------------------|")
 print("| HCl      :                                     |")
 print("|------------------------------------------------|")
 print("| Ammonia  :                                     |")
 print("|------------------------------------------------|")
 print("| Hydrogen :                                     |")
 print("|------------------------------------------------|")
 print("| Oxygen   :                                     |")
 print("|------------------------------------------------|")
 print("| Flourine :                                     |")
 print("|------------------------------------------------|")
 print("| H2SO4    :                                     |")
 print("|================================================|")
end
-- UI Core end

-- Beschriftung
UI_Build()

function refresh_cl()
 tank_calc_cl()
 term.setCursor(14,4)
 print(tank1_print)
 if tank1_percent >= 95 then
 rs.setBundledOutput(sides.back, colors.cyan, 100)
 vent_cl = 1
 end
 if tank1_percent <= 85 then
 rs.setBundledOutput(sides.back, colors.cyan, 0)
 vent_cl = 0
 end
end

function refresh_hcl()
 tank_calc_hcl()
 term.setCursor(14,6)
 print(tank2_print)
 if tank2_percent >= 90 then
 rs.setBundledOutput(sides.back, colors.green, 1000)
 vent_hcl = 1
 end
 if tank2_percent <= 70 then
 rs.setBundledOutput(sides.back, colors.green, 0)
 vent_hcl = 0
 end
end

function refresh_ammonia()
 tank_calc_ammonia()
 term.setCursor(14,8)
 print(tank3_print)
 if tank3_percent >= 90 then
 rs.setBundledOutput(sides.back, colors.silver, 100)
 vent_ammonia = 1
 end
 if tank3_percent <= 70 then
 rs.setBundledOutput(sides.back, colors.silver, 0)
  vent_ammonia = 0
 end
end

function refresh_hydrogen()
 tank_calc_hydrogen()
 term.setCursor(14,10)
 print(tank4_print)
 if tank4_percent >= 95 then
 rs.setBundledOutput(sides.back, colors.magenta, 100)
  vent_hydrogen = 1
 end
 if tank4_percent <= 85 then
 rs.setBundledOutput(sides.back, colors.magenta, 0)
 vent_hydrogen = 0
 end
end

function refresh_o2()
 tank_calc_o2()
 term.setCursor(14,12)
 print(tank5_print)
 if tank5_percent >= 95 then
 rs.setBundledOutput(sides.back, colors.lightblue, 100)
 vent_o2 = 1
 end
 if tank5_percent <= 85 then
 rs.setBundledOutput(sides.back, colors.lightblue, 0)
 vent_o2 = 0
 end
end

function refresh_f()
 tank_calc_f()
 term.setCursor(14,14)
 print(tank5_print)
 if tank5_percent >= 95 then
 rs.setBundledOutput(sides.back, colors.blue, 100)
 vent_f = 1
 end
 if tank5_percent <= 85 then
 rs.setBundledOutput(sides.back, colors.blue, 0)
 vent_f = 0
 end
end

function refresh_h2so4()
 tank_calc_h2so4()
 term.setCursor(14,16)
 print(tank5_print)
 if tank5_percent >= 90 then
 rs.setBundledOutput(sides.back, colors.orange, 100)
 vent_h2so4 = 1
 end
 if tank5_percent <= 70 then
 rs.setBundledOutput(sides.back, colors.orange, 0)
 vent_h2so4 = 0
 end
end

-- Refresh Vent display
function refresh_vent()
 if vent_cl == 1 then
  term.setCursor(36,4)
  print("X")
 else
  term.setCursor(36,4)
  print("  ")
 end
 if vent_hcl == 1 then
  term.setCursor(36,6)
  print("  ")
 else
  term.setCursor(36,6)
  print("R")
 end
 if vent_ammonia == 1 then
  term.setCursor(36,8)
  print("  ")
 else
  term.setCursor(36,8)
  print("R")
 end
 if vent_hydrogen == 1 then
  term.setCursor(36,10)
  print("X")
 else
  term.setCursor(36,10)
  print("  ")
 end
 if vent_o2 == 1 then
  term.setCursor(36,12)
  print("X")
 else
  term.setCursor(36,12)
  print("  ")
 end
 if vent_f == 1 then
  term.setCursor(36,14)
  print("X")
 else
  term.setCursor(36,14)
  print("  ")
 end
 if vent_h2so4 == 1 then
  term.setCursor(36,16)
  print("  ")
 else
  term.setCursor(36,16)
  print("R")
 end
end

while true do -- with Error state's
term.setCursor(1,1)
if pcall(refresh_cl) then
 err = 0
 else
 term.setCursor(14,4)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("Ooo")
 os.sleep(0.2)
if pcall(refresh_hcl) then
 err = 0
 else
  term.setCursor(14,6)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("oOo")
 os.sleep(0.2)
if pcall(refresh_ammonia) then
 err = 0
 else
 term.setCursor(14,8)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("ooO")
 os.sleep(0.2)
if pcall(refresh_hydrogen) then
 err = 0
 else
 term.setCursor(14,10)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("oOo")
 os.sleep(0.2)
if pcall(refresh_o2) then
 err = 0
 else
 term.setCursor(14,12)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("Ooo")
os.sleep(0.2)
if pcall(refresh_f) then
 err = 0
 else
  term.setCursor(14,14)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("oOo")
os.sleep(0.2)
if pcall(refresh_h2so4) then
 err = 0
 else
  term.setCursor(14,16)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("ooO")
os.sleep(0.2)
if pcall(refresh_vent) then
 err = 0
 else
 term.setCursor(14,18)
 print("error - Not Found")
 end
 term.setCursor(45,2)
 print("oOo")
os.sleep(0.2)
end