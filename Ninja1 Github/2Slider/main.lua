display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")

local W = display.contentWidth
local H = display.contentHeight

--Mucho cuidado con los valores, son entre 0 y 1
local R=.13
local G=.67
local B=.80

-- 
local fondo = display.newRect(W/2, H/2, W, H)
fondo:setFillColor(R, G, B)

local function sliderListener(event)
    local slider =event.target  --el objetivo del evento es slider
    
    if(slider.id == "sliderR")then
        R = event.value/100    --.. para concatenar
        print("slider at "..R.." "..G.." "..B.." "..slider.id) 
    end
    if(slider.id == "sliderG")then
        G = event.value/100    --.. para concatenar
        print("slider at "..R.." "..G.." "..B.." "..slider.id) 
    end
    if(slider.id == "sliderB")then
        B = event.value/100    --.. para concatenar
        print("slider at "..R.." "..G.." "..B.." "..slider.id) 
    end
    fondo:setFillColor(R, G, B)     --Cambia el color al RGB correspondiente   
end


-- 

local sliderR = widget.newSlider{
    id = "sliderR",
    orientation = "horizontal",
    width = 400,
    top = 600,
    left = 100,
    listener = sliderListener   --función que crearé luego, antes del widget
}

local sliderG = widget.newSlider{
    id = "sliderG",
    orientation = "horizontal",
    width = 400,
    top = 650,
    left = 100,
    listener = sliderListener   --función que crearé luego
}
local sliderB = widget.newSlider{
    id = "sliderB",
    orientation = "horizontal",
    width = 400,
    top = 700,
    left = 100,
    listener = sliderListener   --función que crearé luego
}

-- Valor por defecto, en porcentaje
sliderR:setValue(13)
sliderG:setValue(67)
sliderB:setValue(80)