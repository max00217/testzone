class Add<T:Number>{
    var v = 0.0

    fun sum(value:T){
        v+= value.toDouble()
        println("sum value is $v")
    }
}

fun main(){
    val adder = Add<Number>()
    adder.sum(37)
    adder.sum(10.0)
}