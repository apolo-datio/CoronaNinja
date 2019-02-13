local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 

function init(sceneGroup )
    --terminal
    print("Hola Mundo")

    --para la status bar
    display.setStatusBar(display.HiddenStatusBar) --se suele ocultar 

    --Imagen de fondo
    local background = display.newImage(sceneGroup,"world.jpg") --variable local, sin local es global(para scene-composer)
    background.x=640/2
    background.y=1136/2

    --texto sin más
    texto = display.newText(sceneGroup,"Hola Mundo", 160,100, native.systemFont, 80)
    texto.x = display.contentWidth/2
    texto.y = display.contentHeight/4
    texto:setTextColor(0, 0, 1)

    --Texto-"etiqueta"
    local label = display.newText(sceneGroup,"Mensaje", 100, 400, 300, 0, native.systemFont, 55)
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


    -- widget botón
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

    --Modificar la situación del botón,etc,...
    miBoton.x = display.contentWidth/2
    miBoton.y = display.contentHeight/1.25

     
    sceneGroup:insert(miBoton)

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
    print("Se crea escena1")
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    -- Creo un botón para ir al menú inicial

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

    init(sceneGroup)    --creo la app de esta escena
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
        print("Se oculta escena1 y ejecuta inmediatamente")
        composer.removeScene("scene1")  
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("Se ha ocultado escena1 y se ejecuta después de cargar el menú, o sea otra escena")
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("Se destruye la escena1")
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