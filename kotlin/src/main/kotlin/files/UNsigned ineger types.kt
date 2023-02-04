fun main(){
    val b: UByte = 1u
    val s: UShort = 1u
    val l: ULong = 1u

    val a1 = 42u //UInt
    val a2 = 0xFFFF_FFFF_FFFFu //ULong
    val a = 1UL //Ulong

    println(b)
    println(s)
    println(l)
    println(a1)
    println(a2)
    println(a)


    val intArr1 = arrayOf<Int>(5, 7, 3, 2)
    val intArr2 = intArr1.plus(4)
    println("intArr1 is ${intArr1.contentToString()}")
    println("intArr2 is ${intArr2.contentToString()}")

    val intArr3 = arrayOf<Int>(5, 7, 3, 2)
    val intArr4 = intArr3.sliceArray(1..3)
    println("intArr3 is ${intArr3.contentToString()}")
    println("intArr4 is ${intArr4.contentToString()}")

}