fun main(){
    val a = 5
    var b = 3
    println("a + b == a.plus(b) ==> ${a + b} == ${a.plus(b)}")
    println("a - b == a.minus(b) ==> ${a - b} == ${a.minus(b)}")
    println("a * b == a.times(b) ==> ${a * b} == ${a.times(b)}")
    println("a / b == a.div(b) ==> ${a / b} == ${a.div(b)}")
    println("a % b == a.rem(b) ==> ${a % b} == ${a.rem(b)}")
    println("a .. b == a.rangeTo(b) ==> ${a .. b} == ${a.rangeTo(b)}")

    println("--------------------")

    var num1 = 10
    var num2 = 10
    println("num1 = $num1")
    println("num2 = $num2")
    println("++num1 = ${++num1}")
    println("num2++ = ${num1++}")
    println("num2++ = $num2")

    println("--------------------")

    var num3 = 10
    var num4 = 5
    var num5 = 5
    println("num3 > num4 ==> ${num3.compareTo(num4)}")
    println("num4 < num3 ==> ${num4.compareTo(num3)}")
    println("num4 == num5 ==> ${num4.compareTo(num5)}")

    println("--------------------")

    var num6 = 10
    var num7 = 10
    var str1 = "ABC"
    var str2 = "ABC"
    var str3 = "DEF"

    println("num6 === num7 --> ${num6 === num7}")
    println("str1 === str2 --> ${str1 === str2}")
    println("str1 === str3 --> ${str1 === str3}")

    println("--------------------")

    val myTrue: Boolean = true
    val myFalse: Boolean = false
    val boolNull: Boolean? = null

    println(myTrue || myFalse)
    println(myTrue && myFalse)
    println(!myTrue)
    println(boolNull)

    println("--------------------")

    val intArr1 = arrayOf(5, 7, 3, 2)
    println("3 in intArr1== intArr1.contains(3) is ${3 in intArr1} == ${intArr1.contains(3)}")
    println("1 !in intArr1== !intArr1.contains(1) is ${1 !in intArr1} == ${!intArr1.contains(1)}")

}