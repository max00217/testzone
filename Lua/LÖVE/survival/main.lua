function love.load()
    love.graphics.setBackgroundColor(0.2, 0.2, 0.3)
    love.window.setTitle("오량인의 성능 안 좋은 Survival")
    
    windowwidth = love.graphics.getWidth()
	windowheight = love.graphics.getHeight()

    triangleX = windowwidth / 2
    triangleY = windowheight / 2 
    speed = 200

    angle = 0
    triangleWidth = 20
    triangleHeight = 25

    orbitRadius = 27
    orbitAngle = 0
    orbitSpeed = 7

    squareSize = 10

    Menemys = {}
    Menemys.x = 710
	Menemys.y = 220
    Menemys.width = 20
	Menemys.height = 70
    Menemys.spawn_timer = 0
    Menemys.spawn_interval = 2

    move = 200
  end
  
  function love.update(dt)
    --적 생성 로직
    --생성 후 플레이어로 유도
    --시간 지날 때마다 양 증가
    Menemys.spawn_timer = Menemys.spawn_timer + dt
    if Menemys.spawn_timer > Menemys.spawn_interval then
        Menemys.spawn_timer = 0
        table.insert(Menemys, {x = love.math.random(0, windowwidth), y = 0})
        table.insert(Menemys, {x = love.math.random(0, windowwidth), y = windowheight - 10})
        table.insert(Menemys, {x = 0, y = love.math.random(0, windowheight)})
        table.insert(Menemys, {x = windowwidth, y = love.math.random(0, windowheight)})
    end
    for i, Menemys in ipairs(Menemys) do
        if Menemys.x ~= triangleX then
            Menemys.x = triangleX - move * dt
        end
        if Menemys.x ~= triangleY then
            Menemys.y = triangleY - move * dt
        end
        if Menemys.x < 0 then
            table.remove(Menemys, i)
        end
    end


    if love.keyboard.isDown('w') then
      triangleY = triangleY - speed * dt
      angle = 0 
    end
    if love.keyboard.isDown('a') then
      triangleX = triangleX - speed * dt
      angle = -math.pi / 2
    end
    if love.keyboard.isDown('s') then
      triangleY = triangleY + speed * dt
      angle = math.pi
    end
    if love.keyboard.isDown('d') then
      triangleX = triangleX + speed * dt
      angle = math.pi / 2
    end
    if love.keyboard.isDown('w') and love.keyboard.isDown('d') then
        angle = math.pi / 4
    elseif love.keyboard.isDown('d') and love.keyboard.isDown('s') then
        angle = math.pi / math.sqrt(2)
    elseif love.keyboard.isDown('s') and love.keyboard.isDown('a') then
        angle = -math.pi / math.sqrt(2)
    elseif love.keyboard.isDown('a') and love.keyboard.isDown('w') then
        angle = -math.pi / 4
    end

    orbitAngle = orbitAngle + orbitSpeed * dt
  end
  
  function love.draw()

    for i, Menemys in ipairs(Menemys) do
        love.graphics.print("O", Menemys.x, Menemys.y, 0, 1.5)
    end

    local squareX = math.cos(orbitAngle) * orbitRadius
    local squareY = math.sin(orbitAngle) * orbitRadius
    love.graphics.rectangle('fill', squareX - squareSize/2 + triangleX, squareY - squareSize/2 + triangleY, squareSize, squareSize)

    love.graphics.translate(triangleX, triangleY)
    love.graphics.rotate(angle)
    love.graphics.polygon('fill', 0, -triangleHeight/2, triangleWidth/2, triangleHeight/2, -triangleWidth/2, triangleHeight/2)
  end
