func isMunchausenNumber(_ num: Int) -> Bool {
    let digits = String(num).compactMap { Int(String($0)) }
    let poweredSum = digits.reduce(0) { $0 + Int(pow(Double($1), Double($1))) }
    return poweredSum == num
}

for num in 1...10_000 {
    if isMunchausenNumber(num) {
        print(num)
    }
}
