x, y, r = 200, 200, 30
vx, vy = 10.0, 10.0
gravity = 0
speed_scale = 50
jump_speed = -15

local q = love.math.random()
local w = love.math.random()
local e = love.math.random()

function love.load()
    love.window.setMode(1920, 1060)
end

function love.update(dt)
    if love.keyboard.isDown("space") then
        vy = jump_speed
    end

    if x < r or x > love.graphics.getWidth() - 290 then
        vx = vx * -1
        q = math.random()
        w = math.random()
        e = math.random()
    end

    if y > love.graphics.getHeight() - 150 then
        vy = jump_speed
        q = math.random()
        w = math.random()
        e = math.random()

    elseif y < r then
        vy = -jump_speed / 2
        q = math.random()
        w = math.random()
        e = math.random()
    end

    x = x + vx * dt * speed_scale
    y = y + vy * dt * speed_scale
    vy = vy + gravity * dt
end

function love.draw()
    image = love.graphics.newImage("ACT.png")
    love.graphics.setColor(q, w, e)
    love.graphics.draw(image, x, y, 0, 2.5)
end

