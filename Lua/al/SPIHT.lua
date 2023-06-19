-- SPIHT 알고리즘 함수 정의
local function spihtCompression(image, maxBits)
    local compressedImage = {} -- 압축된 이미지를 저장할 테이블
    local width, height = #image[1], #image -- 이미지의 가로, 세로 크기

    -- 재귀적인 SPIHT 알고리즘 함수
    local function compressRecursive(image, threshold, startX, startY, width, height, bitPlane)
        -- 영역 분할을 위한 변수 초기화
        local subWidth, subHeight = width / 2, height / 2
        local subbandLL, subbandLH, subbandHL, subbandHH

        -- 이미지의 서브밴드 생성
        subbandLL = {} -- LL 서브밴드 (Low-Low)
        subbandLH = {} -- LH 서브밴드 (Low-High)
        subbandHL = {} -- HL 서브밴드 (High-Low)
        subbandHH = {} -- HH 서브밴드 (High-High)

        -- 영역 분할 수행
        for i = startY, startY + height - 1 do
            subbandLL[i] = {}
            subbandLH[i] = {}
            subbandHL[i] = {}
            subbandHH[i] = {}
            for j = startX, startX + width - 1 do
                if i < startY + subHeight and j < startX + subWidth then
                    subbandLL[i][j] = image[i] and image[i][j] or 0 -- Handle nil values
                elseif i < startY + subHeight and j >= startX + subWidth then
                    subbandLH[i][j] = image[i] and image[i][j] or 0 -- Handle nil values
                elseif i >= startY + subHeight and j < startX + subWidth then
                    subbandHL[i][j] = image[i] and image[i][j] or 0 -- Handle nil values
                else
                    subbandHH[i][j] = image[i] and image[i][j] or 0 -- Handle nil values
                end
            end
        end

        -- 비트 표현 계층의 생성
        for bit = bitPlane, 0, -1 do
            -- 비트 평면 인덱스에 해당하는 값들을 저장
            local list = {}
            for i = startY, startY + height - 1 do
                for j = startX, startX + width - 1 do
                    if (image[i] and image[i][j]) and image[i][j] >= threshold then -- Handle nil values
                        table.insert(list, {i, j})
                    end
                end
            end

            -- 비트 평면에 대한 SPIHT 압축 수행
            if #list > 0 then
                -- 비트 평면 저장
                table.insert(compressedImage, {bit = bit, pixels = list})

                -- 임계값 업데이트
                threshold = threshold / 2

                -- 다음 비트 평면 압축을 위해 서브밴드 업데이트
                if bit > 0 then
                    compressRecursive(subbandLL, threshold, startX, startY, subWidth, subHeight, bit - 1)
                    compressRecursive(subbandLH, threshold, startX + subWidth, startY, subWidth, subHeight, bit - 1)
                    compressRecursive(subbandHL, threshold, startX, startY + subHeight, subWidth, subHeight, bit - 1)
                    compressRecursive(subbandHH, threshold, startX + subWidth, startY + subHeight, subWidth, subHeight, bit - 1)
                end
            end
        end
    end

    -- 압축 수행
    local maxVal = 0
    for i = 1, height do
        for j = 1, width do
            maxVal = math.max(maxVal, image[i] and image[i][j] or 0) -- Handle nil values
        end
    end
    local threshold = maxVal -- 초기 임계값 설정
    compressRecursive(image, threshold, 1, 1, width, height, maxBits - 1)

    return compressedImage
end

-- 입력 이미지 (예시용)
local image = {
    {50, 30, 40, 70},
    {60, 20, 80, 90},
    {70, 10, 50, 60},
    {80, 30, 40, 20}
}

-- SPIHT 알고리즘 수행
local compressedImage = spihtCompression(image, 3)
print("SPIHT Compression:")
for i, value in ipairs(compressedImage) do
    print("Bit Plane:", value.bit)
    for j, pixel in ipairs(value.pixels) do
        print(string.format("Pixel (%d, %d)", pixel[1], pixel[2]))
    end
end

