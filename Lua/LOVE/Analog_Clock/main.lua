function love.load()
    love.window.setTitle("오량인의 성능 안 좋은 아날로그 시계")
    love.window.setMode(450, 450)
    love.graphics.setLineWidth(3)
    font = love.graphics.newFont("BMDOHYEON.ttf", 20)
    love.graphics.setFont(font)
end

function love.draw()
    local time = os.date("*t")

    local hour_angle = (time.hour % 12) / 12 * 360
    local minute_angle = time.min / 60 * 360
    local second_angle = time.sec / 60 * 360

    local center_x = love.graphics.getWidth() / 2
    local center_y = love.graphics.getHeight() / 2
    local hour_x = center_x + 80 * math.cos(math.rad(hour_angle - 90))
    local hour_y = center_y + 80 * math.sin(math.rad(hour_angle - 90))
    local minute_x = center_x + 120 * math.cos(math.rad(minute_angle - 90))
    local minute_y = center_y + 120 * math.sin(math.rad(minute_angle - 90))
    local second_x = center_x + 140 * math.cos(math.rad(second_angle - 90))
    local second_y = center_y + 140 * math.sin(math.rad(second_angle - 90))

    love.graphics.line(center_x, center_y, hour_x, hour_y)
    love.graphics.line(center_x, center_y, minute_x, minute_y)
    love.graphics.setColor(255, 0, 0)
    love.graphics.line(center_x, center_y, second_x, second_y)
    love.graphics.setColor(255, 255, 255)

    local radius = 200
    for i = 1, 12 do
        local angle = (i / 12) * 360
        local x = center_x + radius * math.cos(math.rad(angle - 90))
        local y = center_y + radius * math.sin(math.rad(angle - 90))
        love.graphics.print(i, x-10, y-10)
    end

    love.graphics.print(time.hour .. ":" .. time.min .. ":" .. time.sec, 10, 10)
end