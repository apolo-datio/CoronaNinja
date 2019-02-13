local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
--composer.removeScene("menu")  

function irAMenu( ... )
    composer.gotoScene( "menu" ) -- Asume que "scene1.lua" existe y es configurada como una Composer scene
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    print("Se crea escena1")
    local sceneGroup = self.view
    -- El código que hay aquí se ejecuta cuando la escena es primero creada pero no ha aparecido todavía en pantalla
    
    -- Cuidado con el sceneGroup, deben incluirse todos los widgets y tenerlo presente   
    local aviso = new display.newText(sceneGroup, "Es la escena 1",  display.contentWidth/2, display.contentHeight/2.5, 400, 100, Arial,60)
 
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
        -- El código aquí se ejecuta cuando la escena aún está fuera de la pantalla (pero está a punto de aparecer en la pantalla)
 
    elseif ( phase == "did" ) then
        -- El código aquí se ejecuta inmediatamente después de que la escena se muestra por completo.
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- El código aquí se ejecuta cuando la escena está en la pantalla (pero está a punto de desaparecer)
        print("Se oculta escena1 y ejecuta inmediatamente")
    elseif ( phase == "did" ) then
        -- El código aquí se ejecuta inmediatamente después de que la escena se apaga por completo.
        print("Se ha ocultado escena1 y se ejecuta después de cargar el menú, o sea otra escena")
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("Se destruye la escena1")
    local sceneGroup = self.view
    -- El código aquí se ejecuta antes de la eliminación de la vista de la escena
    composer.removeScene("scene1")  
 
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