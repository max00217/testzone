package Fn

fun main(){
    val simpleLambda : () -> Unit = {println("Hello, simple Lambda Test")}

    simpleLambda()

    val complexLambda1 =
        {firstName : String, lastName:String -> "Hello. My name is $firstName $lastName"}

    println(complexLambda1("I", "O"))

    val complexLambda2 : (String, String) -> String =
        {firstName, lastName -> "Hello. My name is $firstName $lastName"}

    println(complexLambda2("O", "I"))


    val sum1: (Int, Int) -> Int = { x: Int, y: Int -> x + y}
    val sum2 = {x: Int, y: Int -> x + y}
    val sum3 = fun (x:Int, y: Int): Int = x + y
    val sum4 = fun(x: Int, y : Int): Int {return x + y}

    println(sum1(2,3))
    println(sum2(2,3))
    println(sum3(2,3))
    println(sum4(2,3))
}

