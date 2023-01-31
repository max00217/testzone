require 'simple-slider'

function love.load()
    music = love.audio.newSource('music.ogg')
    music:play()

    -- create a new slider
    volumeSlider = newSlider(400, 300, 300, 0.5, 0, 1, function (v) love.audio.setVolume(v) end)
end

function love.update(dt)
    -- update slider, must be called every frame
    volumeSlider:update()
end

function love.draw()
    love.graphics.setBackgroundColor(249, 205, 173)

    love.graphics.setLineWidth(4)
    love.graphics.setColor(254, 67, 101)

    -- draw slider, set color and line style before calling
    volumeSlider:draw()
end