import kotlin.math.pow

fun isMunchausenNumber(num: Int): Boolean {
    val digits = num.toString().map { it.toString().toInt() }
    val poweredSum = digits.sumBy { it.toDouble().pow(it.toDouble()).toInt() }
    return poweredSum == num
}

fun main() {
    for (num in 1..200000) {
        if (isMunchausenNumber(num)) {
            println(num)
        }
    }
}