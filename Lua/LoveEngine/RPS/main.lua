function love.load()
    love.window.setMode(400, 600)
    botresult = "None"
    result = "None"
    score = 0
    wincount = 0
    losecount = 0
    drawcount = 0
    Fresult = "None"
    myFont = love.graphics.newFont(40)
  end
  
function love.update(dt)
    bot = {"Rock", "Sissors", "Paper"}
    botselect = bot[math.random(#bot)]
    botresult = botselect
    function love.keypressed(key)
        if key == "z" then
            love.graphics.print(botselect, 180, 220, 0, 2)
            if botselect == "Rock" then
                result = "Draw"
                drawcount = drawcount + 1
            elseif botselect == "Sissors" then
                result = "You Win"
                score = score + 2
                wincount = wincount + 1
            else
                result = "You Lose"
                score = score - 1
                losecount = losecount + 1
            end      
        end

        if key == "x" then
            love.graphics.print(botselect, 180, 220, 0, 2)
            if botselect == "Rock" then
                result = "You Win"
                score = score + 2
                wincount = wincount + 1
            elseif botselect == "Sissors" then
                result = "You Lose"
                score = score - 1
                losecount = losecount + 1
            else
                result = "Draw"
                drawcount = drawcount + 1
            end  
        end

        if key == "c" then
            love.graphics.print(botselect, 180, 220, 0, 2)
            if botselect == "Rock" then
                result = "You Lose"
                score = score - 1
                losecount = losecount + 1
            elseif botselect == "Sissors" then
                result = "Draw"
                drawcount = drawcount + 1
            else
                result = "You Win"
                score = score + 2
                wincount = wincount + 1
            end   
        end
        if score > 30 then
            if wincount > losecount then
                Fresult = "You Win"
            elseif wincount < losecount then
                Fresult = "You Lose"
            else
                Fresult = "Draw"
            end
        
        end
     end
   
    function love.draw()
        if love.keyboard.isDown('z') then
            love.graphics.print("Rock", 160, 360, 0, 2)
        end
        if love.keyboard.isDown('x') then
            love.graphics.print("Paper", 160, 360, 0, 2)
        end
        if love.keyboard.isDown('c') then
            love.graphics.print("Scissors", 160, 360, 0, 2)
        end

        love.graphics.print("Final Results : "..Fresult, 80, 240, 0, 2)
        love.graphics.print("Bot : "..botresult, 80, 270, 0, 2)
        love.graphics.print("Score : "..score, 80, 300, 0, 2)
        love.graphics.print("Results : "..result, 80, 330, 0, 2)
        love.graphics.print("Total Wins : "..wincount, 0, 0, 0, 2)
        love.graphics.print("Total Loses : "..losecount, 0, 25, 0, 2)
        love.graphics.print("Total Draws : "..drawcount, 0, 50, 0, 2)
        love.graphics.print("Rock : Z", 5, 570, 0, 2)
        love.graphics.print("Paper : X", 130, 570, 0, 2)
        love.graphics.print("Scissors : Y", 260, 570, 0, 2)

    end
end


