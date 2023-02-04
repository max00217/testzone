data class Person(var name: String, var age: Int)

fun main() {
    val bob = Person("Bob", 32)
    var people = listOf(Person("Adam", 20), bob,bob)
    val people2 = listOf(Person("Adam", 20), Person("Bob", 31), bob)
    println(people == people2)
    bob.age = 32
    println(people == people2)
}