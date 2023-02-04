package Class

fun main() {
    //val numbers:List<String> = listOf("one,"two","three","four")
    val numbers = listOf("one", "two", "three", "four")

    println("numbers = ${numbers.joinToString(",")}")
    println("numbers = ${numbers.toString()}")
    println("Number of elements:${numbers.size}")
    println("Third element: ${numbers.get(2)}")
    println("Fourth element: ${numbers[3]}")
    println("Index of element\"two\"${numbers.indexOf("two")}")


}