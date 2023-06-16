-- main.lua
local drawGround
local animTime = 0
local dodgeTime = 0
local animationSpeed = 13
local animationSpeedfordodge = 7
local dodgeDuration = 0.3
local dTimer = 0

function love.load()
    love.window.setMode(960, 540)
    background = love.graphics.newImage("Assets/BG/BG.jpg")
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()

    local scaleWidth = screenWidth / background:getWidth()
    local scaleHeight = screenHeight / background:getHeight()
    local scale = math.min(scaleWidth, scaleHeight)
    local newWidth = background:getWidth() * scale
    local newHeight = background:getHeight() * scale
    local x = (screenWidth - newWidth) / 2
    local y = (screenHeight - newHeight) / 2
    BG = {
        x = x,
        y = y,
        width = newWidth,
        height = newHeight
    }
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
            run = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run3.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run4.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run5.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run6.png")
            },
            runLeft = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run3L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run4L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run5L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_run/run6L.png")
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
            -- attack2{

            -- },
            -- attack2Left{

            -- },
            -- attack3{

            -- },
            -- attack3Left{

            -- },
            dodge = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_dodge/dodge1.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_dodge/dodge2.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_dodge/dodge3.png")
            },
            dodgeLeft = {
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_dodge/dodge1L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_dodge/dodge2L.png"),
                love.graphics.newImage("Assets/Main3/GraveRobber/GraveRobber_dodge/dodge3L.png")
            },
        },
        anim = 1,
        isMoving = false,
        isJumping = false,
        isRunning = false,
        isAttack1 = false,
        isAttack2 = false,
        isAttack3 = false,
        isDodge = false,
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
    dodgeTime = dodgeTime + animationSpeedfordodge * dt
    local moveX = 0
    if player.isDodge == false then
        player.speed = 200
    end

    if love.keyboard.isDown("a") and not player.isDodge then
        moveX = -1
        player.isMoving  = true
        player.direction = "left"
        if love.keyboard.isDown("lshift") and not player.isDodge then
            moveX = -2.2
            player.isRunning = true
        else
            player.isRunning = false
        end
    elseif love.keyboard.isDown("d") and not player.isDodge then
        moveX = 1
        player.isMoving  = true
        player.direction = "right"
        if love.keyboard.isDown("lshift") and not player.isDodge then
            moveX = 2.2
            player.isRunning = true
        else
            player.isRunning = false
        end
    end

    if love.keyboard.isDown("w") and not player.isJumping then
        player.isJumping = true
        player.anim = 1
        player.jumpStartY = player.y
        player.jumpSpeed = 400
        player.isJumpAnimPlayed = false
    end

    if love.keyboard.isDown("space") and not player.isJumping and not player.isAttack1 and not player.isDodge and not player.isDodgeCooldown then
        player.isDodge = true
        player.isMove = false
        player.isJumping = false
        player.isRunning = false
        if player.direction == "left" then
            player.anim = player.anim % #player.animations.dodgeLeft + 1
            moveX = -4
        else
            player.anim = player.anim % #player.animations.dodge + 1
            moveX = 4
        end
        player.isDodgeCooldown = true  -- Set the dodge cooldown flag
    end
    
    if not love.keyboard.isDown("space") then
        player.isDodgeCooldown = false  -- Reset the dodge cooldown flag when the space button is released
        player.isDodge = false
        player.speed = 200
    end
    
    if not player.isMoving and not player.isDodge or (player.isMoving and player.isJumping) then
        if love.mouse.isDown(1) and not player.isAttack1 and not player.isAttackCooldown then
            player.isMoving = false
            player.isAttack1 = true
            player.isAttackCooldown = true  -- Set the attack cooldown flag
        end
    end
    
    if not love.mouse.isDown(1) then
        player.isAttackCooldown = false  -- Reset the attack cooldown flag when the mouse button is released
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
        player.isRunning = false
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
    love.graphics.draw(background, BG.x, BG.y, 0, BG.width / background:getWidth(), BG.height / background:getHeight())
    local animDirection = player.direction
    local img, x, y, scaleX, scaleY = nil, player.x, player.y, player.scale, player.scale

    if player.isJumping then
        -- Jump animation
        if animDirection == "left" then
            img = player.animations.jumpLeft[math.floor(player.anim)]
        else
            img = player.animations.jump[math.floor(player.anim)]
        end
    elseif not player.isMoving and not player.isDodge and not player.isJumping then
        -- Idle animation
        if animDirection == "left" and not player.isDodge then
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
    
    if player.isRunning == true then
        if animDirection == "left" then
            img = player.animations.runLeft[math.floor(player.anim)]
        else
            img = player.animations.run[math.floor(player.anim)]
        end
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

    if player.isDodge then
        player.isMoving = false
        player.isJumping = false
        player.isRunning = false
        player.isAttack1 = false
        player.isAttack2 = false
        player.isAttack3 = false
        local animDirection = player.direction
        if animDirection == "left" then
            img = player.animations.dodgeLeft[math.floor(dodgeTime)]
        else
            img = player.animations.dodge[math.floor(dodgeTime)]
        end
        if math.floor(dodgeTime) > #player.animations.dodge then
            dodgeTime = 1
            player.isDodge = false
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