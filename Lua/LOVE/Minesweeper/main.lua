function love.load()
    love.window.setTitle("오량인의 성능 안 좋은Minesweeper")
    love.window.setMode(320, 352)
    love.graphics.setBackgroundColor(0.5, 0.5, 0.5)

    gameState = {
        board = {},
        revealed = {},
        gameOver = false,
        win = false,
        numMines = 10,
        numRevealed = 0
    }
    for i=1,10 do
        gameState.board[i] = {}
        gameState.revealed[i] = {}
        for j=1,10 do
            gameState.board[i][j] = " "
            gameState.revealed[i][j] = false
        end
    end
    for i=1,gameState.numMines do
        local row, col
        repeat
            row = love.math.random(1, 10)
            col = love.math.random(1, 10)
        until gameState.board[row][col] ~= "X"
        gameState.board[row][col] = "X"
    end
end
  
function love.mousepressed(x, y, button)
    if gameState.gameOver then 
        return 
    end
    local row, col = math.floor(y / 32) + 1, math.floor(x / 32) + 1
    if button == 1 then
        if not gameState.revealed[row][col] then
            revealCell(row, col)
            revealAdjacentCells(row, col)
        end
    elseif button == 2 then
        if not gameState.revealed[row][col] then
            gameState.board[row][col] = "F"
        end
    end
  end
  
function revealCell(row, col)
    gameState.revealed[row][col] = true
    gameState.numRevealed = gameState.numRevealed + 1
  
    if gameState.board[row][col] == "X" then
        gameState.gameOver = true
    else
        local count = 0
        for i=row-1,row+1 do
            for j=col-1,col+1 do
            if i >= 1 and i <= 10 and j >= 1 and j <= 10 and gameState.board[i][j] == "X" then
                count = count + 1
            end
        end
    end
        gameState.board[row][col] = count > 0 and count or " "
        if gameState.numRevealed == 100 - gameState.numMines then
            gameState.gameOver = true
            gameState.win = true
        end
    end
end
  
function revealAdjacentCells(row, col)
    for i=row-1,row+1 do
        for j=col-1,col+1 do
            if i >= 1 and i <= 10 and j >= 1 and j <= 10 and not gameState.revealed[i][j] and gameState.board[i][j] ~= "X" then
            revealCell(i, j)
            end
        end
    end
end

function love.draw()
    for i=1,10 do
        for j=1,10 do
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("line", (j - 1) * 32, (i - 1) * 32, 32, 32)
            if gameState.revealed[i][j] then
                if gameState.board[i][j] == "X" then
                    love.graphics.setColor(1, 0, 0)
                    love.graphics.rectangle("fill", (j - 1) * 32, (i - 1) * 32, 32, 32)
                else
                    love.graphics.setColor(0.5, 0.5, 0.5)
                    love.graphics.rectangle("fill", (j - 1) * 32, (i - 1) * 32, 32, 32)
                    if gameState.board[i][j] ~= " " then
                        love.graphics.setColor(0, 0, 0)
                        love.graphics.print(gameState.board[i][j], (j - 1) * 32 + 8, (i - 1) * 32 + 8)
                    end
                end
            else
                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", (j - 1) * 32, (i - 1) * 32, 32, 32)
                if gameState.board[i][j] == "F" then
                    love.graphics.setColor(1, 0, 0)
                    love.graphics.print("F", (j - 1) * 32 + 8, (i - 1) * 32 + 8)
                end
            end
        end
    end
    if gameState.gameOver then
        love.graphics.setColor(0, 0, 0)
        if gameState.win then
            love.graphics.print("You win!", 128, 320)
        else
            love.graphics.print("Game over", 128, 320)
        end
    end
end