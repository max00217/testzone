function love.load()
    love.graphics.setBackgroundColor(0.2, 0.2, 0.3)
    love.window.setTitle("오량인의 성능 안 좋은 Survival")
    
    windowwidth = love.graphics.getWidth()
	windowheight = love.graphics.getHeight()

    triangle = {
        x = windowwidth / 2,
        y = windowheight / 2,
        speed = 200,
        angle = 0,
        width = 15,
        height = 17
    }

    orbitRadius = 27
    orbitAngle = 0
    orbitSpeed = 10
    
    square = {}
    square.x = math.cos(orbitAngle) * orbitRadius
    square.y = math.sin(orbitAngle) * orbitRadius
    squareSize = 10

    enemies = {}
    -- 적 생성
    for i=1,7 do
      createEnemy()
    end

    bullet = {
        x = 0,
        y = 0,
        radius = 5,
        speed = 500,
        active = false -- bullet is inactive until fired
      }

    move = 200

    time = 0

    hpcount = 30
end
  
function createEnemy()
    local enemy = {}
    if love.math.random() < 0.5 then
      if love.math.random() < 0.5 then
        enemy.x = 0
      else
        enemy.x = love.graphics.getWidth()
      end
      enemy.y = love.math.random() * love.graphics.getHeight()
    else
      if math.random() < 0.5 then
        enemy.y = 0
      else
        enemy.y = love.graphics.getHeight()
      end
      enemy.x = love.math.random() * love.graphics.getWidth()
    end
    table.insert(enemies, enemy)
end

function love.update(dt)
    hpcount = 30
    for i, enemy in ipairs(enemies) do
        local dx = triangle.x - enemy.x
        local dy = triangle.y - enemy.y
        local ex = math.floor(square.x - squareSize/2 + triangle.x) - enemy.x
        local ey = math.floor(square.y - squareSize/2 + triangle.y) - enemy.y
        local dist = math.sqrt(dx*dx + dy*dy)
        local diste = math.sqrt(ex*ex + ey*ey)
        -- 적이 플레이어를 따라가는 속도
        local speed = 130
        if dist > 0 then
            enemy.x = enemy.x + speed * dx / dist * dt
            enemy.y = enemy.y + speed * dy / dist * dt
        end
        if diste < 10 then
            table.remove(enemies, i)
        end
    end

    if love.math.random() < 0.07 then
      createEnemy()
    end

    if love.mouse.isDown(1) then
        -- Set bullet position to triangle position
        bullet.x = triangle.x + triangle.width / 2 -- add half of triangle width to center bullet
        bullet.y = triangle.y + triangle.height / 2 -- add half of triangle height to center bullet
        
        -- Calculate direction to mouse cursor
        local mouseX, mouseY = love.mouse.getPosition()
        local dx = mouseX - bullet.x
        local dy = mouseY - bullet.y
        local dist = math.sqrt(dx * dx + dy * dy)
        
        -- Normalize direction and set bullet velocity
        bullet.vx = bullet.speed * dx / dist
        bullet.vy = bullet.speed * dy / dist
        
        -- Set bullet as active
        bullet.active = true
      end
      
      -- Move bullet when active
      if bullet.active then
        bullet.x = bullet.x + bullet.vx * dt
        bullet.y = bullet.y + bullet.vy * dt
        
        -- Deactivate bullet when it goes off screen
        if bullet.x < -bullet.radius or bullet.x > love.graphics.getWidth() + bullet.radius
        or bullet.y < -bullet.radius or bullet.y > love.graphics.getHeight() + bullet.radius then
          bullet.active = false
        end
      end


    if love.keyboard.isDown('w') then
      triangle.y = triangle.y - triangle.speed * dt
      triangle.angle = 0 
    end
    if love.keyboard.isDown('a') then
      triangle.x = triangle.x - triangle.speed * dt
      triangle.angle = -math.pi / 2
    end
    if love.keyboard.isDown('s') then
      triangle.y = triangle.y + triangle.speed * dt
      triangle.angle = math.pi
    end
    if love.keyboard.isDown('d') then
      triangle.x = triangle.x + triangle.speed * dt
      triangle.angle = math.pi / 2
    end
    if love.keyboard.isDown('w') and love.keyboard.isDown('d') then
        triangle.angle = math.pi / 4
    elseif love.keyboard.isDown('d') and love.keyboard.isDown('s') then
        triangle.angle = math.pi / math.sqrt(2)
    elseif love.keyboard.isDown('s') and love.keyboard.isDown('a') then
        triangle.angle = -math.pi / math.sqrt(2)
    elseif love.keyboard.isDown('a') and love.keyboard.isDown('w') then
        triangle.angle = -math.pi / 4
    end

    orbitAngle = orbitAngle + orbitSpeed * dt
    square.x = math.cos(orbitAngle) * orbitRadius
    square.y = math.sin(orbitAngle) * orbitRadius
end
  
function love.draw()
    love.graphics.print(math.floor(square.x - squareSize/2 + triangle.x), 10, 0)
    love.graphics.print(hpcount, 10, 10)

    for i, enemy in ipairs(enemies) do
      love.graphics.setColor(1, 0, 0)
      love.graphics.circle("fill", enemy.x, enemy.y, 5)
    end

    if bullet.active then
        love.graphics.setColor(1, 0.5, 0)
        love.graphics.circle("fill", bullet.x, bullet.y, bullet.radius)
      end

    --square.x = math.cos(orbitAngle) * orbitRadius
    --square.y = math.sin(orbitAngle) * orbitRadius
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', square.x - squareSize/2 + triangle.x, square.y - squareSize/2 + triangle.y, squareSize, squareSize)

    love.graphics.setColor(1, 1, 1)
    love.graphics.translate(triangle.x, triangle.y)
    love.graphics.rotate(triangle.angle)
    love.graphics.polygon('fill', 0, -triangle.height/2, triangle.width/2, triangle.height/2, -triangle.width/2, triangle.height/2)
end