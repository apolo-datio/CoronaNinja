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

    --Crear arrays para rellenar las columnas de datos
    local months = {"Enero","Febrero","Marzo","Abril","Mayo","Junio",
    "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"}

    local monthdays={31,28,31,30,31,30,31,31,30,31,30,31}

    local days={}
    for i =1,31 do      --el for para rellenar el array
        days[i]=i
    end

    local years={}
    for i =1,50 do      --el for para rellenar el array
        years[i]=1970+i
    end

    --Para las columnas del pickerwheel
    local columnData= {
        --columna días
        {
            align="right",
            width=W/5,
            startIndex=9,
            labels = days   --referencia al array que hemos creado antes
        },
        --columna meses
        {
            align="center",
            width=W*3/5,
            startIndex=8,
            labels = months --referencia al array que hemos creado antes
        },
        --columna años
        {
            align="center",
            width=W/5,
            startIndex=8,
            labels = years --referencia al array que hemos creado antes
        },
    }

    --Crear pickerwheel

    local nuestroPicker = widget.newPickerWheel{
        left = 0,
        top = 210,
        font = native.systemFontBold,
        fontSize = 30,
        columns = columnData    --hace referencia a los datos anteriores creados 
    }
     

    --Añadimos labels
    local labelDia = display.newText(sceneGroup,"Día seleccionado", W/2,H/2 , W, 0, native.systemFont,45)
    local label = display.newText(sceneGroup,"Etiqueta para mensaje", W/2,H/1.75 , W, 0, native.systemFont,45)    


    -- Comprobar si es correcta la fecha...
    -- is leap year
    local function isleapyear(year) -- year must be int!
        return year%4==0 and (year%100~=0 or year%400==0)
    end


    local function onBotonPulsado(event)
        local filasDelPicker = nuestroPicker:getValues() --para recoger los valores del picker
        labelDia.text = "La fecha es: "..filasDelPicker[1].value.."/"..filasDelPicker[2].value.."/"
        ..filasDelPicker[3].value

    -- Para comprobar si es correcta la fecha
        
        local bisiesto=0
        local check=1
        label.text="Acabas de pulsar el botón"  --Deben estar los widgets antes....
        
        local selectedRows = nuestroPicker:getValues()
        for i=1,#selectedRows do
            print( selectedRows[i].value, selectedRows[i].index )
        end
        --comprobando si es bisiesto...
        if isleapyear(selectedRows[3].value)then
            bisiesto=1
        end
        --comprobando meses con días correctos
        if((selectedRows[2].value == "Abril" or "Junio" or "Septiembre" or "Noviembre") and (tonumber(selectedRows[1].value) == 31))then
            check=0
        end
        --comprobar febrero bisiesto
        if((selectedRows[2].value == "Febrero") and (tonumber(selectedRows[1].value) >= 30) and bisiesto == 1)then
            check=0
        end
        --comprobar febrero no bisiesto
        if((selectedRows[2].value == "Febrero") and (tonumber(selectedRows[1].value) >= 29) and bisiesto == 0)then
            check=0
        end
        
        --comprobar check
        if(check==1)then
            label.text="Fecha correcta"
        elseif (check==0) then
            label.text="No es posible esa fecha...."
           
        end
        
        return true

    end 

    --Añadimos botón
    local miBoton = widget.newButton{
        left= 50,
        top = 50,
        label = "Validar",
        labelAlign = "center",
        font = "Arial", 
        fontSize = 50,
        labelColor = {default = {255,0,0}, over = {0,0,255}},
        onPress = onBotonPulsado    -- La función debe estar antes
    }
    --miBoton.baseLabel="Default"
    miBoton.x=display.contentWidth/2
    miBoton.y=display.contentHeight/1.5

    sceneGroup:insert(miBoton)
    sceneGroup:insert(nuestroPicker)

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
        print("Se oculta escena3 y ejecuta inmediatamente")
        composer.removeScene("scene3")
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("Se ha ocultado escena3 y se ejecuta después de cargar el menú, o sea otra escena")
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("Se destruye la escena3")
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