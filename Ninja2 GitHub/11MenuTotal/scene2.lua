local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 

function init(sceneGroup )
    display.setStatusBar(display.HiddenStatusBar)

    local W = display.contentWidth
    local H = display.contentHeight

    --Mucho cuidado con los valores, son entre 0 y 1
    local R=.13
    local G=.67
    local B=.80

    -- Rectángulo para establecer fondo, 
    local fondo = display.newRect(sceneGroup, W/2, H/2, W, H)
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


    -- Creo los sliders

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

    sceneGroup:insert(sliderR)
    sceneGroup:insert(sliderG)
    sceneGroup:insert(sliderB)

    return sceneGroup
end 


function irAMenu( ... )
    composer.gotoScene( "menu" ) -- Assumes that "menu.lua" exists and is configured as a Composer scene
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    init(sceneGroup)  -- para la app de esta escena
    
    local myButtonAtras = widget.newButton
        {
            left = 50,
            top = 50,
            label = "Volver Menú",
            labelAlign = "center",
            font = "Arial",
            fontSize = 25,
            labelColor = {default = {255,0,255}, over = {0,0,255}},
            onPress = irAMenu
        }
        myButtonAtras.baseLabel = "Default"
        myButtonAtras.x=display.contentWidth/1.15
        myButtonAtras.y=display.contentHeight/10

    sceneGroup:insert( myButtonAtras )

    
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        print("Se oculta escena2 y ejecuta inmediatamente")
        composer.removeScene("scene2") 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("Se ha ocultado escena2 y se ejecuta después de cargar el menú, o sea otra escena")
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("Se destruye la escena2")
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
     
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene