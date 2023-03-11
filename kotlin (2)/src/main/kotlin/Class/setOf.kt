fun main(){
    val numbers = setOf(1,2,3,4)
    println("DINSET = $numbers")
    println("수 : ${numbers.size}")
    if (numbers.contains(1)) println("1 is in set")
    println("intSet.isEmpty() = ${numbers.isEmpty()}")
    val numbersBackwards = setOf(4,3,2,1)
    println("The sets are equal: ${numbers == numbersBackwards}")

    println(numbers.first()==numbersBackwards.first())
    println(numbers.first()==numbersBackwards.last())
}