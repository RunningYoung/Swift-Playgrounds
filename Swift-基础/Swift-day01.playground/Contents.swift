//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let num = 0

println(str + "......\(num)22222 --\(num)"  + "----sssssss" + "\n" + str.uppercaseString)

println(num + 10)


var name:String


name = "xiaoming"


println(name + ".....\(name)" )

var ste = "555" ; var ooo = 6

println(ste + "+\(ooo)")

let minValue = UInt8.min
let maxValue = UInt8.max

let minV32 = UInt32.min
let maxV32 = UInt32.max

let minV64 = UInt64.min
let maxV64 = UInt64.max

let minVINT = Int.min
let maxVINT = Int.max

println(minValue + maxValue)
//强制类型转换
let int1 = 33
let pointDouble = 6.545
let pi = (int1) + Int(pointDouble)

print(pi)

let trueOrFalse = true
let isName : Bool
print(trueOrFalse)

//控制流
for index in 1...5{
    print("\(index) times 5 is \(index * 5 )")

}

let base = 3
let power = 10
var answer = 1

//_忽略具体的值 并且不提供循环遍历时对值得访问
for _ in 1...power {
    answer *= base
}

let numberoflegs = ["spider":2,"ant":4,"cat":9]

for (key,value) in numberoflegs {

    print("key =\(key)...value = \(value)")
    
}

for var index = 0;index < 10 ; index++
{
    print("index is \(index)")

}
//switch 普通 不允许 出现为空的case 
// 如
//case 2:
//case 3:
let an = "s"
switch an {

    case "a","b","c":
      print("aaa")
    //默认不贯穿
    case "ee","sss":
        //贯穿语句
        fallthrough
    case "s":
       print("sss")
    default:
        print("default")

}
//switch 区间匹配

let cout = 5005

switch cout {

case 0:
    print("00")
case 1...10:
    print("1-10")
case 100...5000:
    print("100-5000")
case 5001...5005:
    print("5001-5005")
default:
    print("no")

}

//switch 元组匹配 _表示匹配所有的值

let somePoint = (1,1)

switch somePoint {

case (1,3):
    print("no 1.3")
case (_,2):
    print("no _.2")
case (_,1):
    print("quanbu")
case (1...3,2...3):
    print("1...3")
default:
    print("wu")
}

//switch 值绑定
let andd = (2,2)
switch andd {

case (let x,0):
    print("将纵坐标为0的点的横坐标 赋值给x")
case (0,let y):
    print("将横坐标为0的点的纵坐标的值 赋值给 y")
default:
    print("wu")

}

//switch 判断额外的条件 where

let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {

case let (x,y) where x == y:
    print("x==y")
case let (x,y) where x > y :
    print("x>y")
case let (x,y):
    print("x= \(x) y = \(y)")
}

//switch break 跳出循环 break +标签（变量或者对象 终止哪一个循环） ; 忽略某个分支case Fallthrough 贯穿case

/*
这个版本的游戏使用while循环体和switch方法块来实现游戏的逻辑。while循环体有一个标签名gameLoop，来表明它是蛇与梯子的主循环。

该while循环体的条件判断语句是while square !=finalSquare，这表明你必须刚好落在方格25中。

gameLoop: while square != finalSquare {
if ++diceRoll == 7 { diceRoll = 1 }
switch square + diceRoll {
case finalSquare:
// 到达最后一个方块，游戏结束
break gameLoop
case let newSquare where newSquare > finalSquare:
// 超出最后一个方块，再掷一次骰子
continue gameLoop
default:
// 本次移动有效
square += diceRoll
square += board[square]
}
}
println("Game over!")
*/


/**
*  元组
*/

let names = (name:"hehe",age:"24",sex:"boy")
println(names.0)
println(names.name)
/**
*  注意：
使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值。
*/

 /// nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。

let sel : Int? = 1
var sel2 : String? = nil

/**
*  断言
*/

let age = -3

assert(age>=0, "age 为负数")













