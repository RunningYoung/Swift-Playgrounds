//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
*  可选连
可选链可替代强制解析

通过在想调用的属性、方法、或下标脚本的可选值（optional value）（非空）后面放一个问号，可以定义一个可选链。这一点很像在可选值后面放一个叹号来强制拆得其封包内的值。它们的主要的区别在于当可选值为空时可选链即刻失败，然而一般的强制解析将会引发运行时错误。

为了反映可选链可以调用空（nil），不论你调用的属性、方法、下标脚本等返回的值是不是可选值，它的返回结果都是一个可选值。你可以利用这个返回值来检测你的可选链是否调用成功，有返回值即成功，返回nil则失败。

调用可选链的返回结果与原本的返回结果具有相同的类型，但是原本的返回结果被包装成了一个可选值，当可选链调用成功时，一个应该返回Int的属性将会返回Int?。
通过可选链调用方法

你可以使用可选链的来调用可选值的方法并检查方法调用是否成功。即使这个方法没有返回值，你依然可以使用可选链来达成这一目的。

Residence的printNumberOfRooms方法会打印numberOfRooms的当前值。方法如下：

func printNumberOfRooms(){
println(“The number of rooms is \(numberOfRooms)”)
}
这个方法没有返回值。但是，没有返回值类型的函数和方法有一个隐式的返回值类型Void（参见Function Without Return Values）。

如果你利用可选链调用此方法，这个方法的返回值类型将是Void?，而不是Void，因为当通过可选链调用方法时返回值总是可选类型（optional type）。即使这个方法本身没有定义返回值，你也可以使用if语句来检查是否能成功调用printNumberOfRooms方法：如果方法通过可选链调用成功，printNumberOfRooms的隐式返回值将会是Void，如果没有成功，将返回nil：
连接多层链接

你可以将多层可选链连接在一起，可以掘取模型内更下层的属性方法和下标脚本。然而多层可选链不能再添加比已经返回的可选值更多的层。 也就是说：

如果你试图获得的类型不是可选类型，由于使用了可选链它将变成可选类型。 如果你试图获得的类型已经是可选类型，由于可选链它也不会提高可选性。

因此：

如果你试图通过可选链获得Int值，不论使用了多少层链接返回的总是Int?。 相似的，如果你试图通过可选链获得Int?值，不论使用了多少层链接返回的总是Int?。
*/

class Person {
    
    var residence : Residence?
}
class Residence {

    var rooms = [Room]()
    var numberOfRooms  :Int {
    
        return rooms.count
    }
    subscript(i : Int)->Room{
    
        return rooms[i]
    }
    func printNumberOfRooms(){
    
        println("The number of rooms is \(numberOfRooms)");
    }
    var address : Address?
    
}

class Room {
    let name :String
    init(name : String){
        self.name = name
    }
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms{

    println("John's residence has \(roomCount) room(s).")
}else{

    println("Unable to retrieve the number of rooms.")

}

class Address{

    var buildingName :String?
    var buildingNumber : String?
    var street :String?
    func buildingIdentifier()->String?{
    
        if buildingName {
            return buildingName
        }else if buildingNumber{
        
            return buildingNumber
        }else{
        
            return nil
        }
    }
}
let johnn = Person()
if let roomCount = johnn.residence?.numberOfRooms{
    println("John's residence has \(roomCount) room(s).")

}else{

    println("Unable to retrieve the number of rooms.")

}

if let jjj: () =  johnn.residence?.printNumberOfRooms(){
    println("It was possible to print the number of rooms.")

}else{
    println("It was not possible to print the number of rooms.")

}

if let firstRoomName = johnn.residence?[0].name{
    println("The first room name is \(firstRoomName).")
} else {
    println("Unable to retrieve the first room name.")
}

//****************** 类型转换（Type Casting）*************
/// 类型转换可以判断实例的类型，也可以将实例看做是其父类或者子类的实例。
//
//类型转换在 Swift 中使用is 和 as操作符实现。这两个操作符提供了一种简单达意的方式去检查值的类型或者转换它的类型。
//

class MediaItem{

    var name: String
    init(name:String){
    
        self.name = name
    }
}
class Movie : MediaItem{

    var director : String
    init(name : String,director : String){
    
        self.director = director
        super.init(name: name)
    }
    
}

class Song:MediaItem{

    var artist :String
    init(name: String,artist : String){
    
        self.artist = artist
        super.init(name: name)
    }
}


let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


/**
*  检查类型（Checking Type）

用类型检查操作符(is)来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回 true ，否则返回 false 。
*/

var movieCount = 0
var songCount = 0
for item in library {

    if item is Movie {
    
        ++movieCount
    }else if item is Song {
    
        ++songCount
    }
}

println("Media library contains \(movieCount) movies and \(songCount) songs")


/**
*  向下转型（Downcasting）

某类型的一个常量或变量可能在幕后实际上属于一个子类。你可以相信，上面就是这种情况。你可以尝试向下转到它的子类型，用类型转换操作符(as)

因为向下转型可能会失败，类型转型操作符带有两种不同形式。可选形式（ optional form） as? 返回一个你试图下转成的类型的可选值（optional value）。强制形式 as 把试图向下转型和强制解包（force-unwraps）结果作为一个混合动作。

当你不确定向下转型可以成功时，用类型转换的可选形式(as?)。可选形式的类型转换总是返回一个可选值（optional value），并且若下转是不可能的，可选值将是 nil 。这使你能够检查向下转型是否成功。

只有你可以确定向下转型一定会成功时，才使用强制形式。当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误。
*/

for item in library {

    if let movie = item as? Movie {
        println("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        println("Song: '\(song.name)', by \(song.artist)")
    }
}
/**
*  Any和AnyObject的类型转换

Swift为不确定类型提供了两种特殊类型别名：

AnyObject可以代表任何class类型的实例。
Any可以表示任何类型，包括方法类型（function types）。
注意： 只有当你明确的需要它的行为和功能时才使用Any和AnyObject。在你的代码里使用你期望的明确的类型总是更好的。
AnyObject类型

当需要在工作中使用 Cocoa APIs，它一般接收一个[AnyObject]类型的数组，或者说“一个任何对象类型的数组”。这是因为 Objective-C 没有明确的类型化数组。但是，你常常可以确定包含在仅从你知道的 API 信息提供的这样一个数组中的对象的类型。

在这些情况下，你可以使用强制形式的类型转换(as)来下转在数组中的每一项到比 AnyObject 更明确的类型，不需要可选解析（optional unwrapping）。
Any类型

这里有个示例，使用 Any 类型来和混合的不同类型一起工作，包括非class类型。它创建了一个可以存储Any类型的数组 things。
*/



let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]

for object in someObjects {

    let movie2 = object as Movie {
        
        println("Movie: '\(movie2.name)', dir. \(movie2.director)")
    }
}

for movie in someObjects as! [Movie]{

    println("Movie: '\(movie.name)', dir. \(movie.director)")

}


/**
*  嵌套类型
本页包含内容：

嵌套类型实例
嵌套类型的引用
枚举类型常被用于实现特定类或结构体的功能。也能够在有多种变量类型的环境中，方便地定义通用类或结构体来使用，为了实现这种功能，Swift允许你定义嵌套类型，可以在枚举类型、类和结构体中定义支持嵌套的类型。

要在一个类型中嵌套另一个类型，将需要嵌套的类型的定义写在被嵌套类型的区域{}内，而且可以根据需要定义多级嵌套。
*/
struct BlackjackCard {
    // 嵌套定义枚举型Suit
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    // 嵌套定义枚举型Rank
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}
/**
*  嵌套类型的引用

在外部对嵌套类型的引用，以被嵌套类型的名字为前缀，加上所要引用的属性名：

let heartsSymbol = BlackjackCard.Suit.Hearts.toRaw()
// 红心的符号 为 "♡"
对于上面这个例子，这样可以使Suit, Rank, 和 Values的名字尽可能的短，因为它们的名字会自然的由被定义的上下文来限定。
*/

let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue




