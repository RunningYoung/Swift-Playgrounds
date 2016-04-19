//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
///析构过程
/*
析构过程原理

Swift 会自动释放不再需要的实例以释放资源。如自动引用计数那一章描述，Swift 通过自动引用计数（ARC）处理实例的内存管理。通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前关闭该文件。

在类的定义中，每个类最多只能有一个析构函数。析构函数不带任何参数，在写法上不带括号：

deinit {
// 执行析构过程
}
析构函数是在实例释放发生前一步被自动调用。不允许主动调用自己的析构函数。子类继承了父类的析构函数，并且在子类析构函数实现的最后，父类的析构函数被自动调用。即使子类没有提供自己的析构函数，父类的析构函数也总是被调用。

因为直到实例的析构函数被调用时，实例才会被释放，所以析构函数可以访问所有请求实例的属性，并且根据那些属性可以修改它的行为（比如查找一个需要被关闭的文件的名称）。
*/
struct Bank {

    static var coinsInBank = 10_100
    static func vendCoins(var numberIfCoinsToVend : Int) -> Int{
    
        numberIfCoinsToVend = min(numberIfCoinsToVend ,coinsInBank)
        coinsInBank -= numberIfCoinsToVend
        return numberIfCoinsToVend
    }
    static func receiveCoins(coins : Int){
    
        coinsInBank += coins
    }
}

class Player{

    var coinsInPurse : Int
    init(coins : Int){
    
        coinsInPurse = Bank.vendCoins(coins)
    }
    
    func winCoins(coins : Int){
    
    
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
    
        Bank.receiveCoins(coinsInPurse)
    }
}

var playerOne : Player? = Player(coins: 100)

playerOne!.winCoins(2_000)

playerOne = nil

/**
*  自动引用计数
*/
class Personss {

    let name: String
    init (name:String){
        self.name = name
        print("\(name) is being initialized")
    }
    deinit{
    
        print("\(name) is being deinitialized")
    }
}

var reference1 : Personss?
var reference2 : Personss?
var reference3 : Personss?
reference1 = Personss(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference2 = nil
reference1 = nil

reference3 = nil


/**
*  类实例之间的循环强引用
产生
*/

class Person {
    let name: String
    init(name:String){self.name = name}
    var apartment : Apartment?
    deinit{
        print("\(name) is being deinitialized")
    }
}

class Apartment {

    let number :Int
    init(number : Int){
        self.number = number
    }
    //解决循环强引用
   weak var tenat : Person?
    deinit{
        println(" Apartment #\(number) is being deinitialized")
    }
}

var john : Person?
var number34 :Apartment?

john = Person(name: "John Appleseed")
number34 = Apartment(number: 34)

john!.apartment = number34
number34!.tenat = john

john = nil
number34 = nil
/**
*  弱引用

弱引用不会牢牢保持住引用的实例，并且不会阻止 ARC 销毁被引用的实例。这种行为阻止了引用变为循环强引用。声明属性或者变量时，在前面加上weak关键字表明这是一个弱引用。

在实例的生命周期中，如果某些时候引用没有值，那么弱引用可以阻止循环强引用。如果引用总是有值，则可以使用无主引用，在无主引用中有描述。在上面Apartment的例子中，一个公寓的生命周期中，有时是没有“居民”的，因此适合使用弱引用来解决循环强引用。

注意:
弱引用必须被声明为变量，表明其值能在运行时被修改。弱引用不能被声明为常量。
因为弱引用可以没有值，你必须将每一个弱引用声明为可选类型。可选类型是在 Swift 语言中推荐的用来表示可能没有值的类型。

因为弱引用不会保持所引用的实例，即使引用存在，实例也有可能被销毁。因此，ARC 会在引用的实例被销毁后自动将其赋值为nil。你可以像其他可选值一样，检查弱引用的值是否存在，你永远也不会遇到被销毁了而不存在的实例。
*/


/**
*  无主引用

和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用是永远有值的。因此，无主引用总是被定义为非可选类型（non-optional type）。你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用。

由于无主引用是非可选类型，你不需要在使用它的时候将它展开。无主引用总是可以被直接访问。不过 ARC 无法在实例被销毁后将无主引用设为nil，因为非可选类型的变量不允许被赋值为nil。

注意:
如果你试图在实例被销毁后，访问该实例的无主引用，会触发运行时错误。使用无主引用，你必须确保引用始终指向一个未销毁的实例。
还需要注意的是如果你试图访问实例已经被销毁的无主引用，程序会直接崩溃，而不会发生无法预期的行为。所以你应当避免这样的事情发生。
*/
class Customer {

    let name :String
    var card :CreditCard?
    init(name:String){
    
        self.name = name
    }
    deinit{
    
        println("\(name) is being deinitialized")
    }
    
}
class CreditCard {

    let number :Int
    unowned let customer :Customer
    init(number :Int,customer :Customer){
    
        self.number = number
        self.customer = customer
    }
    deinit{
    
        println("Card #\(number) is being deinitialized")
    }
}
var john2 :Customer?

john2 = Customer(name: "John Appleseed")

john2!.card = CreditCard(number: 1234_5678_9012_3456, customer: john2!)

john2 = nil


/**
*  无主引用以及隐式解析可选属性

上面弱引用和无主引用的例子涵盖了两种常用的需要打破循环强引用的场景。

Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。

Customer和CreditCard的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil，并会潜在的产生循环强引用。这种场景最适合通过无主引用来解决。

然而，存在着第三种场景，在这种场景中，两个属性都必须有值，并且初始化完成后不能为nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。

这使两个属性在初始化完成后能被直接访问（不需要可选展开），同时避免了循环引用。这一节将为你展示如何建立这种关系。
*/

/*
两段式构造过程

Swift 中类的构造过程包含两个阶段。第一个阶段，每个存储型属性通过引入它们的类的构造器来设置初始值。当每一个存储型属性值被确定后，第二阶段开始，它给每个类一次机会在新实例准备使用之前进一步定制它们的存储型属性。

两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过程可以防止属性值在初始化之前被访问；也可以防止属性被另外一个构造器意外地赋予不同的值。

注意：
Swift的两段式构造过程跟 Objective-C 中的构造过程类似。最主要的区别在于阶段 1，Objective-C 给每一个属性赋值0或空值（比如说0或nil）。Swift 的构造流程则更加灵活，它允许你设置定制的初始值，并自如应对某些属性不能以0或nil作为合法默认值的情况。
Swift 编译器将执行 4 种有效的安全检查，以确保两段式构造过程能顺利完成：

安全检查 1

指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器。

如上所述，一个对象的内存只有在其所有存储型属性确定之后才能完全初始化。为了满足这一规则，指定构造器必须保证它所在类引入的属性在它往上代理之前先完成初始化。

安全检查 2

指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。如果没这么做，指定构造器赋予的新值将被父类中的构造器所覆盖。

安全检查 3

便利构造器必须先代理调用同一类中的其它构造器，然后再为任意属性赋新值。如果没这么做，便利构造器赋予的新值将被同一类中其它指定构造器所覆盖。

安全检查 4

构造器在第一阶段构造完成之前，不能调用任何实例方法、不能读取任何实例属性的值，self的值不能被引用。

类实例在第一阶段结束以前并不是完全有效，仅能访问属性和调用方法，一旦完成第一阶段，该实例才会声明为有效实例。

以下是两段式构造过程中基于上述安全检查的构造流程展示：

阶段 1

某个指定构造器或便利构造器被调用；
完成新实例内存的分配，但此时内存还没有被初始化；
指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化；
指定构造器将调用父类的构造器，完成父类属性的初始化；
这个调用父类构造器的过程沿着构造器链一直往上执行，直到到达构造器链的最顶部；
当到达了构造器链最顶部，且已确保所有实例包含的存储型属性都已经赋值，这个实例的内存被认为已经完全初始化。此时阶段1完成。
阶段 2

从顶部构造器链一直往下，每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
最终，任意构造器链中的便利构造器可以有机会定制实例和使用self。

*/

class Country{

    let name: String
    var capitalCity :City!
    init(name: String, capitalname: String){
        self.name = name
        self.capitalCity = City(name: capitalname, country: self)
    }
}

class City {

    let name :String
    unowned let country :Country
    init(name: String, country : Country){
    
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalname: "Ottawa")

/**
*  闭包引起的循环强引用

前面我们看到了循环强引用环是在两个类实例属性互相保持对方的强引用时产生的，还知道了如何用弱引用和无主引用来打破循环强引用。

循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了实例。这个闭包体中可能访问了实例的某个属性，例如self.someProperty，或者闭包中调用了实例的某个方法，例如self.someMethod。这两种情况都导致了闭包 “捕获" self，从而产生了循环强引用。

循环强引用的产生，是因为闭包和类相似，都是引用类型。当你把一个闭包赋值给某个属性时，你也把一个引用赋值给了这个闭包。实质上，这跟之前的问题是一样的－两个强引用让彼此一直有效。但是，和两个类实例不同，这次一个是类实例，另一个是闭包。

Swift 提供了一种优雅的方法来解决这个问题，称之为闭包占用列表（closuer capture list）。同样的，在学习如何用闭包占用列表破坏循环强引用之前，先来了解一下循环强引用是如何产生的，这对我们是很有帮助的。
*/







/**
*  解决闭包引起的循环强引用

在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。捕获列表定义了闭包体内捕获一个或者多个引用类型的规则。跟解决两个类实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。应当根据代码关系来决定使用弱引用还是无主引用。

注意:
Swift 有如下要求：只要在闭包内使用self的成员，就要用self.someProperty或者self.someMethod（而不只是someProperty或someMethod）。这提醒你可能会不小心就捕获了self。
定义捕获列表

捕获列表中的每个元素都是由weak或者unowned关键字和实例的引用（如self或someInstance）成对组成。每一对都在方括号中，通过逗号分开。

捕获列表放置在闭包参数列表和返回类型之前：

lazy var someClosure: (Int, String) -> String = {
[unowned self] (index: Int, stringToProcess: String) -> String in
// closure body goes here
}
如果闭包没有指定参数列表或者返回类型，则可以通过上下文推断，那么可以捕获列表放在闭包开始的地方，跟着是关键字in：

lazy var someClosure: () -> String = {
[unowned self] in
// closure body goes here
}
弱引用和无主引用

当闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。

相反的，当捕获引用有时可能会是nil时，将闭包内的捕获定义为弱引用。弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil。这使我们可以在闭包内检查它们是否存在。

注意:
如果捕获的引用绝对不会置为nil，应该用无主引用，而不是弱引用。
前面的HTMLElement例子中，无主引用是正确的解决循环强引用的方法。这样编写HTMLElement类来避免循环强引用：

class HTMLElement {

let name: String
let text: String?

lazy var asHTML: () -> String = {
[unowned self] in
if let text = self.text {
return "<\(self.name)>\(text)</\(self.name)>"
} else {
return "<\(self.name) />"
}
}

init(name: String, text: String? = nil) {
self.name = name
self.text = text
}

deinit {
println("\(name) is being deinitialized")
}

}
上面的HTMLElement实现和之前的实现一致，只是在asHTML闭包中多了一个捕获列表。这里，捕获列表是[unowned self]，表示“用无主引用而不是强引用来捕获self”。

和之前一样，我们可以创建并打印HTMLElement实例：

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
println(paragraph!.asHTML())
// prints "<p>hello, world</p>"
使用捕获列表后引用关系如下图所示：



这一次，闭包以无主引用的形式捕获self，并不会持有HTMLElement实例的强引用。如果将paragraph赋值为nil，HTMLElement实例将会被销毁，并能看到它的析构函数打印出的消息。

paragraph = nil
// prints "p is being deinitialized"
*/


//[unowned self]
//[weak self]













