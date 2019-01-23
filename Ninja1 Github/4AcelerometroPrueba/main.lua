

local sumo = display.newImageRect("Sumito.png", 100, 100)
sumo.x = display.contentWidth/2
sumo.y = display.contentHeight/2
sumo:scale(2,2)

local velocityx = 0 
local velocityy = 0

local function onAccelerate(event) 
    velocityx = velocityx+2*event.xInstant --xInstant e yInstant son del acelerometro
    velocityy = velocityy+2*event.yInstant
end

--"Escuchador" en tiempo de ejecución, no en evento
Runtime:addEventListener("accelerometer",onAccelerate)  


local function movesumo(event)
    sumo.x = sumo.x + velocityx
    sumo.y = sumo.y + velocityy
end

--enterFrame evento que ocurre en intervalo de fps de la App 30 o 60, se puede especificar en config.lua
Runtime:addEventListener("enterFrame", movesumo) 

