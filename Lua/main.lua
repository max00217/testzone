local objects = {blocks = {}}
local world = love.physics.newWorld(0, 9.81*64, true)
local mx, my = 0, 0

function BeginContact(a, b, coll)
	if a:getUserData() == "mouse"  then
		b:setUserData("move")
	elseif b:getUserData() == "mouse" then
		a:setUserData("move")
	end
end

function EndContact(a, b, coll)
	if a:getUserData() == "mouse"  then
		b:setUserData(nil)
	elseif b:getUserData() == "mouse" then
		a:setUserData(nil)
	end
end

function PreSolve(a, b, coll)
end

function PostSolve(a, b, coll, normalimpulse, tangentimpulse)
end

world:setCallbacks(BeginContact, EndContact, PreSolve, PostSolve)



function love.load()
	love.physics.setMeter(70)

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

	local block1 = {}
	block1.body = love.physics.newBody(world, 200, 300, "dynamic")
	block1.shape = love.physics.newRectangleShape(0, 0, 162.5,32.5)
	block1.fixture = love.physics.newFixture(block1.body, block1.shape, 5)
	
	local block2 = {}
	block2.body = love.physics.newBody(world, 200, 300, "dynamic")
	block2.shape = love.physics.newRectangleShape(0, 0, 162.5,32.5)
	block2.fixture = love.physics.newFixture(block2.body, block2.shape, 5)

	local block3 = {}
	block3.body = love.physics.newBody(world, 200, 300, "dynamic")
	block3.shape = love.physics.newRectangleShape(0, 0, 162.5,32.5)
	block3.fixture = love.physics.newFixture(block3.body, block3.shape, 5)
	
	local block4 = {}
	block4.body = love.physics.newBody(world, 200, 300, "dynamic")
	block4.shape = love.physics.newRectangleShape(0, 0, 162.5,32.5)
	block4.fixture = love.physics.newFixture(block4.body, block4.shape, 5)

	local block5 = {}
	block5.body = love.physics.newBody(world, 200, 300, "dynamic")
	block5.shape = love.physics.newRectangleShape(0, 0, 162.5,32.5)
	block5.fixture = love.physics.newFixture(block5.body, block5.shape, 5)
	
	local block6 = {}
	block6.body = love.physics.newBody(world, 200, 300, "dynamic")
	block6.shape = love.physics.newRectangleShape(0, 0, 162.5,32.5)
	block6.fixture = love.physics.newFixture(block6.body, block6.shape, 5)

	local block7 = {}
	block7.body = love.physics.newBody(world, 200, 300, "dynamic")
	block7.shape = love.physics.newRectangleShape(0, 0, 162.5,32.5)
	block7.fixture = love.physics.newFixture(block7.body, block7.shape, 5)
	
	objects.blocks = {
		block1,
		block2,
		block3,
		block4,
		block5,
		block6,
		block7
	}

	objects.mousePointer = {}
	objects.mousePointer.body = love.physics.newBody(world, mx, my, "dynamic")
	objects.mousePointer.shape = love.physics.newRectangleShape(0, 0, 5, 5)
	objects.mousePointer.fixture = love.physics.newFixture(objects.mousePointer.body, objects.mousePointer.shape, 5)
	objects.mousePointer.fixture:setUserData("mouse")
	objects.mousePointer.fixture:setSensor(true)

	love.graphics.setBackgroundColor(0, 0, 0)
	love.window.setMode(700, 650)
end

function love.update(dt)
	world:update(dt)
	mx, my = love.mouse.getPosition()
	objects.mousePointer.body:setPosition(mx, my)

	for _, o in ipairs(objects.blocks) do
		if love.mouse.isDown(1) then
			if o.fixture:getUserData() == "move" then
				o.body:setPosition(mx, my)
			end
		end
	end
end

function love.mousereleased(x, y, button, istouch, presses)
	for _, o in ipairs(objects.blocks) do
		o.fixture:setUserData(nil)
		o.body:applyForce(0,1)
	end
end

function love.draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
	love.graphics.polygon("fill", objects.lwall.body:getWorldPoints(objects.lwall.shape:getPoints()))
	love.graphics.polygon("fill", objects.rwall.body:getWorldPoints(objects.rwall.shape:getPoints()))

	love.graphics.setColor(0.95, 0.5, 0.1)

	for _, o in ipairs(objects.blocks) do
		love.graphics.polygon("fill", o.body:getWorldPoints(o.shape:getPoints()))
	end

	love.graphics.polygon("fill", objects.mousePointer.body:getWorldPoints(objects.mousePointer.shape:getPoints()))
end