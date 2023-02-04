package Fn

fun addOne(x: Int = 0, y:Int = 1): Int {
    return x + y
}

fun main(){
    val result1 = addOne()
    val result2 = addOne(3)
    val result3 = addOne(4, 1)
    val result4 = addOne(y = 192848975)
    val result5 = addOne(x = 935893752)
    println("result1 = $result1 \nresult2 = $result2 \nresult3 = $result3 \nresult4 = $result4 \nresult5 = $result5")
}
