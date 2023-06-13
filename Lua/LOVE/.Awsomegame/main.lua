-- main.lua
local drawGround
local animTime = 0
local animationSpeed = 13

function love.load()
    love.window.setMode(960, 540)

    player = {
        x = 480,
        y = 355,
        speed = 200,
        scale = 2,
        img = {
            default = love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber.png"),
            left = love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobberL.png")
        },
        animations = {
            idle = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4.png")
            },
            idleleft = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_idle/idle4L.png")
            },
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
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump3.png"),
            },
            jumpLeft = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_jump/jump3L.png"),
            },
            attack1 = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack5.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack6.png")
            },
            attack1Left = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack5L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_attack1/attack6L.png")
            },

        },
        anim = 1,
        isMoving = false,
        isJumping = false,
        isAttack1 = false,
        isAttack2 = false,
        isAttack3 = false,
        direction = "right",
        jumpSpeed = 400,
        jumpHeight = 200,
        jumpAnimSpeed = 10,
        isJumpAnimPlayed = false
    }

    drawGround = function()
        love.graphics.setColor(1, 1, 1)
        love.graphics.line(0, 450, 960, 450)
    end
end

local gravity = 1300

function love.update(dt)
    animTime = animTime + animationSpeed * dt
    local moveX = 0

    if love.keyboard.isDown("a") then
        moveX = -1
        player.direction = "left"
    elseif love.keyboard.isDown("d") then
        moveX = 1
        player.direction = "right"
    end

    if love.keyboard.isDown("w") and not player.isJumping then
        player.isJumping = true
        player.anim = 1
        player.jumpStartY = player.y
        player.jumpSpeed = 400
        player.isJumpAnimPlayed = false
    end

    if love.mouse.isDown(1) then
        player.isAttack1 = true
    end
    

    if not player.isMoving and not player.isJumping then
        if player.direction == "left" then
            player.anim = player.anim % #player.animations.idleleft + 1
        else
            player.anim = player.anim % #player.animations.idle + 1
        end
        player.anim = player.anim + 0.001 * dt * 0.01
    end

    if moveX ~= 0 then
        player.x = player.x + moveX * player.speed * dt
        player.isMoving = true
        player.anim = ((player.anim + 10 * dt) - 1) % 6 + 1
    else
        player.isMoving = false
    end

    if player.isJumping then
        local jumpDistance = player.jumpSpeed * dt
        player.y = player.y - jumpDistance
        player.jumpSpeed = player.jumpSpeed - gravity * dt -- Apply gravity to the jump speed

        if not player.isJumpAnimPlayed then
            player.anim = player.anim + player.jumpAnimSpeed * dt

            if player.direction == "left" then
                player.anim = player.anim % #player.animations.jumpLeft + 1
            else
                player.anim = player.anim % #player.animations.jump + 1
            end

            if player.anim == 1 then
                player.isJumpAnimPlayed = true
            end
        end

        if player.y >= player.jumpStartY then
            player.y = player.jumpStartY
            player.isJumping = false
            player.anim = 1
        end
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        player.isAttack1 = true
    end
end

function love.draw()
    local animDirection = player.direction
    local img, x, y, scaleX, scaleY = nil, player.x, player.y, player.scale, player.scale

    if player.isJumping then
        -- Jump animation
        if animDirection == "left" then
            img = player.animations.jumpLeft[math.floor(player.anim)]
        else
            img = player.animations.jump[math.floor(player.anim)]
        end
    elseif not player.isMoving then
        -- Idle animation
        if animDirection == "left" then
            img = player.animations.idleleft[math.floor(player.anim)]
        else
            img = player.animations.idle[math.floor(player.anim)]
        end
        if math.floor(animTime) > #player.animations.idle then
            animTime = 1
        end
    else
        -- Walking animation
        img = player.animations[animDirection][math.floor(player.anim)]
    end
    
    if player.isAttack1 then
        if player.direction == "left" then
            img = player.animations.attack1Left[math.floor(animTime)]
        else
            img = player.animations.attack1[math.floor(animTime)]
        end
        if math.floor(animTime) > #player.animations.attack1 then
            animTime = 1
            player.isAttack1 = false
        end
    end
    

    if img then
        -- Adjust y coordinate for the larger size
        -- y = y - (img:getHeight() * (player.scale - 1))

        -- Draw the character
        love.graphics.draw(img, x, y, 0, scaleX, scaleY)
    end

    -- Draw the ground line 
    drawGround()
end