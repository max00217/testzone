func factorial(_ num: Int) -> Int {
    if num == 0 {
        return 1
    }
    return num * factorial(num - 1)
}

print("팩토리얼을 계산할 숫자를 입력하세요:")
if let input = readLine(), let number = Int(input) {
    let result = factorial(number)
    print("\(number)! = \(result)")
} else {
    print("잘못된 입력입니다.")
}