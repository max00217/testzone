local suit = require("suit")
local autogui = require("autogui.autogui")

function love.load()
    -- 해상도 설정
    love.window.setMode(640, 480)
    love.window.setTitle("오량인의 성능 안 좋은 디스코드 채팅 매크로")
    
    -- 폰트 설정
    font = love.graphics.newFont("BMDOHYEON.ttf", 16)
    runif = "현재 실행 중이지 않습니다."

    -- 텍스트박스 변수 초기화
    customX = {text = "", cursor = 0}
    customY = {text = "", cursor = 0}
    customText = {text = "", cursor = 0}
    repeat_frequency = {text = "0", cursor = 0}
    repeat_time = {text = "", cursor = 0}
end

function love.update(dt)
    -- 마우스 좌표 얻기 (AutoGUI 모듈 사용)
    mouseX, mouseY = autogui.position()

    -- 라벨 추가
    suit.Label("텍스트를 입력할 곳의 X좌표:", {align = "left"}, 10, 10, 200, 20)
    suit.Label("텍스트를 입력할 곳의 Y좌표:", {align = "left"}, 10, 60, 200, 20)
    suit.Label("입력될 텍스트:", {align = "left"}, 10, 110, 200, 20)
    suit.Label("~초마다 반복:", {align = "left"}, 10, 160, 400, 20)
    suit.Label("반복 횟수:", {align = "left"}, 10, 210, 200, 20)

    -- 텍스트 입력 상자 Suit로 만들기
    suit.Input(customX, 10, 30, 200, 20)
    suit.Input(customY, 10, 80, 200, 20)
    suit.Input(customText, 10, 130, 400, 20)
    suit.Input(repeat_frequency, 10, 180, 200, 20)
    suit.Input(repeat_time, 10, 230, 200, 20)

    -- 숫자만 입력되도록 처리
    customX.text = customX.text:gsub("%D","")
    customY.text = customY.text:gsub("%D","")
    repeat_frequency.text = repeat_frequency.text:gsub("[^%d.]*", "")
    repeat_time.text = repeat_time.text:gsub("%D","")


    local run_button = suit.Button("실행", 480, 420, 60, 30)
    local stop_button = suit.Button("정지", 550, 420, 60, 30)

    if run_button.hit then
        runif = "현재 실행 중입니다. 기기를 만지지 마세요."
        autogui.moveTo(tonumber(customX.text), tonumber(customY.text))
        autogui.click()
        for i = 1, tonumber(repeat_time.text) do
            autogui.write(customText.text)
            autogui.press("enter")
            autogui.sleep(tonumber(repeat_frequency.text))
        end
        runif = "현재 실행 중이지 않습니다."
    end

    if stop_button.hit then
        runif = "현재 실행 중이지 않습니다."
    end
end

function love.draw()
    -- 폰트를 설정한 후 화면에 마우스 좌표와 입력받은 값 출력
    love.graphics.setFont(font)
    local coordString = "X: " .. mouseX .. " Y: " .. mouseY
    local mouse_position = "현재 마우스 위치: "
    local inputposition = "텍스트가 입력될 위치: " .. customX.text .. "," .. customY.text

    -- 마우스 좌표 위치에 입력한 값을 출력
    love.graphics.print(mouse_position, (640 - font:getWidth(mouse_position)), 0)
    love.graphics.print(coordString, (640 - font:getWidth(coordString)), 20)
    love.graphics.print(inputposition, 10, 460)
    love.graphics.print(runif, 10, 420)
    love.graphics.print("해당 버전(Infinitytypingmacro)을 사용하며 생기는 불이익은 모두 사용자에게 있습니다.", 10, 400)
    
    -- 입력 상자와 Suit UI 요소 그리기
    suit.draw()

    -- 실행 버튼의 색상 설정 (초록색)
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("line", 480, 420, 60, 30)

    -- 정지 버튼의 색상 설정 (붉은색)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("line", 550, 420, 60, 30)

    -- 색상을 원래대로 돌려놓기
    love.graphics.setColor(1, 1, 1)
end

function love.textinput(t)
    suit.textinput(t)
end

function love.keypressed(key)
    suit.keypressed(key)
end