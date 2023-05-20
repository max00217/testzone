function longest_common_subsequence(X, Y)
    local m, n = #X, #Y --문자열 X와 Y의 길이를 number형으로 저장
    local dp = {} --dp 테이블 생성
    for i = 0, m do --0부터 m까지 반복(m은 X의 길이)
        dp[i] = {} --dp[i] 테이블 생성([i]는 X의 i번째 문자까지의 LCS를 저장)
        for j = 0, n do --0부터 n까지 반복(n은 Y의 길이)
            if i == 0 or j == 0 then --i가 0이거나 j가 0이면
                dp[i][j] = 0 -- dp[i][j]에 0 저장([j]는 Y의 j번째 문자까지의 LCS를 저장)
            elseif X:sub(i, i) == Y:sub(j, j) then --또한, X의 i번째 문자와 Y의 j번째 문자가 같으면
                dp[i][j] = dp[i - 1][j - 1] + 1 -- dp[i][j]에 dp[i - 1][j - 1] + 1 저장
            else
                dp[i][j] = math.max(dp[i - 1][j], dp[i][j - 1]) -- 아니면 dp[i][j]에 dp[i - 1][j]와 dp[i][j - 1] 중 큰 값 저장
            end
        end
    end
    return dp[m][n]
end

local X, Y = 'ABCBDAB', 'BDCAB'
local result = longest_common_subsequence(X, Y)
print(result)  -- 출력: 4
