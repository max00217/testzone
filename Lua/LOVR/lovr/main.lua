function lovr.load()
  -- 플레이어 모델을 생성합니다
  player = lovr.graphics.newModel('player.glb')

  -- 플레이어의 위치를 정의합니다
  playerX, playerY, playerZ = 0, 1.5, 0

  -- 중력 상수를 정의합니다
  gravity = -9.81

  -- 플랫폼의 위치를 정의합니다
  platformX, platformY, platformZ = 0, 0, 0

  -- A.C.T. 글자의 폰트를 로드합니다
  font = lovr.graphics.newFont('sans-serif.ttf', 0.1)

  -- 스페이스 바가 눌린 횟수를 초기화합니다
  jumpCount = 0
end

function lovr.update(dt)
  -- 플레이어의 y축 속도를 계산합니다
  playerYVelocity = playerYVelocity + gravity * dt

  -- 플레이어의 y축 위치를 업데이트합니다
  playerY = playerY + playerYVelocity * dt

  -- 플레이어가 플랫폼보다 아래에 있는 경우 바닥에 머무릅니다
  if playerY < platformY then
    playerY = platformY
    playerYVelocity = 0
    jumpCount = 0
  end

  -- 스페이스 바가 눌린 경우 플레이어를 점프시킵니다
  if lovr.keyboard.wasPressed('space') and jumpCount < 2 then
    playerYVelocity = 5
    jumpCount = jumpCount + 1
  end
end

function lovr.draw()
  -- A.C.T. 글자를 화면 중앙에 그립니다
  lovr.graphics.print('A.C.T.', 0, 1.5, -1, 0.1)

  -- 플레이어 모델을 그립니다
  lovr.graphics.push()
  lovr.graphics.translate(playerX, playerY, playerZ)
  player:draw()
  lovr.graphics.pop()

  -- 플랫폼을 그립니다
  lovr.graphics.box('fill', platformX, platformY, platformZ, 1, 0.1, 1)
end
