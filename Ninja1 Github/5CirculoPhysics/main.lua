
local W = display.contentWidth
local H = display.contentHeight

local physics = require("physics")

physics.start()
physics.setGravity(0.7,9.8)

physics.setDrawMode("hybrid") -- normal,hybrid

local Ninja = display.newImage("Ninja.png")
Ninja.x, Ninja.y = 150, 150
Ninja:scale( 1, 1 )

-- Aplicar física al objeto-cuerpo-Ninja
physics.addBody( Ninja,
{	density = 1.0,
    friction = 0.3,
    bounce = 0.5,
    radius = 50		--radio de acción del cuerpo, "lo que ocupa"
})


local ground = display.newRect(W/2,H,W,5) 
ground:setFillColor(0,0,0,255)						-- alpha, entre 0 y 1, opacidad
physics.addBody(ground,"static", {density = 4.0, friction = 0.3, bounce = 1.2})	

local wall1 = display.newRect(0,H/2,5,H)
wall1:setFillColor(0,0,0,255)
physics.addBody(wall1,"static", {density = 4.0, friction = 0.3, bounce = 1.3})	

local wall2 = display.newRect(W,H/2,5,H)
wall2:setFillColor(0,0,0,255)
physics.addBody(wall2,"static", {density = 4.0, friction = 0.3, bounce = 1.2})	

local roof = display.newRect(W/2,0,W,5)
roof:setFillColor(0,0,0,255)
physics.addBody(roof,"static", {density = 4.0, friction = 0.3, bounce = 0.5}) 


