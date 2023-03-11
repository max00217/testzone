fun main() {
    /* val a = 5
    val b = 10
    var max: Int
    if (a > b) {
        max = a
    } else {
        max = b
    }
    print(max)

     */

    /*
    val a = 5
    val b = 10
    val max = if (a > b) a else b
    print(max)
     */

    /*
    val a = 5
    val b = 10
    val max = if (a > b) {
        println("Choose a")
        a
    } else if (a == b) {
        println("Same value")
        a
    } else {
        println("Choose b")
        b
    }
    print(max)

     */

    /*
    val x = 2
    when (x) {
        1 -> print("x == 1")
        2 -> print("x == 2")
        else -> {
            print("x is neither 1 nor 2")
        }
    }

     */

    /*
    val x = 2
    val s = "3"
    when (x) {
        s.toInt() -> print("s encodes x")
        else -> print("s does not encode")
    }
    */

    val x: Int = 1
    when {
        (x%2 == 1) -> print("x is odd")
        (x%2 == 0) -> print("y is even")
        else -> print("It's wrong")
    }
}