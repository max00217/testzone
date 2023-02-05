function love.load()
    b1 = {}
    mouse = {}

	love.physics.setMeter(70)

	world = love.physics.newWorld(0, 9.81*64, true)
    b1_randx = math.random(50, 600)
    b1_randy = math.random(25, 625)

    b2_randx = math.random(50, 600)
    b2_randy = math.random(25, 625)

    b3_randx = math.random(50, 600)
    b3_randy = math.random(25, 625)

    b4_randx = math.random(50, 600)
    b4_randy = math.random(25, 625)

    b5_randx = math.random(50, 600)
    b5_randy = math.random(25, 625)

    b6_randx = math.random(50, 600)
    b6_randy = math.random(25, 625)
    
    b7_randx = math.random(50, 600)
    b7_randy = math.random(25, 625)

	objects = {}
  
	objects.ground = {}
	objects.ground.body = love.physics.newBody(world, 700/2, 660)
	objects.ground.shape = love.physics.newRectangleShape(650, 50)
	objects.ground.fixture = love.physics.newFixture(objects.ground.body,objects.ground.shape)

    objects.lwall = {}
	objects.lwall.body = love.physics.newBody(world, 0, 350)
	objects.lwall.shape = love.physics.newRectangleShape(50, 6500)
	objects.lwall.fixture = love.physics.newFixture(objects.lwall.body,objects.lwall.shape)

    objects.rwall = {}
	objects.rwall.body = love.physics.newBody(world, 700, 350)
	objects.rwall.shape = love.physics.newRectangleShape(50, 6500)
	objects.rwall.fixture = love.physics.newFixture(objects.rwall.body,objects.rwall.shape)

	objects.ball = {}
	objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic")
	objects.ball.shape = love.physics.newCircleShape(20)
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1)
	objects.ball.fixture:setRestitution(0.81) 

	objects.block1 = {}
	objects.block1.body = love.physics.newBody(world, b1_randx, b1_randy, "dynamic")
	objects.block1.shape = love.physics.newRectangleShape(0, 0, 162.5, 32.5)
	objects.block1.fixture = love.physics.newFixture(objects.block1.body, objects.block1.shape, 5)
    
	objects.block2 = {}
	objects.block2.body = love.physics.newBody(world, b2_randx, b2_randy, "dynamic")
	objects.block2.shape = love.physics.newRectangleShape(0, 0, 162.5, 32.5)
	objects.block2.fixture = love.physics.newFixture(objects.block2.body, objects.block2.shape, 2)

    objects.block3 = {}
	objects.block3.body = love.physics.newBody(world, b3_randx, b3_randy, "dynamic")
	objects.block3.shape = love.physics.newRectangleShape(0, 0, 162.5, 32.5)
	objects.block3.fixture = love.physics.newFixture(objects.block3.body, objects.block3.shape, 5)

    objects.block4 = {}
    objects.block4.body = love.physics.newBody(world, b4_randx, b4_randy, "dynamic")
    objects.block4.shape = love.physics.newRectangleShape(0, 0, 162.5, 32.5)
    objects.block4.fixture = love.physics.newFixture(objects.block4.body, objects.block4.shape, 5)

    objects.block5 = {}
    objects.block5.body = love.physics.newBody(world, b5_randx, b5_randy, "dynamic")
    objects.block5.shape = love.physics.newRectangleShape(0, 0, 162.5, 32.5)
    objects.block5.fixture = love.physics.newFixture(objects.block5.body, objects.block5.shape, 5)

    objects.block6 = {}
    objects.block6.body = love.physics.newBody(world, b6_randx, b6_randy, "dynamic")
    objects.block6.shape = love.physics.newRectangleShape(0, 0, 162.5, 32.5)
    objects.block6.fixture = love.physics.newFixture(objects.block6.body, objects.block6.shape, 5)

    objects.block7 = {}
    objects.block7.body = love.physics.newBody(world, b7_randx, b7_randy, "dynamic")
    objects.block7.shape = love.physics.newRectangleShape(0, 0, 162.5, 32.5)
    objects.block7.fixture = love.physics.newFixture(objects.block7.body, objects.block7.shape, 5)

	love.graphics.setBackgroundColor(0, 0, 0)
	love.window.setMode(700, 650)
  end
  
function getMouse()
    local isDown = love.mouse.isDown(1,2)
        return x, y, isDown
    end
  
function love.update(dt)
	world:update(dt) 
    mouse.x, mouse.y = love.mouse.getPosition()
    objects.block1.x, objects.block1.y = objects.block1.body:getPosition()

	if love.keyboard.isDown("right") then
	  objects.ball.body:applyForce(400, 0)
	  
	elseif love.keyboard.isDown("left") then
	  objects.ball.body:applyForce(-400, 0)

	elseif love.keyboard.isDown("up") then
        objects.ball.body:applyForce(0, -9000)

	  objects.ball.body:setLinearVelocity(0, 0)
	end

	if love.keyboard.isDown("d") then
        objects.block1.body:applyForce(4000, 0)
        objects.block1.body:applyTorque(100000)
        if love.keyboard.isDown("w") then
            objects.block1.body:applyForce(0, -150000)
            objects.block1.body:setLinearVelocity(0, 0)
        end

        elseif love.keyboard.isDown("a") then
            objects.block1.body:applyForce(-4000, 0) 
            objects.block1.body:applyTorque(-100000)   

            if love.keyboard.isDown("w") then
                objects.block1.body:applyForce(0, -150000)
                objects.block1.body:setLinearVelocity(0, 0)
            end
  
        elseif love.keyboard.isDown("w") then
            objects.block1.body:applyForce(0, -350000)
            objects.block1.body:setLinearVelocity(0, 0)
        
        elseif love.keyboard.isDown("s") then
            objects.block1.body:applyForce(0, 350000)
            objects.block1.body:setLinearVelocity(0, 0)
        end    

        if love.keyboard.isDown("l") then
            objects.block2.body:applyForce(4000, 0)
        
        elseif love.keyboard.isDown("j") then
            objects.block2.body:applyForce(-4000, 0)
  
        elseif love.keyboard.isDown("i") then
            objects.block2.body:applyForce(0, -150000)
            objects.block2.body:setLinearVelocity(0, 0)
        end

        if objects.block1.body:getPosition() == love.mouse.getPosition() then
            if love.mouse.isDown(1) then
                objects.block1.x = objects.block1.x - 700
                objects.block1.y = objects.block1.y - 650 
        end
    end
end
  
function love.draw()
	love.graphics.setColor(0.7, 0.7, 0.7)
	love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
    love.graphics.polygon("fill", objects.lwall.body:getWorldPoints(objects.lwall.shape:getPoints()))
    love.graphics.polygon("fill", objects.rwall.body:getWorldPoints(objects.rwall.shape:getPoints()))
  

	love.graphics.setColor(0.76, 0.18, 0.05)
	love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  

	love.graphics.setColor(0.95, 0.5, 0.1)
	love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
	love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
	love.graphics.polygon("fill", objects.block3.body:getWorldPoints(objects.block1.shape:getPoints()))
	love.graphics.polygon("fill", objects.block4.body:getWorldPoints(objects.block2.shape:getPoints()))
	love.graphics.polygon("fill", objects.block5.body:getWorldPoints(objects.block1.shape:getPoints()))
	love.graphics.polygon("fill", objects.block6.body:getWorldPoints(objects.block2.shape:getPoints()))
	love.graphics.polygon("fill", objects.block7.body:getWorldPoints(objects.block1.shape:getPoints()))

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Mouse locate : " .. mouse.x..','..mouse.y)
    love.graphics.print("block 1 locate : " .. objects.block1.x..','..objects.block1.y, 200)
end