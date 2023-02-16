function love.load()
	-- Set up the game variables
	ball = { x = 320, y = 240, dx = 200, dy = 200, radius = 10 }
	paddles = {
	  { x = 20, y = 200, dy = 0, width = 10, height = 80 }, -- player 1
	  { x = 610, y = 200, dy = 0, width = 10, height = 80 }, -- player 2
	  { x = 320, y = 20, dy = 0, width = 80, height = 10 }, -- player 3
	  { x = 320, y = 450, dy = 0, width = 80, height = 10 }, -- player 4
	}
	scores = { 0, 0, 0, 0 }
  end
  
  function love.update(dt)
	-- Update the ball position
	ball.x = ball.x + ball.dx * dt
	ball.y = ball.y + ball.dy * dt
  
	-- Check for ball collision with the walls and paddles
	if ball.y < ball.radius or ball.y > love.graphics.getHeight() - ball.radius then
	  ball.dy = -ball.dy
	end
	for i, paddle in ipairs(paddles) do
	  if checkCollision(ball.x, ball.y, ball.radius, paddle.x, paddle.y, paddle.width, paddle.height) then
		ball.dx = -ball.dx
		ball.dy = ball.dy + paddle.dy / 2
	  end
	end
  
	-- Update the paddle positions
	for i, paddle in ipairs(paddles) do
	  paddle.y = paddle.y + paddle.dy * dt
	  if paddle.y < 0 then
		paddle.y = 0
	  elseif paddle.y + paddle.height > love.graphics.getHeight() then
		paddle.y = love.graphics.getHeight() - paddle.height
	  end
	end
  
	-- Check for paddle collision with the walls
	for i, paddle in ipairs(paddles) do
	  if paddle.y < 0 then
		paddle.y = 0
	  elseif paddle.y + paddle.height > love.graphics.getHeight() then
		paddle.y = love.graphics.getHeight() - paddle.height
	  end
	end
  
	-- Check for ball going out of bounds
	if ball.x < -ball.radius then
	  scores[2] = scores[2] + 1
	  reset()
	elseif ball.x > love.graphics.getWidth() + ball.radius then
	  scores[1] = scores[1] + 1
	  reset()
	end
  end
  
  function love.draw()
	-- Draw the ball and paddles
	love.graphics.circle("fill", ball.x, ball.y, ball.radius)
	for i, paddle in ipairs(paddles) do
	  love.graphics.rectangle("fill", paddle.x, paddle.y, paddle.width, paddle.height)
	end
  
	-- Draw the scores
	love.graphics.printf("Player 1: " .. scores[1], 0, 10, 150, "center")
	love.graphics.printf("Player 2: " .. scores[2], love.graphics.getWidth() - 150, 10, 150, "center")
	love.graphics.printf("Player 3: " .. scores[3], 0, love.graphics.getHeight() - 30, 150, "center")
	love.graphics.printf("Player 4: " .. scores[4], love.graphics)
end
  function love.keypressed(key)
		-- Player 1 controls
	if key == "w" then
		paddles[1].dy = -200
	elseif key == "s" then
		paddles[1].dy = 200
	end
		
		-- Player 2 controls
	if key == "up" then
		paddles[2].dy = -200
	elseif key == "down" then
		paddles[2].dy = 200
	end
		
		-- Player 3 controls
	if key == "a" then
		paddles[3].dy = -200
	elseif key == "d" then
		paddles[3].dy = 200
	end
		
		-- Player 4 controls
	if key == "left" then
		paddles[4].dy = -200
	elseif key == "right" then
		paddles[4].dy = 200
		end
	end	
	function love.keyreleased(key)
		-- Player 1 controls
		if key == "w" or key == "s" then
		paddles[1].dy = 0
		end
		
		-- Player 2 controls
		if key == "up" or key == "down" then
		paddles[2].dy = 0
		end
		
		-- Player 3 controls
		if key == "a" or key == "d" then
		paddles[3].dy = 0
		end
		
		-- Player 4 controls
		if key == "left" or key == "right" then
		paddles[4].dy = 0
		end
		end
		
	function reset()
		-- Reset the ball and paddle positions
		ball.x = love.graphics.getWidth() / 2
		ball.y = love.graphics.getHeight() / 2
		ball.dx = 200
		ball.dy = 200
		for i, paddle in ipairs(paddles) do
		paddle.y = love.graphics.getHeight() / 2 - paddle.height / 2
		paddle.dy = 0
		end
		end
		
	function checkCollision(x1, y1, r1, x2, y2, w2, h2)
		-- Check for collision between a circle and a rectangle
		local dx = x1 - math.max(x2, math.min(x1, x2 + w2))
		local dy = y1 - math.max(y2, math.min(y1, y2 + h2))
		return (dx * dx + dy * dy) < (r1 * r1)
		end