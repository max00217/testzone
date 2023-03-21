package Claass204

fun main() {
    print("Enter the Number: ")
    val un = readLine()?.toLongOrNull() ?: return
    var sq: Long = 1
    for (i in 1..100) {
        println("$i: ${un * sq}")
        sq *= un
    }
}