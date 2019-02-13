local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
-- scene object es un event listener que responde a eventos específicos, 
-- contiene una única propiedad self.view que hace referencia al display group 
-- asociado a la escena.

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

    function irAEscena1( ... )
	    composer.gotoScene( "scene1" ) -- Asume que "scene1.lua" existe y es configurada como una Composer scene
	end

	
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
 	print("Se crea el menú")
    local sceneGroup = self.view
    -- El código que hay aquí se ejecuta cuando la escena es primero creada pero no ha aparecido todavía en pantalla
    
    -- Cuidado con el sceneGroup, deben incluirse todos los widgets y tenerlo presente
    local aviso = new display.newText(sceneGroup, "Este es el Menú",  display.contentWidth/2, display.contentHeight/2.5, 400, 100, Arial,60)
    
    -- Y meterlo en el sceneGroup
	local myButtonEscena1 = widget.newButton
	{
	    left = 50,
	    top = 50,
	    label = "Ir a Escena1",
	    labelAlign = "center",
	    font = "Arial",
	    fontSize = 40,
	    labelColor = {default = {255,0,0}, over = {0,0,255}},
	    onPress = irAEscena1
	}
	myButtonEscena1.baseLabel = "Default"
	myButtonEscena1.x=display.contentWidth/2
	myButtonEscena1.y=display.contentHeight/1.5


    sceneGroup:insert( myButtonEscena1 )
    
 
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
 		print("Cuando se oculta el menú")
 
    elseif ( phase == "did" ) then
        -- El código aquí se ejecuta inmediatamente después de que la escena se apaga por completo.

    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- El código aquí se ejecuta antes de la eliminación de la vista de la escena
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

