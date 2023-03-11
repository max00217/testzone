fun foo() {
    listOf(1,2,3,4,5).forEach {
        if (it == 3) return
        print(" $it")
    }
    println("this point is unreachable")

}

fun main() {
    foo()
    println(" End foo()")
}


