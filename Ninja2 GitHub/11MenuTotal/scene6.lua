local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 

function init(sceneGroup )
                
    require ("physics")

    function main()
        setUpPhysics() 
        createWalls() 
        createBricks() 
        createBall() 
        createPaddle() 
        startGame()
    end

    function setUpPhysics() 
        physics.start()
        -- physics.setDrawMode("hybrid") 
        physics.setGravity(0,0)
    end

    function createPaddle()
        
        local paddleWidth = 100 
        local paddleHeight = 10
        local paddle=display.newRect(sceneGroup,display.contentWidth / 2 - paddleWidth / 2,
            display.contentHeight - 50, paddleWidth, paddleHeight )
        
        physics.addBody(paddle,"static",{friction=0, bounce=1})  --static, dynamic y kinematic
        
        local movePaddle=function(event)    
            paddle.x = event.x
        end 
        
        Runtime:addEventListener("touch", movePaddle)
    end

    function createBall()
        local ballRadius = 10
        
        ball = display.newCircle(sceneGroup, display.contentWidth / 2,
        display.contentHeight / 2,
        ballRadius ) 
        
        physics.addBody(ball, "dynamic", {friction=0, bounce = 1, radius=ballRadius}) 
        
        ball.collision = function(self, event)
            
            if(event.phase == "ended") then 
                if(event.other.type == "destructible") then
                    event.other:removeSelf() 
                end
                if(event.other.type == "bottomWall") then       --si toca el "suelo"
                    self:removeSelf()
                    
                    local onTimerComplete = function(event)
                        createBall() 
                        startGame()
                    end
                    
                    timer.performWithDelay(1000, onTimerComplete, 1) --comienza de nuevo el juego
                end
            end 
        end
        ball:addEventListener("collision", ball)    
    end

    function startGame() 
        ball:setLinearVelocity(150, 300)
    end

    function createBricks()
        local brickWidth = 80
        local brickHeight = 20
        local numOfRows = 4
        local numOfCols = 6
        local topLeft = {x= display.contentWidth / 1.75 - (brickWidth * numOfCols ) / 2, y= 200}
        
        local row, col
        for row = 0, numOfRows - 1 do
            for col = 0, numOfCols - 1 do 
                -- Create a brick
                local brick = display.newRect(sceneGroup,topLeft.x + (col * brickWidth), 
                topLeft.y + (row * brickHeight), brickWidth, brickHeight ) 
                brick:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1), 1) 
                brick.type = "destructible"
                physics.addBody(brick,"static",{friction=0, bounce=1}) 
            end
        end 
    end

    function createWalls() 
        local wallThickness = 10
        -- Left wall
        local wall = display.newRect(sceneGroup, 0, 0, wallThickness, display.contentHeight*2 ) 
        physics.addBody(wall, "static", {friction=0, bounce = 1})
        -- Top wall 
        wall=display.newRect(sceneGroup,0,0,display.contentWidth*4,wallThickness) 
        physics.addBody(wall, "static", {friction=0, bounce = 1})
        -- Right wall
        wall = display.newRect(sceneGroup,display.contentWidth, 0, wallThickness, display.contentHeight*5) 
        physics.addBody(wall, "static", {friction=0, bounce = 1})
        -- Bottom wall
        wall = display.newRect(sceneGroup,0, display.contentHeight, display.contentWidth*2, wallThickness) 
        physics.addBody(wall, "static", {friction=0, bounce = 1}) 
        wall.type = "bottomWall" --para cuando toque el suelo que lo detecte y que empiece de nuevo el juego
    end

    main()

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
        print("Se oculta escena6 y ejecuta inmediatamente")
        --En este caso hay que tener cuidado para que pare physics
        physics.stop( )
        composer.removeScene("scene6")  
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        print("Se ha ocultado escena6 y se ejecuta después de cargar el menú, o sea otra escena")
    end
end
 
 
-- destroy()
function scene:destroy( event )
    print("Se destruye la escena6")
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