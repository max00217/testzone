package Fn

fun addNumber(vararg numbers:Int): Int {
    var result = 0
    for (num in numbers)
        result += num
    return result
}

fun main(){
    val result1 = addNumber(1, 2, 3)
    val result2 = addNumber(1, 2, 3, 4, 5)

    println("result = $result1, result2 = $result2")
}