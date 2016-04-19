//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/**
*  扩展（Extensions）
本页包含内容：

扩展语法
计算型属性
构造器
方法
下标
嵌套类型
扩展就是向一个已有的类、结构体或枚举类型添加新功能（functionality）。这包括在没有权限获取原始源代码的情况下扩展类型的能力（即逆向建模）。扩展和 Objective-C 中的分类（categories）类似。（不过与Objective-C不同的是，Swift 的扩展没有名字。）

Swift 中的扩展可以：

添加计算型属性和计算静态属性
定义实例方法和类型方法
提供新的构造器
定义下标
定义和使用新的嵌套类型
使一个已有类型符合某个协议
注意：
如果你定义了一个扩展向一个已有类型添加新功能，那么这个新功能对该类型的所有已有实例中都是可用的，即使它们是在你的这个扩展的前面定义的。

扩展语法（Extension Syntax）

声明一个扩展使用关键字extension：

extension SomeType {
// 加到SomeType的新功能写到这里
}
一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议（protocol）。当这种情况发生时，协议的名字应该完全按照类或结构体的名字的方式进行书写：

extension SomeType: SomeProtocol, AnotherProctocol {
// 协议实现写到这里
}
按照这种方式添加的协议遵循者（protocol conformance）被称之为在扩展中添加协议遵循者
*/
/**
*  添加 计算性实例属性
注意：
扩展可以添加新的计算属性，但是不可以添加存储属性，也不可以向已有属性添加属性观测器(property observers)。
*/
extension Double{

    var km: Double{
        return self * 1_000.0
    }
    var m: Double{
        return self
    }
    var cm: Double{
        return self  / 1_00
    }
    var mm: Double{
        return self / 1_000.0
    }
    var ft: Double{
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
let threeFeet = 3.ft
let aMarathon = 42.km + 195.m

/**
*  构造器（Initializers）

扩展可以向已有类型添加新的构造器。这可以让你扩展其它类型，将你自己的定制类型作为构造器参数，或者提供该类型的原始实现中没有包含的额外初始化选项。

扩展能向类中添加新的便利构造器，但是它们不能向类中添加新的指定构造器或析构函数。指定构造器和析构函数必须总是由原始的类实现来提供。

注意：
如果你使用扩展向一个值类型添加一个构造器，在该值类型已经向所有的存储属性提供默认值，而且没有定义任何定制构造器（custom initializers）时，你可以在值类型的扩展构造器中调用默认构造器(default initializers)和逐一成员构造器(memberwise initializers)。

正如在值类型的构造器代理中描述的，如果你已经把构造器写成值类型原始实现的一部分，上述规则不再适用。
*/

struct Size {

    var width = 0.0,height = 0.0
}
struct Point {

    var x = 0.0,y = 0.0
}
struct Rect {

    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberWiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {

    init(center: Point, size :Size){
    
        let originX = center.x - size.width / 2
        let originY = center.y  - size.height / 2
        self.init(origin:Point(x: originX, y: originY),size: size)
    }
}
/**
*  方法（Methods）

扩展可以向已有类型添加新的实例方法和类型方法。下面的例子向Int类型添加一个名为repetitions的新实例方法：
这个repetitions方法使用了一个() -> ()类型的单参数（single argument），表明函数没有参数而且没有返回值。
*/
extension Int{

    func repetitions(task :()->()){
    
        for i in 0..<self{
        
            task()
        }
    }
}

3.repetitions(
    {
    
        println("Hello!")
    }
)

/**
*  修改实例方法（Mutating Instance Methods）

通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating(在实例方法中修改属性值必须加mutating)，正如来自原始实现的修改方法一样。
*/
extension Int {

    mutating func square(){
    
        self = self * self
    }
}

var someInt = 4
someInt.square()
/**
*  下标（Subscripts）

扩展可以向一个已有类型添加新下标。这个例子向Swift内建类型Int添加了一个整型下标。该下标[n]返回十进制数字从右向左数的第n个数字

123456789[0]返回9
123456789[1]返回8
...等等
*/

extension Int{

    subscript(var digitIndex : Int)->Int{
    
        var decimalBase = 1
        while digitIndex > 0 {
        
            decimalBase *= 10
            --digitIndex
        }
        return(self / decimalBase) % 10
    }
}
7654321[1]
7654321[2]
7654321[3]
7654321[4]
7654321[5]
7654321[6]

/**
*  嵌套类型（Nested Types）

扩展可以向已有的类、结构体和枚举添加新的嵌套类型：
*/


extension Character {
    enum Kind {
        case Vowel, Consonant, Other
    }
    var kind: Kind {
        switch String(self).lowercaseString {
        case "a", "e", "i", "o", "u":
            return .Vowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .Consonant
        default:
            return .Other
        }
    }
}




func printLetterKinds(word: String) {
    println("'\(word)' is made up of the following kinds of letters:")
    for character in word {
        switch character.kind {
        case .Vowel:
            print("vowel ")
        case .Consonant:
            print("consonant ")
        case .Other:
            print("other ")
        }
    }
    print("\n")
}
printLetterKinds("Hello")
// 'Hello' is made up of the following kinds of letters:
// consonant vowel consonant consonant vowel




















