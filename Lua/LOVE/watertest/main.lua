package.path = package.path .. ";C:\\Users\\makpu\\Downloads\\proj\\project\\Lua\\modules\\water-waves-love2d\\src\\?.lua"

local Water = require "water"

function love.load(arg)
  local x, y, width, height, color = 100, 150, 500, 400, { 0, 130, 200, 255 }
  water = Water(x, y, width, height, color)
end

function love.update(dt)
  water:update(dt)
end

function love.mousemoved(x, y, dx, dy)
  local weight = 5
  local speed  = weight * dy
  if water:isTouched(x, y, dx, dy) then
    water:splash(x, speed)
  end
end

function love.draw()
  water:draw()
end