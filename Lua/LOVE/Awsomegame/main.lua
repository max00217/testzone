local sprites = require("sprites")

local drawGround
local animTime = 0
local dodgeTime = 0
local animationSpeed = 16
local DodgeSpeed = 15
local animationSpeedfordodge = 7
local gravity = 1300
local dodgeDuration = 0.3
local dodgeTimer = 0

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
        animations = sprites,
        anim = 1,
        isIdle = true,
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

function love.update(dt)
    animTime = animTime + animationSpeed * dt
    dodgeTime = dodgeTime + DodgeSpeed * dt 
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
        if love.keyboard.isDown("space") and not player.isAttack1 and not player.isAttack2 and not player.isAttack3 and not player.isJumping and not player.isDodgeCooldown then
            moveX = -20
            player.isDodge = true
            player.isMove = true
            player.isDodgeCooldown = true
        else
            player.isDodge = false
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
        if love.keyboard.isDown("space") and not player.isAttack1 and not player.isAttack2 and not player.isAttack3 and not player.isJumping and not player.isDodgeCooldown then
            moveX = 20
            player.isDodge = true
            player.isMove = true
            player.isDodgeCooldown = true
        else
            player.isDodge = false
        end
    end

    if love.keyboard.isDown("w") and not player.isJumping then
        player.isJumping = true
        player.anim = 1
        player.jumpStartY = player.y
        player.jumpSpeed = 400
        player.isJumpAnimPlayed = false
    end

    if not love.keyboard.isDown("space") then
        player.isDodgeCooldown = false  -- Reset the dodge cooldown flag when the space button is released
        player.isDodge = false
        player.speed = 200
    end

    if not player.isMoving and not player.isAttack2 and not player.isDodge or (player.isMoving and player.isJumping) then
        if love.mouse.isDown(1) and not player.isAttack1 and not player.isAttack1Cooldown then
            player.isMoving = false
            player.isAttack1 = true
            player.isAttack1Cooldown = true  -- Set attack cooldown
        end
    end

    if not love.mouse.isDown(1) then
        player.isAttack1Cooldown = false  -- Reset attack cooldown
    end
    if not player.isMoving and not player.isAttack1 and not player.isDodge or (player.isMoving and player.isJumping) then
        if love.mouse.isDown(2) and not player.isAttack2 and not player.isAttack2Cooldown then
            player.isMoving = false
            player.isAttack2 = true
            player.isAttack2Cooldown = true  -- Set attack cooldown
        end
    end

    if not love.mouse.isDown(2) then
        player.isAttackwCooldown = false  -- Reset attack cooldown
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
    if love.keyboard.isDown("escape") then
        love.event.quit()
    elseif love.keyboard.isDown("lctrl") and love.keyboard.isDown("r") then
        love.event.quit("restart")
    end
    player.isIdle = true
end

function love.mousepressed(x, y, button)
    if button == 1 then
        player.isAttack1 = true
        player.isMoving = false
        player.isDodge = false
        player.isIdle = false
    elseif button == 2 then
        player.isAttack2 = true
        player.isMoving = false        
        player.isDodge = false
        player.isIdle = false
    end
end

function love.draw()
    love.graphics.draw(background, BG.x, BG.y, 0, BG.width / background:getWidth(), BG.height / background:getHeight())
    local animDirection = player.direction
    local img, x, y, scaleX, scaleY = nil, player.x, player.y, player.scale, player.scale

    if player.isDodge then
        love.graphics.rectangle("fill", player.x, player.y, 100, 100)
    elseif player.isJumping then
        love.graphics.rectangle("fill", player.x, player.y, 100, 100, 100, 100, 100)
    elseif player.isAttack1 or player.isAttack2 or player.isAttack3 then
        love.graphics.rectangle("fill", player.x, player.y, 30, 30)
    end

    if player.isJumping then
        -- Jump animation
        if animDirection == "left" then
            img = player.animations.jumpLeft[math.floor(player.anim)]
        else
            img = player.animations.jump[math.floor(player.anim)]
        end
    elseif player.isIdle and not player.isMoving and not player.isDodge and not player.isJumping then
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
        player.isIdle = false
        player.isMoving = false
        player.isMoving = false
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

    if player.isAttack2 then
        player.isIdle = false
        player.isMoving = false
        player.isMoving = false
        if player.direction == "left" then
            img = player.animations.attack2Left[math.floor(animTime)]
        else
            img = player.animations.attack2[math.floor(animTime)]
        end
        if math.floor(animTime) > #player.animations.attack2 then
            animTime = 1
            player.isAttack2 = false
        end
    end

    if player.isDodge then
        player.isMoving = false
        player.isJumping = false
        player.isRunning = false
        player.isAttack1 = false
        player.isAttack2 = false
        player.isAttack3 = false
        player.isIdle = false
        local animDirection = player.direction
        if animDirection == "left" then
            img = player.animations.dodgeLeft[math.floor(dodgeTime)]
        else
            img = player.animations.dodge[math.floor(dodgeTime)]
        end
        if math.floor(dodgeTime) > #player.animations.dodge then
            dodgeTime = 0.1
            player.isDodge = false
        end
    end

    if img then
        love.graphics.draw(img, x, y, 0, scaleX, scaleY)
    end
    drawGround()
end