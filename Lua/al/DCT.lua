-- DCT 함수 정의
local function DCT(data)
    local height, width = #data, #data[1] -- 데이터의 높이와 너비
    local transformedData = {} -- 변환된 데이터를 저장할 테이블

    -- 가중치 계산용 함수
    local function alpha(k)
        if k == 0 then
            return 1 / math.sqrt(width)
        else
            return math.sqrt(2 / width)
        end
    end

    -- 이산 코사인 변환 수행
    for u = 1, height do
        transformedData[u] = {} -- 새로운 행 생성
        for v = 1, width do
            local sum = 0 -- 합을 초기화
            for x = 1, width do
                for y = 1, height do
                    local angle = math.pi * (2 * (x - 1) + 1) * (u - 1) / (2 * width) -- 각도 계산
                    angle = angle + math.pi * (2 * (y - 1) + 1) * (v - 1) / (2 * height)
                    local coefficient = data[y][x] * math.cos(angle) -- 계수 계산
                    sum = sum + coefficient -- 합 업데이트
                end
            end
            transformedData[u][v] = alpha(u - 1) * alpha(v - 1) * sum -- 변환된 데이터 저장
        end
    end

    return transformedData -- 변환된 데이터 반환
end

-- 입력 데이터 (예시용)
local data = {
    {50, 30, 40, 70},
    {60, 20, 80, 90},
    {70, 10, 50, 60},
    {80, 30, 40, 20}
}

-- DCT 변환 후 결과 출력
local transformedData = DCT(data)
print("DCT Compression:")
for i, row in ipairs(transformedData) do
    for j, value in ipairs(row) do
        io.write(string.format("Pixel (%d, %d): %.2f\n", i, j, value))
    end
end

