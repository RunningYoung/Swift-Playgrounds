//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
*  协议
本页包含内容：

协议的语法（Protocol Syntax）
对属性的规定（Property Requirements）
对方法的规定（Method Requirements）
对突变方法的规定（Mutating Method Requirements）
对构造器的规定（Initializer Requirements）
协议类型（Protocols as Types）
委托(代理)模式（Delegation）
在扩展中添加协议成员（Adding Protocol Conformance with an Extension）
通过扩展补充协议声明（Declaring Protocol Adoption with an Extension）
集合中的协议类型（Collections of Protocol Types）
协议的继承（Protocol Inheritance）
类专属协议（Class-Only Protocol）
协议合成（Protocol Composition）
检验协议的一致性（Checking for Protocol Conformance）
对可选协议的规定（Optional Protocol Requirements）
协议(Protocol)用于定义完成某项任务或功能所必须的方法和属性，协议实际上并不提供这些功能或任务的具体实现(Implementation)--而只用来描述这些实现应该是什么样的。类，结构体，枚举通过提供协议所要求的方法，属性的具体实现来采用(adopt)协议。任意能够满足协议要求的类型被称为协议的遵循者。

协议可以要求其遵循者提供特定的实例属性，实例方法，类方法，操作符或下标脚本等。
*/
/**
*  协议的语法

协议的定义方式与类，结构体，枚举的定义都非常相似，如下所示:

protocol SomeProtocol {
// 协议内容
}
在类型名称后加上协议名称，中间以冒号:分隔即可实现协议；实现多个协议时，各协议之间用逗号,分隔，如下所示:

struct SomeStructure: FirstProtocol, AnotherProtocol {
// 结构体内容
}
如果一个类在含有父类的同时也采用了协议，应当把父类放在所有的协议之前，如下所示:

class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
// 类的内容
}
*/

/**
*  对属性的规定

协议可以规定其遵循者提供特定名称与类型的实例属性(instance property)或类属性(type property)，而不管其是存储型属性(stored property)还是计算型属性(calculate property)。此外也可以指定属性是只读的还是可读写的。

如果协议要求属性是可读写的，那么这个属性不能是常量存储型属性或只读计算型属性；如果协议要求属性是只读的(gettable)，那么计算型属性或存储型属性都能满足协议对属性的规定，在你的代码中，即使为只读属性实现了写方法(settable)也依然有效。

协议中的属性经常被加以var前缀声明其为变量属性，在声明后加上{ set get }来表示属性是可读写的，只读的属性则写作{ get }，如下所示:
*/
protocol SomeProtocol{

    var mustBeSettable : Int{get set}
    var doesNotNeedToBeSettable :Int {get}
    
}
/**
*  如下所示，通常在协议的定义中使用class前缀表示该属性为类成员；在枚举和结构体实现协议时中，需要使用static关键字作为前缀。
*/

protocol AnotherProtocol {
    
    static  var someTypeProperty : Int{get set}
}

protocol FullyNamed {

    var fullName :String{get}
}

struct Person : FullyNamed{

    var fullName :String
}
let john = Person(fullName: "John Appleseed")

class Starship : FullyNamed{

    var prefix : String?
    var name: String
    init(name:String,prefix:String?=nil){
    
        self.name = name
        self.prefix = prefix
    }
    var fullName : String{
    
        return(prefix != nil ? prefix! + " " :" ") + name
    }
}

var nc1293 = Starship(name: "Enterprise", prefix: "USS")
nc1293.fullName


/**
*  对方法的规定

协议可以要求其遵循者实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通的方法一样清晰的放在协议的定义中，而不需要大括号和方法体。

注意： 协议中的方法支持变长参数(variadic parameter)，不支持参数默认值(default value)。
如下所示，协议中类方法的定义与类属性的定义相似，在协议定义的方法前置class关键字来表示。当在枚举或结构体实现类方法时，需要使用static关键字来代替。
*/

protocol SomeP {
    
   static func someTypeMethod()
}

protocol RandomNumberGenerator{

    func random()->Double
}

class lineCG : RandomNumberGenerator,SomeP{

    var lastRandom = 42.0
    let m = 139967.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
    
    class func someTypeMethod() {
        println("daada")
    }
}

/**
*  对突变方法的规定

有时不得不在方法中更改实例的所属类型。在基于值类型(value types)(结构体，枚举)的实例方法中，将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改实例及其属性的所属类型。这一过程在Modifyting Value Types from Within Instance Methods章节中有详细描述。

如果协议中的实例方法打算改变其遵循者实例的类型，那么在协议定义时需要在方法前加mutating关键字，才能使结构体，枚举来采用并满足协议中对方法的规定。

注意: 用类实现协议中的mutating方法时，不用写mutating关键字;用结构体，枚举实现协议中的mutating方法时，必须写mutating关键字。
*/

protocol Togglable{
    mutating func toggle()
}
enum OnOfSwitch :Togglable{

    case Off,On
    //突变方法 允许方法改变属性的值
    mutating func toggle() {
        switch self{
        
        case Off:
            self = On
        case On:
            self = Off
        }
    }
    
}

var lightSwitch = OnOfSwitch.Off
lightSwitch.toggle()
/**
*  对构造器的规定

协议可以要求它的遵循类型实现特定的构造器。你可以像书写普通的构造器那样，在协议的定义里写下构造器的需求，但不需要写花括号和构造器的实体：

protocol SomeProtocol {
init(someParameter: Int)
}
协议构造器规定在类中的实现

你可以在遵循该协议的类中实现构造器，并指定其为类的特定构造器或者便捷构造器。在这两种情况下，你都必须给构造器实现标上"required"修饰符：

class SomeClass: SomeProtocol {
required init(someParameter: Int) {
//构造器实现
}
}
使用required修饰符可以保证：所有的遵循该协议的子类，同样能为构造器规定提供一个显式的实现或继承实现。

关于required构造器的更多内容，请参考required构造器

注意

如果类已经被“final”修饰符所标示，你就不需要在协议构造器规定的实现中使用"required"修饰符。因为final类不能有子类。关于final修饰符的更多内容，请参见防止重写
如果一个子类重写了父类的指定构造器，并且该构造器遵循了某个协议的规定，那么该构造器的实现需要被同时标示required和override修饰符

protocol SomeProtocol {
init()
}


class SomeSuperClass {
init() {
//协议定义
}
}


class SomeSubClass: SomeSuperClass, SomeProtocol {
// "required" from SomeProtocol conformance; "override" from SomeSuperClass
required override init() {
// 构造器实现
}
}
可失败构造器的规定

可以通过给协议Protocols中添加可失败构造器来使遵循该协议的类型必须实现该可失败构造器。

如果在协议中定义一个可失败构造器，则在遵顼该协议的类型中必须添加同名同参数的可失败构造器或非可失败构造器。 如果在协议中定义一个非可失败构造器，则在遵循该协议的类型中必须添加同名同参数的非可失败构造器或隐式解析类型的可失败构造器（init!）。
*/

protocol SomePro{

    init(someParameter :Int)
}

class SomeClass : SomePro{
    //使用ruquired修饰符 可以保证：所有遵循该协议的子类，同样能为构造器规定提供一个显示的实现或者继承实现
    required init(someParameter: Int) {
        println("create init")
    }
}
/**
*  协议类型

尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用。

使用场景:

协议类型作为函数、方法或构造器中的参数类型或返回值类型
协议类型作为常量、变量或属性的类型
协议类型作为数组、字典或其他容器中的元素类型
注意: 协议是一种类型，因此协议类型的名称应与其他类型(Int，Double，String)的写法相同，使用驼峰式写法
*/

class Dice {

    let sides :Int
    //协议类型是遵循了该协议的实例
    let generatorPro : RandomNumberGenerator
    /**
    例子中又一个Dice类，用来代表桌游中的拥有N个面的骰子。Dice的实例含有sides和generator两个属性，前者是整型，用来表示骰子有几个面，后者为骰子提供一个随机数生成器。
    
    generator属性的类型为RandomNumberGenerator，因此任何遵循了RandomNumberGenerator协议的类型的实例都可以赋值给generator，除此之外，无其他要求。
    
    Dice类中也有一个构造器(initializer)，用来进行初始化操作。构造器中含有一个名为generator，类型为RandomNumberGenerator的形参。在调用构造方法时创建Dice的实例时，可以传入任何遵循RandomNumberGenerator协议的实例给generator。
    
    Dice类也提供了一个名为roll的实例方法用来模拟骰子的面值。它先使用generator的random方法来创建一个[0-1]区间内的随机数种子，然后加工这个随机数种子生成骰子的面值。generator被认为是遵循了RandomNumberGenerator的类型，因而保证了random方法可以被调用。
    
    */
    init(sides:Int ,generator : RandomNumberGenerator){
    
        self.sides = sides
        self.generatorPro = generator
    }
    func roll() -> Int{
    
        return Int(generatorPro.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: lineCG())
for _ in 1...5 {

    println("Random dice roll is \(d6.roll())")
}

/**
*  委托(代理)模式

委托是一种设计模式(译者注: 想起了那年 UITableViewDelegate 中的奔跑，那是我逝去的Objective-C。。。)，它允许类或结构体将一些需要它们负责的功能交由(委托)给其他的类型的实例。

委托模式的实现很简单: 定义协议来封装那些需要被委托的函数和方法， 使其遵循者拥有这些被委托的函数和方法。

委托模式可以用来响应特定的动作或接收外部数据源提供的数据，而无需要知道外部数据源的所属类型(译者注:只要求外部数据源遵循某协议)。
*/


protocol DiceGame {

    var dice : Dice{get}
    func play()
}

protocol DiceGameDelegate{

    func gameDidStart (game : DiceGame)
    func game(game : DiceGame,didstartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game : DiceGame)
    
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: lineCG())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self,didstartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            println("Started a new game of Snakes and Ladders")
        }
        println("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didstartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        println("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        println("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

/**
*  在扩展中添加协议成员

即便无法修改源代码，依然可以通过扩展(Extension)来扩充已存在类型(译者注: 类，结构体，枚举等)。扩展可以为已存在的类型添加属性，方法，下标脚本，协议等成员。详情请在扩展章节中查看。
*/

protocol TextRepresentable{

    func asText ()-> String
}

extension Dice : TextRepresentable{

    func asText() -> String {
        return "A \(sides) - sided dice"
    }
}

/**
*  通过扩展补充协议声明

当一个类型已经实现了协议中的所有要求，却没有声明时，可以通过扩展来补充协议声明:

struct Hamster {
var name: String
func asText() -> String {
return "A hamster named \(name)"
}
}
extension Hamster: TextRepresentable {}
从现在起，Hamster的实例可以作为TextRepresentable类型使用

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
println(somethingTextRepresentable.asText())
// 输出 "A hamster named Simon"
注意: 即使满足了协议的所有要求，类型也不会自动转变，因此你必须为它做出明显的协议声明

集合中的协议类型

协议类型可以被集合使用，表示集合中的元素均为协议类型:

let things: [TextRepresentable] = [game,d12,simonTheHamster]
如下所示，things数组可以被直接遍历，并调用其中元素的asText()函数:

for thing in things {
println(thing.asText())
}
// A game of Snakes and Ladders with 25 squares
// A 12-sided dice
// A hamster named Simon
thing被当做是TextRepresentable类型而不是Dice，DiceGame，Hamster等类型。因此能且仅能调用asText方法



*/


/**
*  协议的继承

协议能够继承一到多个其他协议。语法与类的继承相似，多个协议间用逗号，分隔

protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
// 协议定义
}

*/

protocol PrettyTextRepresentable : TextRepresentable{

    func asPrettyText()->String
}
/**
*  类专属协议

你可以在协议的继承列表中,通过添加“class”关键字,限制协议只能适配到类（class）类型。（结构体或枚举不能遵循该协议）。该“class”关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议。

protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
// class-only protocol definition goes here
}
在以上例子中，协议SomeClassOnlyProtocol只能被类（class）类型适配。如果尝试让结构体或枚举类型适配该协议，则会出现编译错误。

注意

当协议需求定义的行为，要求（或假设）它的遵循类型必须是引用语义而非值语义时，应该采用类专属协议。关于引用语义，值语义的更多内容，请查看结构体和枚举是值类型和类是引用类型
*/
protocol someClaseOnlyProtocol : class ,TextRepresentable{

    static func cls()
    
}

/**
*  协议合成

一个协议可由多个协议采用protocol<SomeProtocol， AnotherProtocol>这样的格式进行组合，称为协议合成(protocol composition)。
*/


protocol Named{

    var name :  String{get}
    
}
protocol Aged{

    var age :Int{get}
}

struct Person2 : Named ,Aged{
    var name : String
    var age : Int
}

func wishHappyBirthday(celebrator:protocol<Named,Aged>){

    println("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}

let bir = Person2(name: "mmmm", age: 21)
wishHappyBirthday(bir)


/**
*  检验协议的一致性

使用is和as操作符来检查协议的一致性或转化协议类型。检查和转化的语法和之前相同(详情查看Typy Casting章节):

is操作符用来检查实例是否遵循了某个协议。
as?返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil
as用以强制向下转型。
@objc protocol HasArea {
var area: Double { get }
}
注意: @objc用来表示协议是可选的，也可以用来表示暴露给Objective-C的代码，此外，@objc型协议只对类有效，因此只能在类中检查协议的一致性。详情查看Using Siwft with Cocoa and Objectivei-c。
*/


@objc protocol HasArea{

    var area : Double{get}
}

class Circle : HasArea{

    let pi = 3.1415926
    var radius :Double
    @objc var area : Double{
    
        return pi * radius * radius
    }
    init(radius : Double){
    
        self.radius = radius
    }
}
class Country: HasArea {
    @objc var area: Double
    init(area: Double) { self.area = area }
}

class Animal{

    var legs : Int
    init(legs : Int){
    
        self.legs = legs
    }
}

let objects :[AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]


for object in objects{
    if let objectWithArea = object as? HasArea {
        println("Area is \(objectWithArea.area)")
    } else {
        println("Something that doesn't have an area")
    }
}

/**
*  对可选协议的规定

可选协议含有可选成员，其遵循者可以选择是否实现这些成员。在协议中使用@optional关键字作为前缀来定义可选成员。

可选协议在调用时使用可选链，详细内容在Optional Chaning章节中查看。

像someOptionalMethod?(someArgument)这样，你可以在可选方法名称后加上?来检查该方法是否被实现。可选方法和可选属性都会返回一个可选值(optional value)，当其不可访问时，?之后语句不会执行，并整体返回nil

注意: 可选协议只能在含有@objc前缀的协议中生效。且@objc的协议只能被类遵循
*/





















