package Claass204

import java.util.Scanner
import kotlin.random.Random

fun main() {
    val scanner = Scanner(System.`in`)
    print("R, P, or S: ")
    val user = scanner.nextLine().trim().toUpperCase()
    val rpsTable = listOf("R", "P", "S")
    val bot = rpsTable[Random.nextInt(rpsTable.size)]
    val result = rpsTable.indexOf(user) - rpsTable.indexOf(bot)

    when {
        result == 0 -> println("$user vs $bot Draw")
        result == 1 || result == -2 -> println("$user vs $bot You Win")
        else -> println("$user vs $bot You Lose")
    }
}
