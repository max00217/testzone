import random

user = input(str("R, P or, S: "))
rps_table = ["R", "P", "S"]
bot = random.choice(rps_table)
result = rps_table.index(user) - rps_table.index(bot)
if result == 0:
    print(f"{user} vs {bot}  Draw")
elif result == 1 or result == -2:
    print(f"{user} vs {bot}  You Win")
else:
    print(f"{user} vs {bot}  You Lose")