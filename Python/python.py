import random

cnt = 0

for i in range(1, 1000001):
    q = random.randint(1, 10)
    print(q)
    if q == 5:
        cnt += 1

print("cnt:", cnt)
