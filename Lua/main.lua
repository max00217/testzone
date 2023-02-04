-- Initialize some variables
local ball_x = 300
local ball_y = 300
local ball_speed_x = math.random(2, 5)
local ball_speed_y = math.random(2, 5)

local player_1_y = 250
local player_2_y = 250
local player_height = 50
local player_width = 10

function love.load()
  -- Set up the window
  love.window.setMode(600, 600)
end

function love.update(dt)
  -- Move the ball
  ball_x = ball_x + ball_speed_x
  ball_y = ball_y + ball_speed_y

  -- Bounce the ball if it hits the top or bottom of the window
  if ball_y <= 0 or ball_y >= love.graphics.getHeight() then
    ball_speed_y = -ball_speed_y
  end

  -- Check for collisions with the players
  if ball_x <= player_width and
    ball_y >= player_1_y and
    ball_y <= player_1_y + player_height then
    ball_speed_x = -ball_speed_x
  end
  if ball_x >= love.graphics.getWidth() - player_width and
    ball_y >= player_2_y and
    ball_y <= player_2_y + player_height then
    ball_speed_x = -ball_speed_x
  end

  -- Move player 1 with the up and down arrow keys
  if love.keyboard.isDown("up") then
    player_1_y = player_1_y - 5
  end
  if love.keyboard.isDown("down") then
    player_1_y = player_1_y + 5
  end

  -- Move player 2 with the w and s keys
  if love.keyboard.isDown("w") then
    player_2_y = player_2_y - 5
  end
  if love.keyboard.isDown("s") then
    player_2_y = player_2_y + 5
  end
end

function love.draw()
  -- Draw the ball
  love.graphics.rectangle("fill", ball_x, ball_y, 10, 10)

  -- Draw the players
  love.graphics.rectangle("fill", 0, player_1_y, player_width, player_height)
  love.graphics.rectangle("fill", love.graphics.getWidth() - player_width, player_2_y, player_width, player_height)
end