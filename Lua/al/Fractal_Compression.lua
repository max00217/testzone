-- Fractal Compression 함수 정의
local function fractalCompression(image, blockWidth, blockHeight, maxIterations, tolerance)
    local compressedImage = {} -- 압축된 이미지를 저장할 테이블
    local width, height = #image[1], #image -- 이미지의 가로, 세로 크기

    -- 재귀적인 Fractal Compression 함수
    local function compressRecursive(x, y, blockWidth, blockHeight, iteration)
        if iteration >= maxIterations or blockWidth <= 1 or blockHeight <= 1 then
            -- 압축을 더 이상 진행할 수 없는 경우, 해당 블록의 평균값을 저장
            local average = 0
            for i = y, y + blockHeight - 1 do
                for j = x, x + blockWidth - 1 do
                    average = average + image[i][j]
                end
            end
            average = average / (blockWidth * blockHeight)
            compressedImage[#compressedImage + 1] = average
        else
            -- 블록을 두 개의 부분 블록으로 나누고 압축을 계속 진행
            local subWidth, subHeight = math.floor(blockWidth / 2), math.floor(blockHeight / 2)

            -- 좌측 상단 부분 블록
            compressRecursive(x, y, subWidth, subHeight, iteration + 1)
            -- 우측 상단 부분 블록
            compressRecursive(x + subWidth, y, subWidth, subHeight, iteration + 1)
            -- 좌측 하단 부분 블록
            compressRecursive(x, y + subHeight, subWidth, subHeight, iteration + 1)
            -- 우측 하단 부분 블록
            compressRecursive(x + subWidth, y + subHeight, subWidth, subHeight, iteration + 1)
        end
    end

    -- Fractal Compression 알고리즘 수행
    compressRecursive(1, 1, width, height, 0)

    -- 압축된 이미지 반환
    return compressedImage
end

-- 입력 이미지 (예시용)
local image = {
    {50, 30, 40, 70},
    {60, 20, 80, 90},
    {70, 10, 50, 60},
    {80, 30, 40, 20}
}

-- Fractal Compression 수행
local compressedImage = fractalCompression(image, #image[1], #image, 3, 1)
print("Fractal Compression:")
for i, value in ipairs(compressedImage) do
    print(string.format("Block %d: %.2f", i, value))
end


