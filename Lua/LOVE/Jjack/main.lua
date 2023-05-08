local suit = require("suit")

function love.load()
    font = love.graphics.newFont("BMDOHYEON.ttf", 40)
    love.graphics.setFont(font)
	love.window.setMode(500, 300)
    love.window.setTitle("오량인의 성능 안 좋은 2-4반 전용 자리 선출기")
    love.graphics.setBackgroundColor(0.2, 0.5, 0.5)
    class = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 35}
    n1 = ""
    n2 = ""
end

function love.update(dt)
    suit.layout:reset(100,100, 20,20)

    function table.indexOf(t, value)
        for i, v in ipairs(t) do
            if v == value then
                return i
            end
        end
        return nil
    end

    function table.removeByValue(t, value)
        index = table.indexOf(t, value)
        if index then
            table.remove(t, index)
        end
    end

    if love.keyboard.isDown("return") then
        n1 = class[love.math.random(#class)]
        if n1 ~= nil then
            table.removeByValue(class, n1)
        else
            n1 = "nil"
        end
        n2 = class[love.math.random(#class)]
        if n2 ~= nil then
            table.removeByValue(class, n2)
        else
            n2 = "nil"
        end
    end

    button = suit.Button("Press", suit.layout:row(100,30), 250, 295, 30, 70)

    if button.hit then
        n1 = class[love.math.random(#class)]
        if n1 ~= nil then
            table.removeByValue(class, n1)
        else
            n1 = "nil"
        end
        n2 = class[love.math.random(#class)]
        if n2 ~= nil then
            table.removeByValue(class, n2)
        else
            n2 = "nil"
        end
    end
end


function love.draw()
    suit.draw()
    love.graphics.print(n1, 120, 120, 0, 1)
    love.graphics.print(n2, 340, 120, 0, 1)
end