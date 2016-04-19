//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
///**********构造过程
//构造器
/*
构造器在创建某特定类型的新实例时调用。它的最简形式类似于一个不带任何参数的实例方法，以关键字init命名。
*/
struct Fahrenheit
{
    var temperature : Double
    init(){
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) ")

/**
*  定制化构造过程
*/
// 1 构造参数
//你可以在定义构造器时提供构造参数，为其提供定制化构造所需值的类型和名字。构造器参数的功能和语法跟函数和方法参数相同。
struct Celsius {
    var temperatureInCelsius : Double = 0.0
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0)/1.8
    }
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezubfOiubrIfwater = Celsius(fromKelvin: 273.15)

/**
*  内部和外部参数名

跟函数和方法参数相同，构造参数也存在一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。

然而，构造器并不像函数和方法那样在括号前有一个可辨别的名字。所以在调用构造器时，主要通过构造器中的参数名和类型来确定需要调用的构造器。正因为参数如此重要，如果你在定义构造器时没有提供参数的外部名字，Swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名，就相当于在每个构造参数之前加了一个哈希符号。

注意：
如果你不希望为构造器的某个参数提供外部名字，你可以使用下划线_来显示描述它的外部名，以此覆盖上面所说的默认行为。
*/
struct Color {

    let red ,green ,blue:Double
    init(red:Double ,green : Double , blue : Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init (white : Double){
    
            red = white
            green = white
            blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

/**
**************可选属性类型
如果你定制的类型包含一个逻辑上允许取值为空的存储型属性--不管是因为它无法在初始化时赋值，还是因为它可以在之后某个时间点可以赋值为空--你都需要将它定义为可选类型optional type。可选类型的属性将自动初始化为空nil，表示这个属性是故意在初始化时设置为空的。
调查问题在问题提出之后，我们才能得到回答。所以我们将属性回答response声明为String?类型，或者说是可选字符串类型optional String。当SurveyQuestion实例化时，它将自动赋值为空nil，表明暂时还不存在此字符串。
*/
class SurveyQuestion{

    var text : String
    var response : String?
    //构造过程中常量属性的修改
    let textLet : String
    init(text : String){
        self.text = text
        self.textLet = text
    }
    func ask(){
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese ?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes , I do like cheese ."

/**
*  构造过程中常量属性的修改

只要在构造过程结束前常量的值能确定，你可以在构造过程中的任意时间点修改常量属性的值。

注意：
对某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
*/

/**
*  默认构造器

Swift 将为所有属性已提供默认值的且自身没有定义任何构造器的结构体或基类，提供一个默认的构造器。这个默认构造器将简单的创建一个所有属性值都设置为默认值的实例。
*/

class ShoppingListItem11111 {

    var name : String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem11111()
/**
*  结构体的逐一成员构造器

除上面提到的默认构造器，如果结构体对所有存储型属性提供了默认值且自身没有提供定制的构造器，它们能自动获得一个逐一成员构造器。

逐一成员构造器是用来初始化结构体新实例里成员属性的快捷方法。我们在调用逐一成员构造器时，通过与成员属性名相同的参数名进行传值来完成对成员属性的初始赋值。
*/
struct Size{

    var width = 0.0 , height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

/**
*  值类型的构造器代理

构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。

构造器代理的实现规则和形式在值类型和类类型中有所不同。值类型（结构体和枚举类型）不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给本身提供的其它构造器。类则不同，它可以继承自其它类（请参考继承），这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。这些责任将在后续章节类的继承和构造过程中介绍。

对于值类型，你可以使用self.init在自定义的构造器中引用其它的属于相同值类型的构造器。并且你只能在构造器内部调用self.init。

注意，如果你为某个值类型定义了一个定制的构造器，你将无法访问到默认构造器（如果是结构体，则无法访问逐一对象构造器）。这个限制可以防止你在为值类型定义了一个更复杂的，完成了重要准备构造器之后，别人还是错误的使用了那个自动生成的构造器。

注意：
假如你想通过默认构造器、逐一对象构造器以及你自己定制的构造器为值类型创建实例，我们建议你将自己定制的构造器写到扩展（extension）中，而不是跟值类型定义混在一起。想查看更多内容，请查看扩展章节。
*/

struct Size2{

    var width = 0.0 , height = 0.0
    
}
struct Point {

    var x = 0.0 ,y = 0.0
}

struct Rect {

    var origin = Point()
    var size = Size()
    init(){}
    init(origin : Point ,size : Size){
        self.origin = origin
        self.size = size
    }
    init(center : Point, size : Size){
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        self.init(origin:Point(x: originX, y: originY),size:size)
    }
}
let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

/**
*  类的继承和构造过程

类里面的所有存储型属性--包括所有继承自父类的属性--都必须在构造过程中设置初始值。

Swift 提供了两种类型的类构造器来确保所有类实例中存储型属性都能获得初始值，它们分别是指定构造器和便利构造器。

指定构造器和便利构造器

指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。

每一个类都必须拥有至少一个指定构造器。在某些情况下，许多类通过继承了父类中的指定构造器而满足了这个条件。具体内容请参考后续章节自动构造器的继承。

便利构造器是类中比较次要的、辅助型的构造器。你可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入的实例。

你应当只在必要的时候为类提供便利构造器，比方说某种情况下通过使用便利构造器来快捷调用某个指定构造器，能够节省更多开发时间并让类的构造过程更清晰明了。


构造器链

为了简化指定构造器和便利构造器之间的调用关系，Swift 采用以下三条规则来限制构造器之间的代理调用：

规则 1

指定构造器必须调用其直接父类的的指定构造器。

规则 2

便利构造器必须调用同一类中定义的其它构造器。

规则 3

便利构造器必须最终以调用一个指定构造器结束。

一个更方便记忆的方法是：

指定构造器必须总是向上代理
便利构造器必须总是横向代理
构造器的继承和重载

跟 Objective-C 中的子类不同，Swift 中的子类不会默认继承父类的构造器。Swift 的这种机制可以防止一个父类的简单构造器被一个更专业的子类继承，并被错误的用来创建子类的实例。

假如你希望自定义的子类中能实现一个或多个跟父类相同的构造器--也许是为了完成一些定制的构造过程--你可以在你定制的子类中提供和重载与父类相同的构造器。

如果你重载的构造器是一个指定构造器，你可以在子类里重载它的实现，并在自定义版本的构造器中调用父类版本的构造器。

如果你重载的构造器是一个便利构造器，你的重载过程必须通过调用同一类中提供的其它指定构造器来实现。这一规则的详细内容请参考构造器链。

注意：
与方法、属性和下标不同，在重载构造器时你没有必要使用关键字override。

自动构造器的继承

如上所述，子类不会默认继承父类的构造器。但是如果特定条件可以满足，父类构造器是可以被自动继承的。在实践中，这意味着对于许多常见场景你不必重载父类的构造器，并且在尽可能安全的情况下以最小的代价来继承父类的构造器。

假设要为子类中引入的任意新属性提供默认值，请遵守以下2个规则：

规则 1

如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器。

规则 2

如果子类提供了所有父类指定构造器的实现--不管是通过规则1继承过来的，还是通过自定义实现的--它将自动继承所有父类的便利构造器。

即使你在子类中添加了更多的便利构造器，这两条规则仍然适用。

注意：
子类可以通过部分满足规则2的方式，使用子类便利构造器来实现父类的指定构造器。
指定构造器和便利构造器的语法

类的指定构造器的写法跟值类型简单构造器一样：

init(parameters) {
statements
}
便利构造器也采用相同样式的写法，但需要在init关键字之前放置convenience关键字，并使用空格将它们俩分开：

convenience init(parameters) {
statements
}

*/

class Food {
    var name :String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name : "[Unnamed]")
    }
}
//指定构造器调用
let nameMeat = Food(name: "Bacon")
//便利构造器
let mysteryMeat = Food()

class RecipeIngredient : Food{
    var quantity : Int
    init(name:String,quantity :Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name:String){
        self.init(name:name,quantity:1)
    }
}
/*
满足规则2 所以 父类的构造器被继承了

如果子类提供了所有父类指定构造器的实现--不管是通过规则1继承过来的，还是通过自定义实现的--它将自动继承所有父类的便利构造器。
*/
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem : RecipeIngredient {
    var purchased  = false
    var description :String {
        var outPut = "\(quantity) x \(name.lowercaseString)"
        outPut += purchased ? "√":"×"
        return outPut
    }
}

var breakFastlist = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakFastlist[0].name = "Orange juice"
breakFastlist[0].purchased = true
for items in breakFastlist{
    print(items.description)
}

/**
*  可失败构造器

如果一个类，结构体或枚举类型的对象，在构造自身的过程中有可能失败，则为其定义一个可失败构造器，是非常有必要的。这里所指的“失败”是指，如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不满足某种必要的条件等。

为了妥善处理这种构造过程中可能会失败的情况。你可以在一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面加添问号(init?)。

注意：

可失败构造器的参数名和参数类型，不能与其它非可失败构造器的参数名，及其类型相同。
可失败构造器，在构建对象的过程中，创建一个其自身类型为可选类型的对象。你通过return nil 语句，来表明可失败构造器在何种情况下“失败”。

注意：

严格来说，构造器都不支持返回值。因为构造器本身的作用，只是为了能确保对象自身能被正确构建。所以即使你在表明可失败构造器，失败的这种情况下，用到了return nil。也不要在表明可失败构造器成功的这种情况下，使用关键字 return。

*/

struct Animal {
    let species : String
    init?(species:String){
        if species.isEmpty { return nil}
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {

    print("An animal was initialized with a species of \(giraffe.species)")
    
}


let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {

    print("The aninymous crearture could not be initialized")
}
/**
*  枚举类型的可失败构造器

你可以通过构造一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员。还能在参数不满足你所期望的条件时，导致构造失败。
*/

enum TemperatureUnit {

    case Kelvin,Celsius,Fahrenheit
    init?(symbol : Character){
    
        switch symbol {
        
            case "K":
                self  = .Kelvin
            case "C":
                self  = .Celsius
            case "F":
                self = .Fahrenheit
        default:
            return nil
        }
    }
}
/**
*  类的可失败构造器

值类型（如结构体或枚举类型）的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。比如在前面的例子中，结构体Animal的可失败构造器触发失败的行为，甚至发生在species属性的值被初始化以前。而对类而言，就没有那么幸运了。类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的代理调用发生完后触发失败行为。

下例子中，定义了一个名为Product的类，其内部结构和结构体Animal很相似，内部也有一个名为name的String类型的属性。由于该属性的值同样不能为空字符串，所以我们加入了可失败构造器来确保该类满足上述条件。但由于Product类不是一个结构体，所以当想要在该类中添加可失败构造器触发失败条件时，必须确保name属性被初始化。因此我们把name属性的String类型做了一点点小小的修改，把其改为隐式解析可选类型（String!），来确保可失败构造器触发失败条件时，所有类属性都被初始化了。因为所有可选类型都有一个默认的初始值nil。因此最后Product类可写为：
*/

class Product {

    var name : String!
    init?(name: String){
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}
class SomeClass {

    let someProperty : Int = {
        return 5
    }()
}








































