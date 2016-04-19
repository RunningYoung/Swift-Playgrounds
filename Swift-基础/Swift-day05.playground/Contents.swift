//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

///闭包
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var revrrsd = sorted(names,{(s1:String , s2 : String) -> Bool in

    return s1 > s2
})

//Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数。 $1 代表第二个参数
revrrsd = sorted(names,{$0 < $1})

println(revrrsd)

