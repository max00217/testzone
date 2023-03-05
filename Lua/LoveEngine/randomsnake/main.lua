function love.load()
    -- set initial position and size of the snake
    snake = {
        {x = 350, y = 350},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 280},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
        {x = 200, y = 220},
        {x = 200, y = 240},
        {x = 200, y = 260},
    }

    -- set initial direction of the snake
    direction = "up"

    -- set size of the window
    love.window.setMode(700, 700)
end

function love.update(dt)
    -- randomly choose a new direction for the snake
    local new_direction = direction
    while new_direction == direction do
        local directions = {"up", "down", "left", "right"}
        new_direction = directions[love.math.random(1, #directions)]
    end
    direction = new_direction

    -- move the snake in the chosen direction
    if direction == "up" then
        table.insert(snake, 1, {x = snake[1].x, y = snake[1].y - 5})
    elseif direction == "down" then
        table.insert(snake, 1, {x = snake[1].x, y = snake[1].y + 5})
    elseif direction == "left" then
        table.insert(snake, 1, {x = snake[1].x - 5, y = snake[1].y})
    elseif direction == "right" then
        table.insert(snake, 1, {x = snake[1].x + 5, y = snake[1].y})
    end

    -- remove the tail of the snake to keep its length constant
    table.remove(snake)
end

function love.draw()
    -- draw the snake
    for i, segment in ipairs(snake) do
        love.graphics.rectangle("fill", segment.x, segment.y, 5, 5)
    end
end
