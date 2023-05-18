local suit = require("suit")

function love.load()
    love.window.setTitle("오량인의 성능 안 좋은 Minesweeper")
    love.window.setMode(320, 352)
    love.graphics.setBackgroundColor(0.5, 0.5, 0.5)

    difficulty = 1.5
    gameState = {
        board = {},
        revealed = {},
        gameOver = false,
        win = false,
        numMines = 10 * difficulty * 1.5,
        numRevealed = 0,
    }
    cellnum, cellsize, txtsize = 10, 32, 1
    
    cellnum = cellnum * difficulty
    cellsize = cellsize / difficulty
    txtsize = txtsize / difficulty


    for i=1, cellnum do
        gameState.board[i] = {}
        gameState.revealed[i] = {}
        for j=1,cellnum do
            gameState.board[i][j] = " "
            gameState.revealed[i][j] = false
        end
    end
    for i=1,gameState.numMines do
        local row, col
        repeat
            row = love.math.random(1, cellnum)
            col = love.math.random(1, cellnum)
        until gameState.board[row][col] ~= "X"
        gameState.board[row][col] = "X"
    end
end
function love.mousepressed(x, y, button)
    if gameState.gameOver then
        return
    end
    local row, col = math.floor(y / cellsize) + 1, math.floor(x / cellsize) + 1
    if button == 1 then
        if gameState.board[row][col] ~= "F" or gameState.board[row][col] == "XF" or gameState.board[row][col] ~= "F" then
            if not gameState.revealed[row][col] then
                revealCell(row, col)
                revealAdjacentCells(row, col)
            end
        end
    elseif button == 2 then
        if not gameState.revealed[row][col] then
            if gameState.board[row][col] == "X" then
                gameState.board[row][col] = "XF"
            elseif gameState.board[row][col] == "XF" then
                gameState.board[row][col] = "X"
            elseif gameState.board[row][col] == "F" then
                gameState.board[row][col] = " "
            else
                gameState.board[row][col] = "F"
            end
        end
    end
end

function revealAdjacentCells(row, col)
    for i=row-1,row+1 do
        for j=col-1,col+1 do
            if i >= 1 and i <= cellnum and j >= 1 and j <= cellnum and not gameState.revealed[i][j] and gameState.board[i][j] ~= "X" then
                revealCell(i, j)
            end
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
                if i >= 1 and i <= cellnum and j >= 1 and j <= cellnum and (gameState.board[i][j] == "X" or gameState.board[i][j] == "XF") then
                    count = count + 1
                end
            end
        end
        gameState.board[row][col] = count > 0 and count or " "
        if gameState.numRevealed == cellnum^2 - gameState.numMines then
            gameState.gameOver = true
            gameState.win = true
        end
    end
end

function revealAdjacentCells(row, col)
    for i=row-1,row+1 do
        for j=col-1,col+1 do
            if i >= 1 and i <= cellnum and j >= 1 and j <= cellnum and not gameState.revealed[i][j] and 
            gameState.board[i][j] ~= "F" and 
            gameState.board[i][j] ~= "X" and
            gameState.board[i][j] ~= "XF" then
            revealCell(i, j)
            end
        end
    end
end

function love.draw()
    for i=1,cellnum do
        for j=1,cellnum do
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("line", (j - 1) * cellsize, (i - 1) * cellsize, cellsize, cellsize, 0, txtsize)
            if gameState.revealed[i][j] then
                if gameState.board[i][j] == "X" then
                    love.graphics.setColor(1, 0, 0)
                    love.graphics.rectangle("fill", (j - 1) * cellsize, (i - 1) * cellsize, cellsize, cellsize, 0, txtsize)
                else
                    love.graphics.setColor(0.5, 0.5, 0.5)
                    love.graphics.rectangle("fill", (j - 1) * cellsize, (i - 1) * cellsize, cellsize, cellsize, 0, txtsize)
                    if gameState.board[i][j] ~= " " then
                        love.graphics.setColor(0, 0, 0)
                        love.graphics.print(gameState.board[i][j], (j - 1) * cellsize + 8, (i - 1) * cellsize + 8, 0, txtsize)
                    end
                end
            else
                love.graphics.setColor(0.3, 0.3, 0.3)
                love.graphics.rectangle("fill", (j - 1) * cellsize, (i - 1) * cellsize, cellsize, cellsize, 0, txtsize)
                if gameState.board[i][j] == "F" or gameState.board[i][j] == "XF" then
                    love.graphics.setColor(1, 0, 0)
                    love.graphics.print("F", (j - 1) * cellsize + 8, (i - 1) * cellsize + 8, 0, txtsize)
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
            for i=1,cellnum do
                for j=1,cellnum do
                    if gameState.board[i][j] == "X" then
                        love.graphics.setColor(1, 0, 0)
                        love.graphics.rectangle("fill", (j - 1) * cellsize, (i - 1) * cellsize, cellsize, cellsize, 0)
                    end
                end
            end
        end
    end
    suit.draw()
end