fun main(){
    val x:IntArray = intArrayOf(1, 2, 3)
    println(x.contentToString())
    x[0]  = x[1] + x[2]
    println(x.contentToString())
}
