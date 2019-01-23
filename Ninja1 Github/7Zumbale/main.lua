
display.setStatusBar(display.HiddenStatusBar)

local function begin() 
    local background1=display.newImage("photo5.jpg",360,570)
    background1.x=display.contentCenterX
    background1.y=display.contentCenterY
    
end

timer.performWithDelay( 0, begin)

local function begin2()
    local western
    local tapCount
    local tapText
    local can
    local physics
    local explosionSound
    local fireSound
    
    
    
    western=display.newImage("oeste.jpg",360,570)
    
    western.x=display.contentCenterX
    western.y=display.contentCenterY
    
    tapCount = 0
    tapText = display.newText( tapCount,100, 460, native.systemFont, 40 )
    tapText:setFillColor(100,20 ,50)
    --local taptext=display.newText(string1, left, top, font, size)
    
    can=display.newImageRect("lata.png",112,112)
    can.x=display.contentCenterX
    can.y=display.contentHeight-430
    
    
    
    local timeLimit
    local timeLeft
    timeLimit = 30 
    timeLeft = display.newText(timeLimit, 160, 20, native.systemFontBold, 30)
    timeLeft:setTextColor(255,0,0)
    
    local function timerDown()
        local message
        timeLimit = timeLimit-1
        timeLeft.text = timeLimit
        if(timeLimit==0)then
            message=display.newText("END",display.contentCenterX,display.contentCenterY,native.systemFontBold,120)
            can:removeSelf()
            can = nil
        end
    end
    timer.performWithDelay(1000,timerDown,timeLimit)
    
    
    physics=require("physics")
    physics.start()
    physics.addBody(can,"dynamic",{radius=70,bounce=0})
    
    
    local function pushcan()
        local variable
        local variable2
        variable=math.random(-3, 3)
        variable2 =(math.random(1,5))*(-1)
        
        
        can:applyLinearImpulse(variable, variable2,can.x, can.y ) 
        --print (lata.y)
        
        if can.y >= 453 then
            
            tapCount = tapCount -10
            tapText.text = "Score: "..tapCount
        else 
            tapCount = tapCount +1
            tapText.text = "Score: "..tapCount
            
            
        end
        
        explosionSound = audio.loadSound( "audio/explosion.wav" )
        fireSound = audio.loadSound( "audio/fire.wav" )
        audio.play( fireSound )
        audio.play( explosionSound )
        
        
    end
    
    can:addEventListener( "tap", pushcan )
    
    physics.setGravity( 0,9.8 )
    
    local letterboxWidth = (display.actualContentWidth-display.contentWidth)/2
    local letterboxHeight = (display.actualContentHeight-display.contentHeight)/2
    local wallLeft
    local wallRight
    local wallTop
    local wallBottom
    
    wallLeft = display.newRect( -10-letterboxWidth,display.contentCenterY, 20, display.actualContentHeight )
    
    physics.addBody( wallLeft, "static", { bounce=0.4, friction=0.1 } )
    
    wallRight = display.newRect( 340+letterboxWidth, display.contentCenterY, 20, display.actualContentHeight )
    
    physics.addBody( wallRight, "static", { bounce=0.4, friction=0.1 } )
    
    wallTop = display.newRect(display.contentCenterX,-10-letterboxHeight, display.actualContentWidth, 20 )
    
    physics.addBody( wallTop, "static", { bounce=0, friction=0 } )
    
    wallBottom = display.newRect( display.contentCenterX, 490+letterboxHeight, display.actualContentWidth, 20 )
    
    physics.addBody( wallBottom, "static", { bounce=0, friction=0} )
    
    
    
end

timer.performWithDelay(2000,begin2)



