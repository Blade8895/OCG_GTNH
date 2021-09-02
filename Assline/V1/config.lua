component = require("component")
sides = require("sides")

sleep = os.sleep

-- Adresses
adresstransposer1 = "ff1dfd0a-e0ae-4f18-a143-dde8f3e8621b"
adresstransposer2 = "269c79ea-2052-4756-b740-7310a6649044"
adresstransposer3 = "1afb81c9-ea80-46cb-9e2b-945d1ace88fd"
adresstransposer4 = "e8f54c10-41a8-47c7-9773-a7e686714406"
adresstransposer5 = "b83cc508-1f00-4527-85d8-39474eb33c90"
adresstransposer6 = "a6ac54a2-dd98-41fa-add6-845cbee9783d"

-- Global Functions
function adrtrans1()
 component.setPrimary("transposer", adresstransposer1)
 sleep(0.1)
end

function adrtrans2()
 component.setPrimary("transposer", adresstransposer2)
 sleep(0.1)
end

function adrtrans3()
 component.setPrimary("transposer", adresstransposer3)
 sleep(0.1)
end

function adrtrans4()
 component.setPrimary("transposer", adresstransposer4)
 sleep(0.1)
end

function adrtrans5()
 component.setPrimary("transposer", adresstransposer5)
 sleep(0.1)
end

function adrfluidtrans1()
 component.setPrimary("transposer", adresstransposer6)
 sleep(0.1)
end

return config