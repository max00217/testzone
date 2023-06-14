fn is_munchausen_number(num: u32) -> bool {
    let digits: Vec<u32> = num.to_string().chars().map(|c| c.to_digit(10).unwrap()).collect();
    let powered_sum: u32 = digits.iter().map(|&digit| digit.pow(digit)).sum();
    powered_sum == num
}

fn main() {
    for num in 1..=200000 {
        if is_munchausen_number(num) {
            println!("{}", num);
        }
    }
}