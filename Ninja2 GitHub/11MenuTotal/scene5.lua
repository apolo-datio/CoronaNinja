local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 

function init(sceneGroup )
           
    local W = display.contentWidth
    local H = display.contentHeight

    -- carga el módulo de física
    local physics = require("physics")

    physics.start()
    physics.setGravity(0.7,9.8)

    physics.setDrawMode("normal") -- normal,hybrid

    local Ninja = display.newImage(sceneGroup,"Ninja.png")
    Ninja.x, Ninja.y = 150, 150
    Ninja:scale( 1, 1 )

    -- Aplicar física al objeto-cuerpo-Ninja
    physics.addBody( Ninja,
    {   density = 1.0,
        friction = 0.3,
        bounce = 0.5,
        radius = 150        --radio de acción del cuerpo, "ocupación"
    })


    -- suelo, muros y "techo"
    local ground = display.newRect(sceneGroup,W/2,H,W,5) 
    ground:setFillColor(0,0,0,255)                      -- alpha, opacidad
    physics.addBody(ground,"static", {density = 4.0, friction = 0.3, bounce = 1.2}) 

    local wall1 = display.newRect(sceneGroup,0,H/2,5,H)
    wall1:setFillColor(0,0,0,255)
    physics.addBody(wall1,"static", {density = 4.0, friction = 0.3, bounce = 1.3})  

    local wall2 = display.newRect(sceneGroup,W,H/2,5,H)
    wall2:setFillColor(0,0,0,255)
    physics.addBody(wall2,"static", {density = 4.0, friction = 0.3, bounce = 1.2})  

    local roof = display.newRect(sceneGroup,W/2,0,W,5)
    roof:setFillColor(0,0,0,255)
    physics.addBody(roof,"static", {density = 4.0, friction = 0.3, bounce = 0.5}) 

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
        print("Se oculta escena5 y ejecuta inmediatamente")
        --En este caso hay que tener cuidado para que pare physics
        physics.stop( )    
        composer.removeScene("scene5") 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("Se ha ocultado escena5 y se ejecuta después de cargar el menú, o sea otra escena")
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("Se destruye la escena5")
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