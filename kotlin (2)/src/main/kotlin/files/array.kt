fun main(){
    val arr = arrayOf(1,2,3)
    val arrNull = arrayOfNulls<Int>(3)
    val asc = Array(5, {i->i*i})
    val asc2 = Array(5 ){i->(i*i).toString()}
    val intArr1 = arrayOf<Int>(1, 2, 3)
    val intArr2 = intArrayOf(1, 2, 3)
    val charArr = charArrayOf('a', 'b', 'c')
    val booleanArr = booleanArrayOf()
    val longArr = longArrayOf()

    println(arr.contentToString())
    println(arrNull.contentToString())
    println(asc.contentToString())
    println(asc2.contentToString())
    asc2.forEach{println(it)}
    println(intArr1.contentToString())
    println(intArr2.contentToString())
    println(charArr.contentToString())
}