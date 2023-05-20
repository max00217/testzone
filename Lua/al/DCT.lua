-- DCT 함수 정의
local function DCT(x) -- x는 입력 시계열 데이터
    local N = #x -- N에 x의 길이 저장(#x는 x의 길이)
    local X = {} -- X에 빈 테이블을 초기화
  
    -- 가중치 계산용 함수
    local function alpha(k)
        if k == 0 then -- k가 0이면
            return 1 / math.sqrt(N) -- 1 / math.sqrt(N) 반환(math.sqrt(N)는 N의 제곱근)
        else
            return math.sqrt(2 / N) --  math.sqrt(2 / N) 반환(math.sqrt(2 / N)는 2 / N의 제곱근)
        end
    end
  
    -- 이산 코사인 변환 수행
    for k = 0, N - 1 do -- 0부터 N-1까지 반복
        local sum = 0 -- sum에 0 저장
        for n = 0, N - 1 do -- 0부터 N-1까지 반복
            local angle = math.pi * (2 * n + 1) * k / (2 * N) -- angle에 math.pi * (2 * n + 1) * k / (2 * N) 저장(math.pi는 원주율)
            sum = sum + x[n+1] * math.cos(angle) -- sum에 sum + x[n+1] * math.cos(angle) 저장(x[n+1]는 x의 n+1번째 인덱스의 값)
        end
        X[k+1] = alpha(k) * sum -- X[k+1]에 alpha(k) * sum 저장(alpha(k)는 k번째 가중치, sum은 위에서 계산한 값)
    end
    return X -- X 반환
end

-- 입력 시계열 데이터 (예시용)
local data = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20} -- data에 무작위 배열 저장

-- DCT 변환 후 결과 출력
local transformed_data = DCT(data) -- transformed_data에 DCT 함수의 반환값 저장
for index, value in ipairs(transformed_data) do -- transformed_data의 각 요소에 대해 반복
    print(string.format("%d: %f", index, value)) -- index - 1과 value를 출력
end