local component = require("component")
gpu = component.gpu

 --gpu.fill(Spalte, Zeile, Dicke nach rechts, Höhe, "█")
function Fusion_Build(x_base,y_base)
    -- print Fusion Full
    gpu.fill(x_base+12,y_base+0, 6, 1, "█")
    gpu.fill(x_base+8,y_base+1, 14, 1, "█")
    gpu.fill(x_base+6,y_base+2, 18, 1, "█")
    gpu.fill(x_base+4,y_base+3, 22, 1, "█")
    gpu.fill(x_base+2,y_base+4, 26, 2, "█")
    gpu.fill(x_base+0,y_base+6, 30, 3, "█")
    gpu.fill(x_base+2,y_base+9, 26, 2, "█")
    gpu.fill(x_base+4,y_base+11, 22, 1, "█")
    gpu.fill(x_base+6,y_base+12, 18, 1, "█")
    gpu.fill(x_base+8,y_base+13, 14, 1, "█")
    gpu.fill(x_base+12,y_base+14, 6, 1, "█")

    -- Carve hole
    gpu.fill(x_base+12,y_base+3, 6, 1, " ")
    gpu.fill(x_base+8,y_base+4, 14, 2, " ")
    gpu.fill(x_base+6,y_base+6, 18, 3, " ")
    gpu.fill(x_base+8,y_base+9, 14, 2, " ")
    gpu.fill(x_base+12,y_base+11, 6, 1, " ")
end

Fusion_Build(4,4)
