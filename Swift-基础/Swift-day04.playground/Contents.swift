//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
 var index = 0
for index ; index < 3 ; index++ {

    println("循环==\(index)")

    
}
println(index)

///函数
func sayHellp(personName:String)->String {

    let greeting = "Hello , "  + personName + " !"
    return greeting

}

println(sayHellp("Joke"))

func half(start: Int , end : Int)->Int{

    return end - start

}

println(half(1,10))

func says()->String {

    return "Hello world "
}
println(says())
//注意： 严格上来说，虽然没有返回值被定义，sayGoodbye 函数依然返回了值。没有定义返回类型的函数会返回特殊的值，叫 Void。它其实是一个空的元组（tuple），没有任何元素，可以写成()。
func says2() -> Void {
    println("无返回值");
}
println(says2())

func counts(string : String) ->(volwels :Int ,consnnants : Int) {

    var volwels = 0 ,consnnants = 0
    
    volwels = count(string) + 10
    consnnants += volwels
    
    return(volwels,consnnants)

}

//外部参数

func someFunc(extentParam localParam : String) -> String {


    return localParam + "waibu"
}

println(someFunc(extentParam: "Param "))
//默认参数 默认提供外部参数名

func join(#string : String , joins : String = " join") -> String {

    return string + joins
    
}
println(join(string: "xiaoming",joins : "_"))

func kebian(numbers : Double...) -> Double {

    var total : Int = 0
    for num in numbers {
    
        total += num
        total
    }
    
    return total
}

println(kebian(10.2,11.0,13.0))



func alihnRight(var string : String ) {


    string += "sss"
    
}

func outInput(inout a: String) -> String{


    a = "b"
    
    return a
}

var b = "ss"

println(outInput(&b))

/**
*  函数类型
*/

func addtwonsints(a : Int , b : Int ) ->Int {


    return a + b
    

}

var mathFunction :(Int , Int)-> Int

mathFunction = addtwonsints

func printMath (mathFun:(Int,Int)->Int,a : Int) -> Int
{

    return mathFun(a,6)

}

println(printMath(mathFunction, 2))








