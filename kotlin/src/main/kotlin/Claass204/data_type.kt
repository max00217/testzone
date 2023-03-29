package Claass204

fun main() {
    // Byte
    var byte: Byte = 120
    // Short
    val short: Short = 30000
    // Int
    val int: Int = 2000000000
    // Long
    val long: Long = 9000000000000000000
    // Float
    val float: Float = 3.14f
    // Double
    val double: Double = 3.14159265359
    // Char
    val char: Char = 'A'
    // Boolean
    val bool: Boolean = true
    // String
    val str: String = "Hello, Kotlin!"
    // Array
    val arr: Array<Int> = arrayOf(1, 2, 3, 4, 5)
    // Nullable types
    var nullable: String? = null

    // Collections
    val list: List<String> = listOf("apple", "banana", "orange")
    val set: Set<Int> = setOf(1, 2, 3)
    val map: Map<String, Int> = mapOf("one" to 1, "two" to 2, "three" to 3)

    // Ranges
    val range: IntRange = 1..10

    println("Byte: $byte\nShort: $short\nInt: $int\nLong: $long\nFloat: $float\nDouble: $double\nChar: $char\nBoolean: $bool\nString: $str\nArray: $arr\nNullable types: $nullable\nList: $list\nSet: $set\nMap: $map\nRanges: $range")
}
