fun main(){
    var obj = "Kotlin"
    if (obj is String){
        print(obj.length)
    }
    var objj:String ?=null
    if (objj !is String) {//same as !(obj is string)
        print("Not a String")
} else {
    print(objj.length)
    }
}