fun main(){
    val intList:List<Int> = listOf(1,2,3,4)
    println("int type list = ${intList.joinToString("," )}")
    val emptyList:List<String> = emptyList<String>()
    println("empty List = ${emptyList.joinToString(",")}")
    val NotNullList:List<String> = listOfNotNull<String>(null, "a","b","c")
    println("not null List = ${NotNullList.joinToString(",")}")
    val arrayList:ArrayList<Int> = arrayListOf<Int>(1,2,3,4)
    println("array List = ${arrayList.joinToString(",")}")
    arrayList.add(5)
    println("array List after add = ${arrayList.joinToString(",")}")
    val mutableList: MutableList<String> = mutableListOf("a","b","c")
    println("mutable List = ${mutableList.joinToString(",")}")
    mutableList.addAll(arrayOf("e","f"))
    println("mutable List after add = ${mutableList.joinToString(",")}")

}
