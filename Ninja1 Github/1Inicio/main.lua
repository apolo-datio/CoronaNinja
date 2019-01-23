
local widget = require("widget")

--
print("Hola Mundo")

--
display.setStatusBar(display.HiddenStatusBar) --se suele ocultar

--
local background = display.newImage("world.jpg")	--variable local, sin local es global(para scene-composer)
background.x=640/2
background.y=1136/2

--
texto = display.newText("Hola Mundo", 160,100, native.systemFont, 80)
texto.x = display.contentWidth/2
texto.y = display.contentHeight/4
texto:setTextColor(0, 0, 1)

--
local label = display.newText("Mensaje", 100, 400, 200, 0, native.systemFont, 55)
label.x = display.contentWidth/2
label.y = display.contentHeight/2

--Funciones para los botones, por encima del widget
local function botonPress()
    label.text = "Pulsas el botón"
    return true
end

local function botonRelease()
    label.text = "Has soltado el botón"
    return true
end


-- 
local miBoton = widget.newButton{
left = 50,
top = 50,
label = "Mi primer botón",
labelAlign = "center",
font = "Arial",
fontSize = 60,
labelColor = {default = {255,0,0}, over = {0,255,0}},
--Para los eventos
onPress = botonPress,
onRelease = botonRelease
}

--Modificar la situación del botón
miBoton.x = display.contentWidth/2
miBoton.y = display.contentHeight/1.25



