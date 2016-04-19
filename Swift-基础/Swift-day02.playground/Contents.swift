//: Playground - noun: a place where people can play

import UIKit

//字符串
var str = "Hello, playground"
let somestring = "some string literal value"
let wiseWorlds = " \"ssss\" \' \0 \t \r \n \\ "
//初始化空字符串
/* Swift 的String类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作或在函数/方法中传递时，会进行值拷贝。 任何情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作
*/
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    println("什么也没有")
}
/*
Swift 的String类型表示特定序列的Character（字符） 类型值的集合。 每一个字符值代表一个 Unicode 字符。
*/
for character in "Dog" {

    println(character)

}

let yen : Character = "s"
let unCountString  = "koala ,Anail ,Penguin "
println("unCountString has  \(count(unCountString)) ||  characters")
//字符串可以通过加法运算符（+）相加在一起（或称“串联”）并创建一个新的字符串：
let string1 = " hello "
let string2 = " world "
var welcome = string1 + " " + string2

 welcome += string1
//append 只追加 单个字符
welcome.append(Character("s"))

//如果两个字符串以同一顺序包含完全相同的字符，则认为两者字符串相等：

let st1 = "ss"
let st2 = "ss"
if st1 == st2 {
    println("字符串相等")
}

unCountString.hasPrefix("ko")

unCountString.hasSuffix("ss")

unCountString.uppercaseString

unCountString.lowercaseString

unCountString.utf8

unCountString.utf16

/*
字符串插值 (String Interpolation)

字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。 您插入的字符串字面量的每一项都被包裹在以反斜线为前缀的圆括号中：

let multiplier = 3
let message = "\(multiplier) 乘以 2.5 是 \(Double(multiplier) * 2.5)"
// message 是 "3 乘以 2.5 是 7.5"
在上面的例子中，multiplier作为\(multiplier)被插入到一个字符串字面量中。 当创建字符串执行插值计算时此占位符会被替换为multiplier实际的值。

multiplier的值也作为字符串中后面表达式的一部分。 该表达式计算Double(multiplier) * 2.5的值并将结果 (7.5) 插入到字符串中。 在这个例子中，表达式写为\(Double(multiplier) * 2.5)并包含在字符串字面量中。

注意：
插值字符串中写在括号中的表达式不能包含非转义双引号 (") 和反斜杠 (\)，并且不能包含回车或换行符。
*/



/*
字符串可以通过加法运算符（+）相加在一起（或称“串联”）并创建一个新的字符串：

let string1 = "hello"
let string2 = " there"
var welcome = string1 +　string2
// welcome 现在等于 "hello there"
您也可以通过加法赋值运算符 (+=) 将一个字符串添加到一个已经存在字符串变量上：

var instruction = "look over"
instruction += string2
// instruction 现在等于　"look over there"
你可以用将append方法将一个字符附加到一个字符串变量的尾部：

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome 现在等于 "hello there!"
注意：
您不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符。
*/








