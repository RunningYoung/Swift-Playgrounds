//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//
//public class ThermometerClass {
//    private(set) var temperature: Double = 0.0
//    public func registerTemperature(temperature: Double) {
//        self.temperature = temperature
//    }
//}
//
//let thermometerClass = ThermometerClass()
//thermometerClass.registerTemperature(56.0)
//
//public struct ThermometerStruct {
//    private(set) var temperature: Double = 0.0
//    public mutating func registerTemperature(temperature: Double) {
//        self.temperature = temperature
//    }
//}
//
//var thermometerStruct = ThermometerStruct()
//thermometerStruct.registerTemperature(56.0)
//
//var thing = "cars"
//
//let closure = { [thing] in
//    print("I love \(thing)")
//}
//
//thing = "airplanes"
//
//closure()
//var s = [thing]
//
//print(s)
//
//var none :Int?  = Optional.None
//
//print(none)
////guard语句是在Swift 2.0中引进的，它是用途是在未满足某个条件时，提供一个退出的路径。对于检查是否满足先决条件来说，它是非常有用的。因为它可以使你更清晰的表达逻辑——而不是像i各种f语句嵌套实现那么复杂。
//func divide(dividend : Double? , by divisor : Double? ) -> Double?{
//    guard let dividend = dividend , divisor = divisor where divisor != 0 else{return .None}
//    return dividend / divisor
//}
//
//public struct Thermometer {
//
//    public var temperature : Double
//    
//        public init(temperature : Double) {
//        
//            self.temperature = temperature
//        }
//    
//}
//
//extension Thermometer : FloatLiteralConvertible {
//
//    public init(floatLiteral value: Self.FloatLiteralType){
//    
//        self.init(temperature : value)
//    }
//
//}
//
//var tem  : Thermometer = 2.0

//自定义运算符
/*
问题2 - Swift 1.0 or later

Swift 拥有一系列预定义的运算符，这些运算符执行不同类型的操作，例如算术运算符和逻辑运算符。它甚至允许创建自定义的运算符，无论是一元运算符还是二元运算符。自定义一个满足一下规格的幂运算符：

以两个整数作为参数

返回第一个参数的第二个参数次方的值

忽略潜在溢出错误

答案：创建一个自定义的运算符需要两个步骤：声明它和实现它。

使用operator关键字来声明指定的类型（一元或者二元）、组成这个运算符字符的顺序已经它的优先级和关联性。

在这中情况下，运算符是^^,类型是infix（二进制），关联性是right，优先级设置成为155，原因是乘法和除法的优先级是150.下面就是具体的声明代码：
*/
infix operator ^^ {associativity right precedence 155}

func ^^(lhs : Int, rhs : Int) -> Int {

    let l = Double(lhs)
    let r = Double(rhs)
    let p = pow(l, r)
    return Int(p)
}


infix operator *+ {associativity right precedence 156}

func *+(num1 : Int , num2 : Int ) -> Int {

    return num1 * num2 + num2
}

struct Pizza {
    let ingredients : [String]
}
protocol Pizzeria {
    //情况二 去掉声明
//    func makeMargherita () -> Pizza
    func makePizza(ingredients :[String]) -> Pizza
}

extension Pizzeria {

    func makeMargherita()->Pizza{
    
        return makePizza(["tomato","mozzarella"])
    }
}

struct Lombardis : Pizzeria {
    func makePizza(ingredients: [String]) -> Pizza {
        return Pizza(ingredients: ingredients)
    }
    func makeMargherita() -> Pizza {
        return makePizza(["tomato","basil","mozzarella"])
    }
}


let lombardis1 : Pizzeria = Lombardis()
let lombardis2 : Lombardis = Lombardis()

let pizz1 =  lombardis1.makeMargherita()
let pizz2 = lombardis2.makeMargherita()

print(pizz1.ingredients)
print(pizz2.ingredients)


enum WechatError : ErrorType {

    case NoBattery
    case NoNetwork
    case NoDataStream
}

func checkIsWechatOk (isPhoneHasBattery : Bool , isPhoneHasNetwork : Bool , dataStream : Int ) throws {

    guard isPhoneHasBattery else {
    
        throw WechatError.NoBattery
    }
    
    guard isPhoneHasNetwork else {
    
        throw WechatError.NoNetwork
    }
    
    guard dataStream > 50 else {
    
        throw WechatError.NoDataStream
    }
}


func playWechat (isPhoneHasBattery : Bool, isPhoneHasNetwork : Bool, dataStream : Int){

    do{
        try checkIsWechatOk(isPhoneHasBattery, isPhoneHasNetwork: isPhoneHasNetwork, dataStream: dataStream)
        print("放心刷，刷到天昏地暗！")
        
    }catch WechatError.NoBattery {
    
    }catch WechatError.NoNetwork {
    
        
    }catch WechatError.NoDataStream{
    
    }catch {
    
        
    }
}
print("我要换行",terminator: "\n")






