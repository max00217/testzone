-- a << b는 a의 비트를 b만큼 왼쪽으로 이동시킵니다.
local a = 8 -- 00001000 (2진수)
local b = 2
local result = a ~ b -- 00100000 (2진수)
print(result) -- 32 (10진수)