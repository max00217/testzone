fun oo() {
    listOf(1, 2, 3, 4, 5).forEach lit@{
        if (it ==3) return@lit
        print(" $it")
    }
    println(" done with explict lable")
}

fun main(){
    oo()
    println(" End oo()")
}