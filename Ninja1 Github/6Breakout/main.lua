
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
    local paddle=display.newRect(display.contentWidth / 2 - paddleWidth / 2,
        display.contentHeight - 50, paddleWidth, paddleHeight )
    
    physics.addBody(paddle,"static",{friction=0, bounce=1})
    
    local movePaddle=function(event)    
        paddle.x = event.x
    end 
    
    Runtime:addEventListener("touch", movePaddle)
end

function createBall()
    local ballRadius = 10
    
    ball = display.newCircle( display.contentWidth / 2,
    display.contentHeight / 2,
    ballRadius ) 
    
    physics.addBody(ball, "dynamic", {friction=0, bounce = 1, radius=ballRadius}) 
    
    ball.collision = function(self, event)
        
        if(event.phase == "ended") then 
            if(event.other.type == "destructible") then
                event.other:removeSelf() 
            end
            if(event.other.type == "bottomWall") then 
                self:removeSelf()
                
                local onTimerComplete = function(event)
                    createBall() 
                    startGame()
                end
                
                timer.performWithDelay(1000, onTimerComplete, 1) 
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
            local brick = display.newRect(topLeft.x + (col * brickWidth), 
            topLeft.y + (row * brickHeight), brickWidth, brickHeight ) 
            brick:setFillColor(math.random(50, 255), math.random(50, 255), math.random(50, 255), 250) 
            brick.type = "destructible"
            physics.addBody(brick,"static",{friction=0, bounce=1}) 
        end
    end 
end

function createWalls() 
    local wallThickness = 10
    -- Left wall
    local wall = display.newRect( 0, 0, wallThickness, display.contentHeight*2 ) 
    physics.addBody(wall, "static", {friction=0, bounce = 1})
    -- Top wall 
    wall=display.newRect(0,0,display.contentWidth*4,wallThickness) 
    physics.addBody(wall, "static", {friction=0, bounce = 1})
    -- Right wall
    wall = display.newRect(display.contentWidth, 0, wallThickness, display.contentHeight*5) 
    physics.addBody(wall, "static", {friction=0, bounce = 1})
    -- Bottom wall
    wall = display.newRect(0, display.contentHeight, display.contentWidth*2, wallThickness) 
    physics.addBody(wall, "static", {friction=0, bounce = 1}) 
    wall.type = "bottomWall"
end

main()
