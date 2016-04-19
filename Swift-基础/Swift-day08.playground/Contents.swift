//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
///方法 
///实例方法
class Counter {

    var count = 0
    func increment(){
    
        count++
    }
    func incrementBy(amount : Int){
    
        count += amount
    }
    
    func reset(){
    
        count = 0
    }
    
}
///实例方法的调用
let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()
/**
*  方法的局部参数名称和外部参数名称
具体来说，Swift 默认仅给方法的第一个参数名称一个局部参数名称;默认同时给第二个和后续的参数名称局部参数名称和外部参数名称。这个约定与典型的命名和调用约定相适应，与你在写 Objective-C 的方法时很相似。这个约定还让表达式方法在调用时不需要再限定参数名称。
*/
class Counter2 {

    var count : Int = 0
    func incrementBy(#amount:Int ,numberofTime:Int){
    
        count += amount * numberofTime
    }
}

let counter2 = Counter2()
counter2.incrementBy(amount:2, numberofTime: 3)
/**
*  修改方法的外部参数名称(Modifying External Parameter Name Behavior for Methods)

有时为方法的第一个参数提供一个外部参数名称是非常有用的，尽管这不是默认的行为。你可以自己添加一个显式的外部名称或者用一个井号（#）作为第一个参数的前缀来把这个局部名称当作外部名称使用。

相反，如果你不想为方法的第二个及后续的参数提供一个外部名称，可以通过使用下划线（_）作为该参数的显式外部名称，这样做将覆盖默认行为。
*/


/**
*  如果参数名称和属性名称一样 并且在方法内部需要用到属性名称可以使用self修饰
使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。在这种情况下，参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。这时你可以使用self属性来区分参数名称和属性名称。
*/

/**
*  在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)

结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。

但是，如果你确实需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中。方法还可以给它隐含的self属性赋值一个全新的实例，这个新实例在方法结束后将替换原来的实例。
*/

struct Point {

    var x = 0.0 , y = 0.0
    mutating func moveBux(deltaX : Double,y deltaY : Double){
    
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBux(2.0, y: 3.0)

/**
*  类型方法
实例方法是被类型的某个实例调用的方法。你也可以定义类型本身调用的方法，这种方法就叫做类型方法。声明类的类型方法，在方法的func关键字之前加上关键字class；声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。
*/
class SomeClass{

    class func someTypeMethod() {
    
    }
}


struct SomeStruct{

    static func someType_structMethod(){
    
    }
}
/**
*  下标脚本语法
*/

struct TimesTable {

    let multiplier : Int
    /**
    可以通过下标访问的方法
    
    :param: index index description
    
    :returns: return value description
    */
    subscript(index:Int)-> Int {
    //只读类型
        return multiplier * index
    }
}

let timesTable  = TimesTable(multiplier: 6)
timesTable[6]


/**
*  下标脚本选项

下标脚本允许任意数量的入参索引，并且每个入参类型也没有限制。下标脚本的返回值也可以是任何类型。下标脚本可以使用变量参数和可变参数，但使用写入读出（in-out）参数或给参数设置默认值都是不允许的。

一个类或结构体可以根据自身需要提供多个下标脚本实现，在定义下标脚本时通过入参个类型进行区分，使用下标脚本时会自动匹配合适的下标脚本实现运行，这就是下标脚本的重载。

一个下标脚本入参是最常见的情况，但只要有合适的场景也可以定义多个下标脚本入参。如下例定义了一个Matrix结构体，将呈现一个Double类型的二维矩阵。Matrix结构体的下标脚本需要两个整型参数：
*/


struct Matrix {

    let rows : Int ,columns : Int
    var grid : [ Double ]
    init(rows:Int ,columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array (count: rows * columns , repeatedValue: 0.0)
    }
    func indexIsValidForRow(row : Int ,colimn : Int ) -> Bool{
    
        return row >= 0 && row < rows && colimn >= 0  && colimn < columns
    }
    subscript(row:Int, column : Int )->Double{
    
        get{
        
            return grid[(row * columns) + column]
        }
        
        set {
        
            grid[row * columns + column] = newValue
        }
        
    }
    
    
}

/**
*  继承（Inheritance）
*/

class Vehicle {

    var currentSpeed = 0.0
    var description : String {
    
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise (){
    
        
    }
}

class Bicycle : Vehicle {

    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0

class Tandem : Bicycle {

    var currentNumberOfPassengers = 0
    
}

let tandem = Tandem ()
tandem.hasBasket = true
tandem.currentSpeed = 22.0
tandem.currentNumberOfPassengers = 2

print("Tandem : \(tandem.description)")

/**
*  重写方法

重写（Overriding）

子类可以为继承来的实例方法（instance method），类方法（class method），实例属性（instance property），或下标脚本（subscript）提供自己定制的实现（implementation）。我们把这种行为叫重写（overriding）。

如果要重写某个特性，你需要在重写定义的前面加上override关键字。这么做，你就表明了你是想提供一个重写版本，而非错误地提供了一个相同的定义。意外的重写行为可能会导致不可预知的错误，任何缺少override关键字的重写都会在编译时被诊断为错误。

override关键字会提醒 Swift 编译器去检查该类的超类（或其中一个父类）是否有匹配重写版本的声明。这个检查可以确保你的重写定义是正确的。

访问超类的方法，属性及下标脚本

当你在子类中重写超类的方法，属性或下标脚本时，有时在你的重写版本中使用已经存在的超类实现会大有裨益。比如，你可以优化已有实现的行为，或在一个继承来的变量中存储一个修改过的值。

在合适的地方，你可以通过使用super前缀来访问超类版本的方法，属性或下标脚本：

在方法someMethod的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod方法。
在属性someProperty的 getter 或 setter 的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
在下标脚本的重写实现中，可以通过super[someIndex]来访问超类版本中的相同下标脚本。

*/

class Train : Vehicle {

    override func makeNoise() {
    
        print("choo choo")
    }
}

let train = Train ()
train.makeNoise()

/**
*  属性重写
你可以将一个继承来的只读属性重写为一个读写属性，只需要你在重写版本的属性里提供 getter 和 setter 即可。但是，你不可以将一个继承来的读写属性重写为一个只读属性。
*/

class Car : Vehicle {

    var gear = 1
    override var description : String {
    
        return super.description + " in gear \(gear)"
    }
    
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car :\(car.description)")



/**
*  重写属性观察器
注意：
你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供willSet或didSet实现是不恰当。此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。

防止重写

你可以通过把方法，属性或下标脚本标记为final来防止它们被重写，只需要在声明关键字前加上final特性即可。（例如：final var, final func, final class func, 以及 final subscript）

如果你重写了final方法，属性或下标脚本，在编译时会报错。在扩展中，你添加到类里的方法，属性或下标脚本也可以在扩展的定义里标记为 final。

你可以通过在关键字class前添加final特性（final class）来将整个类标记为 final 的，这样的类是不可被继承的，否则会报编译错误。
*/

class AutomaticCar : Car {

    override var currentSpeed: Double {
    
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
    
    final var hhe = 0
    
}


















