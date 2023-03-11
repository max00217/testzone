package Fn

fun addTwoNumbers(first:Int, second:Int): Int = first + second

fun sum(): (Int, Int) -> Int = {x, y->addTwoNumbers(x, y)}


fun isEvenOrOdd(number:Int):()->Unit{
    if(number % 2 == 0)
        return Even

    else
        return Odd
}

val Even = { println("Even")}

val Odd = {println("Odd")}

fun main(){
    val evenNumber = isEvenOrOdd(4)
    val oddNumber = isEvenOrOdd(3)
    evenNumber()
    oddNumber()



    val reverse = bar()
    print(reverse("str"))

    val summation = sum()
    println(summation(100,300))
}

fun bar():(String)->String={str->str.reversed()}