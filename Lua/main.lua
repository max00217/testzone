-- function love.load()
-- 	-- Set initial player position
-- 	player = {
-- 	  x = love.graphics.getWidth() / 2 - 25, -- subtract half of player width
-- 	  y = love.graphics.getHeight() / 2 - 25, -- subtract half of player height
-- 	  width = 50,
-- 	  height = 50,
-- 	  speed = 200
-- 	}
	
-- 	-- Set initial bullet position and size
-- 	bullet = {
-- 	  x = 0,
-- 	  y = 0,
-- 	  radius = 5,
-- 	  speed = 500,
-- 	  active = false -- bullet is inactive until fired
-- 	}
--   end
  
--   function love.update(dt)
-- 	-- Move player with WASD keys
-- 	if love.keyboard.isDown("w") then
-- 	  player.y = player.y - player.speed * dt
-- 	elseif love.keyboard.isDown("s") then
-- 	  player.y = player.y + player.speed * dt
-- 	end
-- 	if love.keyboard.isDown("a") then
-- 	  player.x = player.x - player.speed * dt
-- 	elseif love.keyboard.isDown("d") then
-- 	  player.x = player.x + player.speed * dt
-- 	end
	
-- 	-- Fire bullet when mouse is clicked
-- 	if love.mouse.isDown(1) then
-- 	  -- Set bullet position to player position
-- 	  bullet.x = player.x + player.width / 2 -- add half of player width to center bullet
-- 	  bullet.y = player.y + player.height / 2 -- add half of player height to center bullet
	  
-- 	  -- Calculate direction to mouse cursor
-- 	  local mouseX, mouseY = love.mouse.getPosition()
-- 	  local dx = mouseX - bullet.x
-- 	  local dy = mouseY - bullet.y
-- 	  local dist = math.sqrt(dx * dx + dy * dy)
	  
-- 	  -- Normalize direction and set bullet velocity
-- 	  bullet.vx = bullet.speed * dx / dist
-- 	  bullet.vy = bullet.speed * dy / dist
	  
-- 	  -- Set bullet as active
-- 	  bullet.active = true
-- 	end
	
-- 	-- Move bullet when active
-- 	if bullet.active then
-- 	  bullet.x = bullet.x + bullet.vx * dt
-- 	  bullet.y = bullet.y + bullet.vy * dt
	  
-- 	  -- Deactivate bullet when it goes off screen
-- 	  if bullet.x < -bullet.radius or bullet.x > love.graphics.getWidth() + bullet.radius
-- 	  or bullet.y < -bullet.radius or bullet.y > love.graphics.getHeight() + bullet.radius then
-- 		bullet.active = false
-- 	  end
-- 	end
--   end
  
--   function love.draw()
-- 	-- Draw player rectangle
-- 	love.graphics.setColor(1, 1, 1)
-- 	love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
	
-- 	-- Draw bullet circle when active
-- 	if bullet.active then
-- 	  love.graphics.setColor(1, 0, 0)
-- 	  love.graphics.circle("fill", bullet.x, bullet.y, bullet.radius)
-- 	end
--   end
print("No code in main.lua")