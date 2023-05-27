package.path = package.path .. "\\autogui\\?.lua"
local autogui = require("autogui")

local targetX, targetY = 1320, 826
text = "뭉탱이로 있다가 유링계숭 아니그냥"
local enterRepeat = 3

-- 마우스를 지정된 좌표로 이동하고 클릭
autogui.moveTo(targetX, targetY)
autogui.click()

--엔터 키 5번 반복 입력
for i = 1, enterRepeat do
    if i == 1 then
        text = "뭉"
    elseif i == 2 then
        text = "탱"
    elseif i == 3 then
        text = "이"
    end
    autogui.write(text)
    autogui.sleep(0.2)
    autogui.press("enter")
end
