//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

///属性
class DataImporter {

    var fileName = "data.txt"

}
/*
延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用lazy来标示一个延迟存储属性。

注意：
必须将延迟存储属性声明成变量（使用var关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
延迟属性很有用，当属性的值依赖于在实例的构造过程结束前无法知道具体值的外部因素时，或者当属性的值需要复杂或大量计算时，可以只在需要的时候来计算它。
*/
class DataManager {
        //******lazy 延迟存储属性 在第一次被访问的时候才会被创建
    lazy var importer = DataImporter()
    var data = [String]()
}

let manage = DataManager()

manage.data.append("some data")
manage.data.append("some more data")

/**
*  计算属性
*/
struct Point {

    var x = 0.0,y = 0.0
    
}
struct Size {

    var width = 0.0 , heigth = 0.0
    
}

struct Rect {

    var origin = Point()
    var size = Size()
    var center : Point {
    
        get {
        
            let centerX =origin.x + (size.width/2)
            let centerY = origin.y + (size.heigth/2)
            return Point(x: centerX, y: centerY)
        
        }
        set(newCenter){
        
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.heigth/2
        }
    }
    
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width:10.0 ,heigth : 10.0 ))
let initialSquarecenter = square.center
square.center  = Point(x: 15.0, y: 15.0)
println("square.origin is now at (\(square.origin.x),\(square.origin.y))")
//如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称newValue
//newValue 
/*
只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。

注意：

必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let关键字只用来声明常量属性，表示初始化后再也无法修改的值。
只读计算属性的声明可以去掉get关键字和花括号：
*/
struct Cuboid {

    var width = 0.0,height = 0.0 ,depth = 0.0
    var volume :Double{
        return width * height * depth
    }
}
/*
属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。

可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重载属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。属性重载请参考继承一章的重载。

注意：
不需要为无法重载的计算属性添加属性观察器，因为可以通过 setter 直接监控和响应值的变化。
可以为属性添加如下的一个或全部观察器：

willSet在设置新的值之前调用
didSet在新的值被设置之后立即调用
willSet观察器会将新的属性值作为固定参数传入，在willSet的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称newValue表示。

类似地，didSet观察器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名oldValue。

注意：

willSet和didSet观察器在属性初始化过程中不会被调用，它们只会当属性的值在初始化之外的地方被设置时被调用。
这里是一个willSet和didSet的实际例子，其中定义了一个名为StepCounter的类，用来统计当人步行时的总步数，可以跟计步器或其他日常锻炼的统计装置的输入数据配合使用。
*/

class StepCounter {

    var totalSteps : Int = 0{
    
        willSet(newTotalSteps){
        
            println("totalSteps new = \(newTotalSteps)")
        }
        didSet {
        
            if totalSteps > oldValue{
            
                println("added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

/*
类型属性语法 实际上就是 类可以直接调用的属性

在 C 或 Objective-C 中，静态常量和静态变量的定义是通过特定类型加上global关键字。在 Swift 编程语言中，类型属性是作为类型定义的一部分写在类型最外层的花括号内，因此它的作用范围也就在类型支持的范围内。

使用关键字static来定义值类型的类型属性，关键字class来为类（class）定义类型属性。下面的例子演示了存储型和计算型类型属性的语法：
*/

struct SomeStruct{


    static var storeType = "some value"
    static var computedType : Int {
    
        return 5
    }
}
class SomeClass {

    class var compp : Int  {
    
        return 10
    }

}











