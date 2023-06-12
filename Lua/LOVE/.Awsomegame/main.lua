-- main.lua
local drawGround

function love.load()
    love.window.setMode(960, 540)

    player = {
        x = 480,
        y = 400,
        speed = 200,
        scale = 2,
        img = {
            default = love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber.png"),
            left = love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobberL.png")
        },
        animations = {
            right = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk5.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk6.png")
            },
            left = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk5L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_walk/walk6L.png")
            },
            jump = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump5.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump6.png")
            },
            jumpLeft = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump5L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump6L.png")
            }
        },
        anim = 1,
        isMoving = false,
        isJumping = false,
        direction = "right",
        jumpSpeed = 400,
        jumpHeight = 200
    }

    drawGround = function()
        love.graphics.setColor(1, 1, 1)
        love.graphics.line(0, 450, 960, 450)
    end
end

local gravity = 1300

function love.update(dt)
    local moveX = 0

    if love.keyboard.isDown("a") then
        moveX = -1
        player.direction = "left"
    elseif love.keyboard.isDown("d") then
        moveX = 1
        player.direction = "right"
    end

    if moveX ~= 0 then
        player.x = player.x + moveX * player.speed * dt
        player.isMoving = true
        player.anim = ((player.anim + 10 * dt) - 1) % 6 + 1
    else
        player.isMoving = false
    end

    if love.keyboard.isDown("w") and not player.isJumping then
        player.isJumping = true
        player.anim = 1
        player.jumpStartY = player.y -- Store the initial y position for jumping
        player.jumpSpeed = 400 -- Reset the jump speed for the next jump
    end

    if player.isJumping then
        local jumpDistance = player.jumpSpeed * dt
        player.y = player.y - jumpDistance
        player.jumpSpeed = player.jumpSpeed - gravity * dt -- Apply gravity to the jump speed
        local jumpAnimSpeed = 1  -- Adjust this value to change the speed of the jump animation
        player.anim = player.anim + jumpAnimSpeed * dt

        if player.direction == "left" then
            player.anim = player.anim % #player.animations.jumpLeft + 1
        else
            player.anim = player.anim % #player.animations.jump + 1
        end

        if player.y >= player.jumpStartY then
            player.y = player.jumpStartY
            player.isJumping = false
            player.anim = 1
        end
    end
end

function love.draw()
    local animDirection = player.direction
    local img, x, y, scaleX, scaleY = nil, player.x, player.y, player.scale, player.scale

    if player.isJumping then
        if animDirection == "left" then
            img = player.animations.jumpLeft[math.floor(player.anim)]
        else
            img = player.animations.jump[math.floor(player.anim)]
        end
    elseif not player.isMoving then
        if animDirection == "left" then
            img = player.img.left
        else
            img = player.img.default
        end
    else
        img = player.animations[animDirection][math.floor(player.anim)]
    end

    -- Adjust y coordinate for the larger size
    y = y - (img:getHeight() * (player.scale - 1))

    -- Draw the character
    love.graphics.draw(img, x, y, 0, scaleX, scaleY)

    -- Draw the ground line 
    drawGround()
end

