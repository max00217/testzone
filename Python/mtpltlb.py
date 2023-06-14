import matplotlib.pyplot as plt
import numpy as np

languages = ['JavaScript(Node.js)', 'Kotlin(JVM)', 'Lua(LuaJIT)', 'Python', 'Ruby', 'Rust']
Line_of_codes = [11, 15, 19, 8, 9, 13]

plt.bar(languages, Line_of_codes, color=['#F3E14F', '#CE1FBF', '#000080', '#3F7CAD', '#A61501', '#E53717'], width=0.5)

for i, v in enumerate(Line_of_codes):
    plt.text(i, v + 0.1, str(v), ha='center', va='bottom')

plt.xlabel('Programming Languages')
plt.ylabel('Code Lines')
plt.title('Code Lines Comparison')
plt.grid(True, linestyle='--', linewidth=0.5)
plt.xticks(rotation=45)
yticks = np.arange(0, 20, 1)
stride = 5  # 숫자 표시 간격 설정
plt.yticks(yticks[::stride])

mean = np.mean(Line_of_codes)
variance = np.var(Line_of_codes)
std_dev = np.std(Line_of_codes)

stats_text = f"Mean: {mean:.2f}\nVariance: {variance:.2f}\nStandard Deviation: {std_dev:.2f}"
plt.text(0.02, 1.06, stats_text, transform=plt.gca().transAxes, fontsize=10)

plt.show()