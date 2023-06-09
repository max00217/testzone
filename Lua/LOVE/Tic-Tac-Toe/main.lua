local gridSize = 3
local cellSize = 190
local grid = {}
local clicktime = 0

function love.load()
    -- Create the grid
    for row = 1, gridSize do
        grid[row] = {}
        for col = 1, gridSize do
            grid[row][col] = 0
        end
    end
end

function love.update(dt)
        if
        grid[1][1] == grid[1][2] == grid[1][3] == 1 or
        grid[2][1] == grid[2][2] == grid[2][3] == 1 or
        grid[3][1] == grid[3][2] == grid[3][3] == 1 or
        grid[1][1] == grid[2][1] == grid[3][1] == 1 or
        grid[2][1] == grid[2][2] == grid[3][2] == 1 or
        grid[3][1] == grid[3][2] == grid[3][3] == 1 or
        grid[1][1] == grid[2][2] == grid[3][3] == 1 or
        grid[1][3] == grid[2][2] == grid[3][1] == 1 then
            love.graphics.print("O Wins", 50, 50)
        elseif
        grid[1][1] == grid[1][2] == grid[1][3] == 2 or
        grid[2][1] == grid[2][2] == grid[2][3] == 2 or
        grid[3][1] == grid[3][2] == grid[3][3] == 2 or
        grid[1][1] == grid[2][1] == grid[3][1] == 2 or
        grid[2][1] == grid[2][2] == grid[3][2] == 2 or
        grid[3][1] == grid[3][2] == grid[3][3] == 2 or
        grid[1][1] == grid[2][2] == grid[3][3] == 2 or
        grid[1][3] == grid[2][2] == grid[3][1] == 2 then
            love.graphics.print("X Wins", 50, 50)
        end
end

function love.draw()
    for row = 1, gridSize do
        for col = 1, gridSize do
            local x = (col - 1) * cellSize
            local y = (row - 1) * cellSize
            love.graphics.rectangle('line', x, y, cellSize, cellSize)

            if grid[row][col] == 1 then                
                love.graphics.print("O", x + cellSize / 2, y + cellSize / 2)
            elseif grid[row][col] == 2 then
                love.graphics.print("X", x + cellSize / 2, y + cellSize / 2)
            end
        end
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then 
        local clickedColumn = math.floor(x / cellSize) + 1
        local clickedRow = math.floor(y / cellSize) + 1

        if grid[clickedRow][clickedColumn] == 0 then 
            clicktime = clicktime + 1
            if clicktime % 2 == 1 then
                grid[clickedRow][clickedColumn] = 1
            else
                grid[clickedRow][clickedColumn] = 2
            end
        end
    end
end