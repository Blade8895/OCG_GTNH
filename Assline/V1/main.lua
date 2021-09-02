config = require("config")
term = require("term")

-- When should the Program run again to move items ? (In seconds)

timera = 15

-- Config Provider
t1_pc = 5
t2_pc = 3
t3_pc = 4
t4_pc = 2
t5_pc = 4
t6_pc = 2
PChest_size = 54

-- Transposer 1
z = 1
function itemtransfer1()
PChest = component.transposer.getAllStacks(t1_pc)
while true do
if PChest[z].label == "1" then
 print("true in run "..z)
 component.transposer.transferItem(t1_pc, 3, 64, z)
 break
end
if PChest[z].label == "2" then
 print("true in run "..z)
 component.transposer.transferItem(t1_pc, 4, 64, z)
 break
end
if PChest[z].label == "3" then
 print("true in run "..z)
 component.transposer.transferItem(t1_pc, 2, 64, z)
 break
end
if PChest[z].label == "4" then
 print("true in run "..z)
 component.transposer.transferItem(t1_pc, 1, 64, z)
 break
else
 print("next slot= "..z+1)
 z = z+1
end
end
end

-- Transposer 2
z = 1
function itemtransfer2()
PChest = component.transposer.getAllStacks(t2_pc)
while true do
 if PChest[z].label == "7" then
 print("true in run "..z)
 component.transposer.transferItem(t2_pc, 2, 64, z)
 break
 end
 if PChest[z].label == "8" then
 print("true in run "..z)
 component.transposer.transferItem(t2_pc, 1, 64, z)
 break
 end
 if PChest[z].label == "9" then
 print("true in run "..z)
 component.transposer.transferItem(t2_pc, 5, 64, z)
 break
 else
 print("next slot= "..z+1)
 z = z+1
 end
 end
 end

-- Transposer 3
z = 1
function itemtransfer3()
PChest = component.transposer.getAllStacks(t3_pc)
while true do
 if PChest[z].label == "10" then
 print("true in run "..z)
 component.transposer.transferItem(t3_pc, 1, 64, z)
 break
 end
 if PChest[z].label == "11" then
 print("true in run "..z)
 component.transposer.transferItem(t3_pc, 5, 64, z)
 break
 end
  if PChest[z].label == "12" then
 print("true in run "..z)
 component.transposer.transferItem(t3_pc, 5, 64, z)
 break
 end
  if PChest[z].label == "13" then
 print("true in run "..z)
 component.transposer.transferItem(t3_pc, 5, 64, z)
 break
 end
 if PChest[z].label == "14" then
 print("true in run "..z)
 component.transposer.transferItem(t3_pc, 5, 64, z)
 break
 else
 print("next slot= "..z+1)
 z = z+1
end
end
end

-- Transposer 4
z = 1
function itemtransfer4()
PChest = component.transposer.getAllStacks(t4_pc)
while true do
 if PChest[z].label == "5" then
 print("true in run "..z)
 component.transposer.transferItem(t4_pc, 1, 64, z)
 break
 end
  if PChest[z].label == "6" then
 print("true in run "..z)
 component.transposer.transferItem(t4_pc, 5, 64, z)
 break
 end
 if PChest[z].label == "f1" then
 print("true in run "..z)
 component.transposer.transferItem(t4_pc, 3, 64, z)
 break
 end
  if PChest[z].label == "f2" then
 print("true in run "..z)
 component.transposer.transferItem(t4_pc, 3, 64, z)
 break
 end
  if PChest[z].label == "f3" then
 print("true in run "..z)
 component.transposer.transferItem(t4_pc, 3, 64, z)
 break
 end
  if PChest[z].label == "f4" then
 print("true in run "..z)
 component.transposer.transferItem(t4_pc, 3, 64, z)
 break
 else
 print("next slot= "..z+1)
 z = z+1
 end
end
end

-- Transposer 5
z = 1
function itemtransfer5()
PChest = component.transposer.getAllStacks(t5_pc)
while true do
 if PChest[z].label == "11" then
 print("true in run "..z)
 component.transposer.transferItem(t5_pc, 2, 64, z)
 break
 end
 if PChest[z].label == "12" then
 print("true in run "..z)
 component.transposer.transferItem(t5_pc, 5, 64, z)
 break
 end
  if PChest[z].label == "13" then
 print("true in run "..z)
 component.transposer.transferItem(t5_pc, 1, 64, z)
 break
 end
  if PChest[z].label == "14" then
 print("true in run "..z)
 component.transposer.transferItem(t5_pc, 3, 64, z)
 break
 else
 print("next slot= "..z+1)
 z = z+1
 end
end
end



-- Transposer 6 Fluid Handler
z=1
function fluidtransfer1()
PChest = component.transposer.getAllStacks(t6_pc)
while true do
 if PChest[z].label == "f1" then
 print("true in run "..z)
 component.transposer.transferItem(t6_pc, 4, 64, z)
 break
 end
  if PChest[z].label == "f2" then
 print("true in run "..z)
 component.transposer.transferItem(t6_pc, 3, 64, z)
 break
 end
  if PChest[z].label == "f3" then
 print("true in run "..z)
 component.transposer.transferItem(t6_pc, 5, 64, z)
 break
 end
  if PChest[z].label == "f4" then
 print("true in run "..z)
 component.transposer.transferItem(t6_pc, 1, 64, z)
 break
 else
 print("next slot= "..z+1)
 z = z+1
 end
end
end


-- Running Sorting down here
timerb = 1
while true do -- Sorting Loop
term.clear()
term.setCursor(1,1)
print("Running Program Assline Sorting...")
 if timerb == timera then
 print("Running Sorting")
z = 1
adrtrans1()
err = 0
while true do
if err == PChest_size then
break
end
if pcall(itemtransfer1) then
 err = 0
 z = z+1
else
 err = err+1
 --print("error = "..err)
 z = z+1
end
end
print("done with Transposer 1")

z = 1
adrtrans2()
err = 0
while true do
if err == PChest_size then
break
end
if pcall(itemtransfer2) then
 err = 0
 z = z+1
else
 err = err+1
 --print("error = "..err)
 z = z+1
end
end
print("done with transposer 2")

z = 1
adrtrans3()
err = 0
while true do
if err == PChest_size then
break
end
if pcall(itemtransfer3) then
 err = 0
 z = z+1
else
 err = err+1
 --print("error = "..err)
 z = z+1
end
end
print("done with Transposer 3")

z = 1
adrtrans4()
err = 0
while true do
if err == PChest_size then
break
end
if pcall(itemtransfer4) then
 err = 0
 z = z+1
else
 err = err+1
 --print("error = "..err)
 z = z+1
end
end
print("done with Transposer 4")

z = 1
adrtrans5()
err = 0
while true do
if err == 27 then
break
end
if pcall(itemtransfer5) then
 err = 0
 z = z+1
else
 err = err+1
 --print("error = "..err)
 z = z+1
end
end
print("done with Transposer 5")

z = 1
adrfluidtrans1()
err = 0
while true do
if err == 27 then
break
end
if pcall(fluidtransfer1) then
 err = 0
 z = z+1
else
 err = err+1
 --print("error = "..err)
 z = z+1
end
end
print("done with Transposer 6 (Fluid)")

timerb = 1
else
term.setCursor(1,2)
term.clearLine()
print("Sleeping since: "..timerb)
os.sleep(1)
timerb = timerb+1
end
end
