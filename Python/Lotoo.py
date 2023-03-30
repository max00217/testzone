import random

def contains(table, val):
    for i in range(len(table)):
        if table[i] == val:
            return True
    return False

random.seed()

winnum = []
for i in range(6):
    number = random.randint(1, 45)
while contains(winnum, number):
    number = random.randint(1, 45)
winnum.append(number)

winnum.sort()

print("Enter your numbers:")
usernum = []
for i in range(6):
    number = int(input())
while number < 1 or number > 45 or contains(usernum, number):
    print("Invalid input, please enter a number between 1 and 45 that hasn't been entered before.")
number = int(input())
usernum.append(number)

usernum.sort()

match = 0
for num in usernum:
    if contains(winnum, num):
        match += 1

print("Winning numbers: " + ", ".join(map(str, winnum)))
print("Your numbers: " + ", ".join(map(str, usernum)))
print("Number of matches: " + str(match))
if match == 6:
    print("Congratulations! You won the jackpot!")
elif match == 5:
    print("You won the second prize!")
elif match == 4:
    print("You won the third prize!")
elif match == 3:
    print("You won the fourth prize!")
else:
    print("Sorry, you didn't win anything.")