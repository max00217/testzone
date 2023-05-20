function binarySearch(tablearr, target)
    local low = 1 -- low에 1을 저장(여기서 low는 배열의 첫 번째 인덱스)
    local high = #tablearr -- high에 tablearr의 길이를 저장(즉, 배열의 가장 마지막 인덱스를 뜻함)
    table.sort(tablearr)  -- 이진 탐색을 위해 배열을 정렬(이제 tablearr는 {3, 4, 5, 6, 9, 10, 11, 29}으로 정렬됨)

    while low <= high do -- low가 high보다 작거나 같을 때까지 반복
    local mid = math.floor((low + high) / 2) -- mid에 low와 high의 합을 2로 나눈 몫을 저장(따라서 mid는 배열의 중간 인덱스)
        if tablearr[mid] == target then -- tablearr[mid]가 target과 같으면(tablearr[mid]는 mid번째 인덱스)
            return mid -- mid 반환
        elseif tablearr[mid] < target then -- tablearr[mid]가 target보다 작으면(여기서는 tablearr[mid]가 target보다 작으면 mid번째 인덱스의 값이 target보다 작다는 뜻)
            low = mid + 1 -- low에 mid + 1을 저장
        else
            high = mid - 1 -- 아니면, high에 mid - 1을 저장 
        end
    end
    return -1  -- 타겟이 배열에 없을 경우 -1을 반환
end

-- 정렬된 배열에서 7을 찾기 위한 이진 탐색
tablearr = {6, 3, 10, 4, 9, 11, 5, 29} -- tablearr에 무작위 배열 저장
target = 5 -- target에 찾을 값 저장
index = binarySearch(tablearr, target) -- index에 binarySearch 함수의 반환값 저장
print(index)  --> 3 (루아의 인덱스는 1부터 시작)