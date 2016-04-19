//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
枚举类型

- North: North description
- South: South description
- East:  East description
- West:  West description
*/
enum CompassPoint {

    case North
    case South
    case East
    case West

}
enum Planet {

    case Mercury,venus

}

var dir = CompassPoint.North

println(dir)


dir = .East

switch dir {

case .East:
    println("east")
case .North:
    println("Weast")
default:
    println("ss")

}

enum ProductBarcode {

    case UPCA(Int,Int,Int)
    case QRCode(String)
    
}
var productBarcode = ProductBarcode.UPCA(15, 20, 30)
productBarcode = ProductBarcode.QRCode("procode")

switch productBarcode {

case .UPCA(let a , let b ,let c):
    println("a = \(a)  b = \(b) c = \(c)")
case .QRCode(let str):
    println(" string = \(str)")

}

enum Order : Int
{
    case Mear = 2 ,a,vm,ve,vv
}

println(Order.a.rawValue)
println(Order.a.hashValue)

/**
*  结构体和类
*/

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {

    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//实例化
let someResolution = Resolution()
let someVideoMode = VideoMode()
//属性访问
println("The with of someResolution is \(someResolution.width)")
//属性赋值
someVideoMode.resolution.width = 320
//所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中：
//与结构体不同，类实例没有默认的成员逐一构造器。构造过程章节会对构造器进行更详细的讨论。
let vga = Resolution(width: 640, height: 480)



//结构体和枚举 值类型被赋予给一个变量，常数或者本身被传递给一个函数的时候，实际上操作的是其的拷贝。

let hd = Resolution(width: 180, height: 90)
var com = hd

com.width = 220

println(hd.width)

/*
恒等运算符
请注意“等价于"（用三个等号表示，===） 与“等于"（用两个等号表示，==）的不同：

“等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
“等于”表示两个实例的值“相等”或“相同”，判定时要遵照类设计者定义定义的评判标准，因此相比于“相等”，这是一种更加合适的叫法。
等价于 （ === ）
不等价于 （ !== ）

************************* 指针 ***********

如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地址。一个 Swift 常量或者变量引用一个引用类型的实例与 C 语言中的指针类似，不同的是并不直接指向内存中的某个地址，而且也不要求你使用星号（*）来表明你在创建一个引用。Swift 中这些引用与其它的常量或变量的定义方式相同。
*/

/*
集合（Collection）类型的赋值和拷贝行为

Swift 中字符串（String）,数组（Array）和字典（Dictionary）类型均以结构体的形式实现。这意味着String，Array，Dictionary类型数据被赋值给新的常量(或变量），或者被传入函数（或方法）中时，它们的值会发生拷贝行为（值传递方式）。

Objective-C中字符串（NSString）,数组（NSArray）和字典（NSDictionary）类型均以类的形式实现，这与Swfit中以值传递方式是不同的。NSString，NSArray，NSDictionary在发生赋值或者传入函数（或方法）时，不会发生值拷贝，而是传递已存在实例的引用。

注意： 以上是对于数组，字典，字符串和其它值的拷贝的描述。 在你的代码中，拷贝好像是确实是在有拷贝行为的地方产生过。然而，在 Swift 的后台中，只有确有必要，实际（actual）拷贝才会被执行。Swift 管理所有的值拷贝以确保性能最优化的性能，所以你也没有必要去避免赋值以保证最优性能。（实际赋值由系统管理优化）
*/





