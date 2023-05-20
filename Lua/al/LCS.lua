-- LCS를 찾는 함수
function lcs(str1, str2)
    local lengths = {} -- i번째 문자열 str1과 j번째 문자열 str2 중 LCS의 길이
    local result = {} -- LCS 저장(문자열로 저장됨)

    -- i번째 문자열 str1과 j번째 문자열 str2 중 LCS의 길이를 계산
    for i = 0, #str1 do -- 0부터 #str1까지(여기서 #str1은 str1의 길이)
      lengths[i] = {} -- lengths[i]에 빈 테이블을 초기화(2차원 배열, 여기서 lengths[i]는 i번째 행)
      for j = 0, #str2 do -- 0부터 #str2까지(여기서 #str2는 str2의 길이)
        if i == 0 or j == 0 then -- i가 0이거나 j가 0이면
          lengths[i][j] = 0 -- lengths[i][j]에 0을 저장(여기서 length[j]는 j번째 열, 따라서 lengths[i][j]는 i번째 행의 j번째 열)
        elseif str1:sub(i, i) == str2:sub(j, j) then -- i번째 문자열 str1과 j번째 문자열 str2가 같으면
          lengths[i][j] = lengths[i-1][j-1] + 1 -- lengths[i][j]에 lengths[i-1][j-1] + 1을 저장(lengths[i-1][j-1]는 i-1번째 행의 j-1번째 열)
        else
          lengths[i][j] = math.max(lengths[i-1][j], lengths[i][j-1]) -- lengths[i][j]에 lengths[i-1][j]와 lengths[i][j-1] 중 큰 값을 저장
        end
      end
    end

    -- LCS 저장
    i, j = #str1, #str2 -- i에 str1의 길이(#str1), j에 str2의 길이(#str2)를 저장
    while i > 0 and j > 0 do -- i가 0보다 크고 j가 0보다 큰 동안 반복
      if str1:sub(i, i) == str2:sub(j, j) then -- i번째 문자열 str1과 j번째 문자열 str2가 같으면
        table.insert(result, 1, str1:sub(i, i)) -- result의 1번째 위치에 str1의 i번째 문자를 삽입
        i, j = i - 1, j - 1 -- i에 i-1, j에 j-1을 저장
      elseif lengths[i-1][j] > lengths[i][j-1] then -- 또한, lengths[i-1][j]가 lengths[i][j-1]보다 크면
        i = i - 1 -- i에 i-1을 저장
      else
        j = j - 1 -- 아니면, j에 j-1을 저장
      end
    end
    return result -- result 반환
  end

  -- 실제 입력값 예시
  str1 = "NDFSDVBACDWEEERGABTYU" -- str1에 문자열 저장
  str2 = "LPIKHACDWEEERGQASDCCC" -- str2에 문자열 저장
  -- 여기서는 ACDWEEERG가 가장 긴 공통 부분 수열임.

  print(table.concat(lcs(str1, str2)))  -- 값 출력, 예시 결과: "ACDWEEERG"