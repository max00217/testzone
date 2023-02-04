package Fn

fun main(){
    squre(3,{i -> i*i})
    squre(3){i -> i*i}
    squre(3){it * it}

    introduce{f, l -> "Hello my name is $f $l"}
    introduce{f, _ -> "Hello my name is $f"}
    introduce{_, l -> "Hello my name is $l"}

    introduce0( "A", "B", {f, l -> "Hello my name is $f $l"})
    introduce0( "A", "B"){f, l -> "Hello my name is $f $l"}
}
fun squre(n: Int, out:(Int)->Int) = println(out(n))

fun introduce(out: (String, String) ->String){
    println(out("A","B"))
}
fun introduce0(first: String, last: String, out:(String, String)->String){
    println(out(first, last))
}