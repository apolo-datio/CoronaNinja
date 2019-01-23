local widget = require("widget")

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
local labelDia = display.newText("Día seleccionado", W/2,H/2 , W, 0, native.systemFont,45)
local label = display.newText("Etiqueta para mensaje", W/2,H/1.75 , W, 0, native.systemFont,45)    


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

miBoton.x=display.contentWidth/2
miBoton.y=display.contentHeight/1.5
