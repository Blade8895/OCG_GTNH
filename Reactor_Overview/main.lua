hud = require("hud")
local term = require("term")
local component = require("component")

header = "Reactor Overview"
version = "BETA"
ID_coolant = "1962c3f5-f40b-4213-8409-82e7121229a1"
ID_water = "e1982c1e-cd6a-43a6-b8cd-ee1e00c62604"

UI_Build()

function tank_calc_coolant()
    component.setPrimary("tank_controller", ID_coolant)
    os.sleep(0.2)
    tank = component.tank_controller
    tInfo = tank.getFluidInTank(4)
    tank_max = tInfo[1].capacity
    tank_actual = tInfo[1].amount
    tank_coolant_percent = tank_actual/tank_max*100
    tank_coolant_bar = tank_actual/tank_max*30
    tank_coolant_print = string.format("%.2f", tank_coolant_percent)
    return tank_coolant_bar, tank_coolant_print
   end

   function tank_calc_water()
    component.setPrimary("tank_controller", ID_water)
    os.sleep(0.2)
    tank = component.tank_controller
    tInfo = tank.getFluidInTank(4)
    tank_max = tInfo[1].capacity
    tank_actual = tInfo[1].amount
    tank_water_percent = tank_actual/tank_max*100
    tank_water_bar = tank_actual/tank_max*30
    tank_water_print = string.format("%.2f", tank_water_percent)
    return tank_water_bar, tank_water_print
   end

   tank_calc_coolant()
   tank_calc_water()
   term.setCursor(10,10)
   print(tank_coolant_print)
   term.setCursor(10,11)
   print(tank_water_print)

   reactor_status(1,1)