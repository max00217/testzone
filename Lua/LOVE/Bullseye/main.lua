local suit = require("suit")

function love.load()
    love.window.setMode(400, 600)
    love.window.setTitle("오량인의 성능 안 좋은 Bullseye ver. Lua")
    font = love.graphics.newFont("BMDOHYEON.ttf", 13.5)
    myscore = ""
end

local slider= {value = love.math.random(0,100), min = 0, max = 100}
local num = love.math.random(0,100)
local fscore = 0
local counter = 5
local gameover = ""

function resetgame()
    counter = 5
    resetnum()
    gameover = ""
    fscore = 0
    myscore = ""
end

function resetnum()
    num = love.math.random(0,100)
    slider.value = love.math.random(0,100)
end

function love.update(dt)
    suit.layout:reset(100, 100, 20, 20)
    button = suit.Button("Hit me", suit.layout:row(100,30), 350, 200, 30 ,70, score)

    if button.hit then
        if counter ~= 0 then
            if math.abs(slider.value - num) <= 0.5 or slider.value == num then
                myscore = 200
                resetnum()
                fscore = fscore + 200
            elseif math.abs(slider.value - num) <= 5.5 then
                myscore = 150 - math.abs(slider.value - num)
                resetnum()
                fscore = fscore + myscore
            elseif math.abs(slider.value - num) > 5.5 then
                myscore = 100 - math.abs(slider.value - num)
                resetnum()
                fscore = fscore + myscore
            end
            counter = counter - 1
        end
        if counter == 0 then
            counter = counter + 0
        end
    end

    suit.layout:push(suit.layout:row())
        suit.layout:padding(3)
        suit.Slider(slider, suit.layout:col(500, 20), 270, 200, 30 ,70)
        suit.Label(("%.02f"):format(slider.value), suit.layout:col(40))

    if counter == 0 then
        gameover = "Your final Score : "..fscore.."\npress R to Restart"
        if love.keyboard.isDown("r") then
            resetgame()
        end
    end

end

function love.draw()
    suit.draw()
    love.graphics.setFont(font)
    love.graphics.print("PUT THE BULLSEYE AS CLOSE YOU CAN", 80, 200, 0, 1)
    love.graphics.print("IT WOULD NOT BE EASY", 120, 220, 0, 1)
    love.graphics.print("100", 320, 276, 0, 1)
    love.graphics.print("0", 80, 276, 0, 1)
    love.graphics.print(num, 185, 250, 0, 1.5)
    love.graphics.print(gameover, 110, 450, 0, 1.5)
    love.graphics.print("score", 10, 540, 0, 1)
    love.graphics.print(fscore, 21, 560, 0, 1)
    love.graphics.print("Last Score : "..myscore, 105, 40, 0, 1.5)
end
