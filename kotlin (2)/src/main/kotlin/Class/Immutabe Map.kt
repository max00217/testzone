fun main() {
    val numbersMap = mapOf("Key1" to 1, "Key2" to 2, "Key3" to 3, "Key4" to 1)


    println(numbersMap.keys)
    println(numbersMap.values)
    println("${numbersMap.get("key2")}")
    println("${numbersMap["key3"]}")

}

