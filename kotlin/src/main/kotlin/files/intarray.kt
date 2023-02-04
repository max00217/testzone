fun main(){
    //Array of int of size 5 with values [0, 0, 0, 0, 0]
    val arr1 = IntArray(5)
    println(arr1.contentToString())
    //Example of initializing the values in the array with a constant
    //array of int of size 5 with values [42, 42, 42, 42,42]
    val arr2 = IntArray(5) {42}
    println(arr2.contentToString())
    //Example of initializing the values in the array using a lambda
    //Array of int of size 5 with values [0, ,2 ,3, 4, 5] (values initialized to their index value)
    val arr3 = IntArray(5){it * 1}
    println(arr3.contentToString())
}