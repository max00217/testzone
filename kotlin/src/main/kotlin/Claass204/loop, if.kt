package Claass204

fun main(){
    /*var mylist = listOf(1,2,3,4,5)

    println("for Example")
    for(item in mylist)
        println(item)

    println("\nforEach Example")
    mylist.forEach{println(it)}

    println("\n------------------------------\n")

    println("for Example")

    for(i in 1..9){
        println("2*$i = ${2*i}")
    }

    var q = "a"
    for(i in 1..5) {
        println("q*$i")
    }

    println("\n------------------------------\n")

    println("if Example")

    var a = 5
    var b = 10
    val max = if (a > b) {
        println("a is bigger than b")
        a
    } else if (a == b) {
        println("Same value")
        a
    } else {
        println("b is bigger than a")
        b
    }
    println(max)

    println("\n------------------------------\n")

    println("when Example")

    val x: Int = 1
    when {
        (x%2 == 1) -> println("x is odd")
        (x%2 == 0) -> println("y is even")
        else -> println("It's wrong")
    }*/

    for (i in 1..9){
        for (j in 2..9){
            println("$i * $j = ${i*j}")
        }
    }

    (2..9).forEach { i ->
        (1..10).forEach { j ->
            println("$i * $j = ${i*j}")
        }
        println()
    }
}