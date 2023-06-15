# import matplotlib.pyplot as plt
# import numpy as np

# languages = ['JavaScript(Node.js)', 'Kotlin(JVM)', 'Lua(LuaJIT)', 'Python', 'Ruby', 'Rust']
# Line_of_codes = [11, 15, 19, 8, 9, 13]

# plt.bar(languages, Line_of_codes, color=['#F3E14F', '#CE1FBF', '#000080', '#3F7CAD', '#A61501', '#E53717'], width=0.5)

# for i, v in enumerate(Line_of_codes):
#     plt.text(i, v + 0.1, str(v), ha='center', va='bottom')

# plt.xlabel('Programming Languages')
# plt.ylabel('Code Lines')
# plt.title('Code Lines Comparison')
# plt.grid(True, linestyle='--', linewidth=0.5)
# plt.xticks(rotation=45)
# yticks = np.arange(0, 20, 1)
# stride = 5  # 숫자 표시 간격 설정
# plt.yticks(yticks[::stride])

# mean = np.mean(Line_of_codes)
# variance = np.var(Line_of_codes)
# std_dev = np.std(Line_of_codes)

# stats_text = f"Mean: {mean:.2f}\nVariance: {variance:.2f}\nStandard Deviation: {std_dev:.2f}"
# plt.text(0.02, 1.06, stats_text, transform=plt.gca().transAxes, fontsize=10)

# plt.show()
# import pandas as pd
# import statsmodels.api as sm

# # 데이터 입력
# languages = ['JavaScript(Node.js)', 'Kotlin(JVM)', 'Lua(LuaJIT)', 'Python', 'Ruby', 'Rust']
# execution_time = [0.304, 7.644, 0.248, 0.575, 0.473, 0.421]
# code_lines = [11, 15, 19, 8, 9, 13]

# # 데이터프레임 생성
# df = pd.DataFrame({'Languages': languages, 'Execution Time': execution_time, 'Code Lines': code_lines})

# # 독립 변수와 종속 변수 설정
# X = sm.add_constant(df['Code Lines'])  # 독립 변수 (코드 라인 수)
# y = df['Execution Time']  # 종속 변수 (실행 속도)

# # 회귀 모델 생성
# model = sm.OLS(y, X)

# # 회귀 모델 학습
# results = model.fit()

# # 회귀 분석 결과 출력
# print(results.summary())
import numpy as np

execution_time = np.array([0.304, 7.644, 0.248, 0.575, 0.473, 0.421])
code_lines = np.array([11, 15, 19, 8, 9, 13])

correlation_coefficient = np.corrcoef(execution_time, code_lines)[0, 1]
print("Correlation Coefficient:", correlation_coefficient)
