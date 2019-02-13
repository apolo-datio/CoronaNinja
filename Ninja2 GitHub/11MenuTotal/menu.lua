local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
    function irAEj1( ... )
        composer.gotoScene( "scene1" ) -- Assumes that "scene1.lua" exists and is configured as a Composer scene
    end
    function irAEj2( ... )
        composer.gotoScene( "scene2" ) 
    end
    function irAEj3( ... )
        composer.gotoScene( "scene3" ) 
    end
    function irAEj4( ... )
        composer.gotoScene( "scene4" ) 
    end
    function irAEj5( ... )
        composer.gotoScene( "scene5" ) 
    end
    function irAEj6( ... )
        composer.gotoScene( "scene6" ) 
    end
    


    function init(sceneGroup)
        
        local menu = new display.newText(sceneGroup,"Menú Principal",  display.contentWidth/2, display.contentHeight/8, 600, 80, Arial,50)
        --Para meterlo en el sceneGroup
        local myButtonEj1 = widget.newButton
        {
            left = 50,
            top = 50,
            label = "1 Inicio",
            labelAlign = "center",
            font = "Arial",
            fontSize = 40,
            labelColor = {default = {0,255,255}, over = {0,0,255}},
            onPress = irAEj1
        }
        myButtonEj1.baseLabel = "Default"
        myButtonEj1.x=display.contentWidth/2
        myButtonEj1.y=display.contentHeight/4.4
        sceneGroup:insert(myButtonEj1)

        local myButtonEj2 = widget.newButton
        {
            left = 50,
            top = 50,
            label = "2 Slider",
            labelAlign = "center",
            font = "Arial",
            fontSize = 40,
            labelColor = {default = {0,255,255}, over = {0,0,255}},
            onPress = irAEj2
        }
        myButtonEj2.baseLabel = "Default"
        myButtonEj2.x=display.contentWidth/2
        myButtonEj2.y=display.contentHeight/3.4
        sceneGroup:insert(myButtonEj2)

        local myButtonEj3 = widget.newButton
        {
            left = 50,
            top = 50,
            label = "3 PickerWheel",
            labelAlign = "center",
            font = "Arial",
            fontSize = 40,
            labelColor = {default = {0,255,255}, over = {0,0,255}},
            onPress = irAEj3
        }
        myButtonEj3.baseLabel = "Default"
        myButtonEj3.x=display.contentWidth/2
        myButtonEj3.y=display.contentHeight/2.75
        sceneGroup:insert(myButtonEj3)

        local myButtonEj4 = widget.newButton
        {
            left = 50,
            top = 50,
            label = "4 Acelerómetro",
            labelAlign = "center",
            font = "Arial",
            fontSize = 40,
            labelColor = {default = {0,255,255}, over = {0,0,255}},
            onPress = irAEj4
        }
        myButtonEj4.baseLabel = "Default"
        myButtonEj4.x=display.contentWidth/2
        myButtonEj4.y=display.contentHeight/2.30
        sceneGroup:insert(myButtonEj4)

        local myButtonEj5 = widget.newButton
        {
            left = 50,
            top = 50,
            label = "5 CirculoPhysics",
            labelAlign = "center",
            font = "Arial",
            fontSize = 40,
            labelColor = {default = {0,255,255}, over = {0,0,255}},
            onPress = irAEj5
        }
        myButtonEj5.baseLabel = "Default"
        myButtonEj5.x=display.contentWidth/2
        myButtonEj5.y=display.contentHeight/1.98
        sceneGroup:insert(myButtonEj5)

        local myButtonEj6 = widget.newButton
        {
            left = 50,
            top = 50,
            label = "6 Arkanoid",
            labelAlign = "center",
            font = "Arial",
            fontSize = 40,
            labelColor = {default = {0,255,255}, over = {0,0,255}},
            onPress = irAEj6
        }
        myButtonEj6.baseLabel = "Default"
        myButtonEj6.x=display.contentWidth/2
        myButtonEj6.y=display.contentHeight/1.73
        sceneGroup:insert(myButtonEj6)

        
        return sceneGroup
    end


    

	
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 	print("Se crea el menú")
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    init(sceneGroup)    --con init creo todos los widgets del menú
 
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
 		print("Cuando se oculta el menú")
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 	print("Cuando se destruye el menú")

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

