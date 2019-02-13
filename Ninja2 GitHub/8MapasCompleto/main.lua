
display.setStatusBar(display.HiddenStatusBar)

local widget = require("widget")

local W = display.contentWidth
local H = display.contentHeight

--Ventana de maps
local myMap = native.newMapView(W/2, H/2, W, H)

if myMap then
    myMap.mapType = "standard"   --modos satellite / hybrid
    myMap.x = display.contentCenterX
    myMap.y = 110
    myMap:setRegion(40.4410922,-3.7877867, 1/100, 1/100, true) --Datio, ubicaciones en Google Maps y zoom
end

--Cambiar de ubicación
local function moveToMapLocation(event)
    local id = event.target.id
    if id =="Datio" then
        myMap:setRegion(40.4410922,-3.7877867, 1/100, 1/100, true)
    elseif id == "EINA" then
        myMap:setRegion(41.69, -0.88, 1/100, 1/100, true)
    elseif id == "PortAventura" then
        myMap:setRegion(41.08, 1.16, 1/100, 1/100, true)
    end
end


--Funciones para cambiar el modo de mapa
local function toMapStandard(event)
    print("Change to Standard Map")
    if myMap then
        myMap.mapType = "standard"
    end
end

local function toMapHybrid(event)
    print("Change to Hybrid Map")
    if myMap then
        myMap.mapType = "hybrid"
    end
end

local function toMapSatellite(event)
    print("Change to Satellite Map")
    if myMap then
        myMap.mapType = "satellite"
    end
end


--Creación y ubicación de todos los botones, cambios de modo y de ubicaciones

local buttonStandard = widget.newButton{
    label = "Standard",
    labelColor = {default={0,0,0,1}, over = {0,0,0,1}},
    onRelease = toMapStandard,
    shape = "roundedRect",
    width = 175,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={0.5,0.5,0.5,1}, over={0.75,0.75,0.75,1} },
    strokeColor = { default={0,0,0,1}, over={0,0,0,1} },
    strokeWidth = 8,
    labelAlign = "center",
    font = "Arial",
    fontSize = 20
}
buttonStandard.x = display.contentWidth/5
buttonStandard.y = display.contentHeight-50

local buttonSatellite = widget.newButton{
    label = "Satellite",
    labelColor = {default={0,0,0,1}, over = {0,0,0,1}},
    onRelease = toMapSatellite,
    shape = "roundedRect",
    width = 175,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={0.5,0.5,0.5,1}, over={0.75,0.75,0.75,1} },
    strokeColor = { default={0,0,0,1}, over={0,0,0,1} },
    strokeWidth = 8,
    labelAlign = "center",
    font = "Arial",
    fontSize = 20
}
buttonSatellite.x = display.contentWidth/2
buttonSatellite.y = display.contentHeight-50

local buttonHybrid = widget.newButton{
    label = "Hybrid",
    labelColor = {default={0,0,0,1}, over = {0,0,0,1}},
    onRelease = toMapHybrid,
    shape = "roundedRect",
    width = 175,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={0.5,0.5,0.5,1}, over={0.75,0.75,0.75,1} },
    strokeColor = { default={0,0,0,1}, over={0,0,0,1} },
    strokeWidth = 8,
    labelAlign = "center",
    font = "Arial",
    fontSize = 20
}
buttonHybrid.x = display.contentWidth*4/5
buttonHybrid.y = display.contentHeight-50

local buttonDatio = widget.newButton{
    label = "Datio",
    id = "Datio",
    labelColor = {default={0,0,0,1}, over = {0,0,0,1}},
    onRelease = moveToMapLocation,
    shape = "roundedRect",
    width = 175,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={0.5,0.5,0.5,1}, over={0.75,0.75,0.75,1} },
    strokeColor = { default={0,0,0,1}, over={0,0,0,1} },
    strokeWidth = 8,
    labelAlign = "center",
    font = "Arial",
    fontSize = 20
}
buttonDatio.x = display.contentWidth/5
buttonDatio.y = display.contentHeight-130

local buttonEINA = widget.newButton{
    label = "EINA",
    id = "EINA",
    labelColor = {default={0,0,0,1}, over = {0,0,0,1}},
    onRelease = moveToMapLocation,
    shape = "roundedRect",
    width = 175,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={0.5,0.5,0.5,1}, over={0.75,0.75,0.75,1} },
    strokeColor = { default={0,0,0,1}, over={0,0,0,1} },
    strokeWidth = 8,
    labelAlign = "center",
    font = "Arial",
    fontSize = 20
}
buttonEINA.x = display.contentWidth/2
buttonEINA.y = display.contentHeight-130

local buttonPortAventura = widget.newButton{
    label = "PortAventura",
    id = "PortAventura",
    labelColor = {default={0,0,0,1}, over = {0,0,0,1}},
    onRelease = moveToMapLocation,
    shape = "roundedRect",
    width = 175,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={0.5,0.5,0.5,1}, over={0.75,0.75,0.75,1} },
    strokeColor = { default={0,0,0,1}, over={0,0,0,1} },
    strokeWidth = 8,
    labelAlign = "center",
    font = "Arial",
    fontSize = 20
}
buttonPortAventura.x = display.contentWidth*4/5
buttonPortAventura.y = display.contentHeight-130
