-- define the grid size
local gridWidth, gridHeight = 200, 200

-- define the cell size
local cellSize = 4.5
love.window.setMode(900, 900)

-- create the initial grid
local grid = {}
for i = 1, gridHeight do
  grid[i] = {}
  for j = 1, gridWidth do
    grid[i][j] = love.math.random(0, 1)
  end
end

-- update the grid based on the Game of Life rules
function updateGrid()
  local newGrid = {}
  for i = 1, gridHeight do
    newGrid[i] = {}
    for j = 1, gridWidth do
      local neighbors = countNeighbors(i, j)
      if grid[i][j] == 1 and (neighbors < 2 or neighbors > 3) then
        newGrid[i][j] = 0
      elseif grid[i][j] == 0 and neighbors == 3 then
        newGrid[i][j] = 1
      else
        newGrid[i][j] = grid[i][j]
      end
    end
  end
  grid = newGrid
end

-- count the number of live neighbors for a cell
function countNeighbors(row, col)
  local count = 0
  for i = -1, 1 do
    for j = -1, 1 do
      if not (i == 0 and j == 0) then
        local x = col + j
        local y = row + i
        if x > 0 and x <= gridWidth and y > 0 and y <= gridHeight then
          count = count + grid[y][x]
        end
      end
    end
  end
  return count
end

-- draw the grid
function drawGrid()
  for i = 1, gridHeight do
    for j = 1, gridWidth do
      if grid[i][j] == 1 then
        love.graphics.setColor(0.2, 0.7, 0.7)
      else
        love.graphics.setColor(0, 0, 0)
      end
      love.graphics.rectangle('fill', (j-1)*cellSize, (i-1)*cellSize, cellSize, cellSize)
    end
  end
end

-- run the simulation
function love.update(dt)
  updateGrid()
end

-- draw the grid
function love.draw()
  drawGrid()
end
