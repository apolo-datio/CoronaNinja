local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 

function init(sceneGroup )
                    
    local sumo = display.newImageRect(sceneGroup,"Sumito.png", 100, 100)
    sumo.x = display.contentWidth/2
    sumo.y = display.contentHeight/2
    sumo:scale(2,2)

    local velocityx = 0 
    local velocityy = 0

    local function onAccelerate(event) 
        velocityx = velocityx+2*event.xInstant --xInstant e yInstant son del acelerometro
        velocityy = velocityy+2*event.yInstant
    end

    --"Escuchador" en tiempo de ejecución
    Runtime:addEventListener("accelerometer",onAccelerate)  


    local function movesumo(event)
        sumo.x = sumo.x + velocityx
        sumo.y = sumo.y + velocityy
    end

    --enterFrame evento que ocurre en intervalo de fps de la app 30(default) a 60, se puede especificar en config.lua
    Runtime:addEventListener("enterFrame", movesumo) 

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
    init(sceneGroup)
    
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
        print("Se oculta escena4 y ejecuta inmediatamente")
        composer.removeScene("scene4")  
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("Se ha ocultado escena4 y se ejecuta después de cargar el menú, o sea otra escena")
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("Se destruye la escena4")
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