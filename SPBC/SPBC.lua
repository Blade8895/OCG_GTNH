component = require("component)
sides = require("sides")

-- sides Redstone
 rso = component.redstone.setOutput

rs_tank_fuel = nil
rs_tank_fluid = nil
--adding lamp

local fluid_boiler = 0
local coal_boiler = 0
local run_fluid_boiler = nil
local run_coal_boiler = nil

local runtime = 7200

local tank_steam = nil
local tank_water = nil
local tank_fuel = nil

function timer_update()
 time = time + 1
end

function boiler_update_on()
 if tank_steam < 25 then
  if rs_tank_fuel = 1 then
   rso(sides.rs_tank_fuel, 100)
   run_coal_boiler = "Running"
  else
   run_coal_boiler = "N/A"
  end
  if rs_tank_fluid = 1 then
   rso(sides.rs_tank_fluid, 100)
   run_fluid_boiler = "Running"
  else
   run_fluid_boiler = "N/A"
  end
end

function boiler_update_off()
 if time > runtime then 
  rso(sides.rs_tank_fluid, 0)
  rso(sides.rs_tank_fuel, 0 )
  run_fluid_boiler = "Offline"
  run_coal_boiler = "Offline"
 end
end

-- timer reset after 2hours!!!
   
   
-- main loop 1 Second
-- on / off Lever or Touch command???

 UI_Build() -- external file
while true do
 boiler_update_on()
 os.sleep(1)
 timer_update()
 boiler_update_off()
 UI_Update()
end