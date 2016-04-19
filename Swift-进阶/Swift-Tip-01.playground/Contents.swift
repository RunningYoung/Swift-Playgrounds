//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class ReverseGenerator : GeneratorType{

    typealias Element = Int
    var counter : Element
    init<T>(array : [T]){
    
        self.counter = array.count - 1
    }
    init(start : Int){
    
        self.counter = start
    }
    func next() -> Element? {
        return self.counter < 0 ? nil : counter--
    }
    
}

struct ReverseSequence<T>:SequenceType{

    var array : [T]
    init(array : [T]){
    
        self.array = array
    }
    typealias Generator = ReverseGenerator
    func generate() -> Generator {
        return ReverseGenerator(array: array)
    }
}

var arr = [0,1,2,3,4]
for i in ReverseSequence(array: arr){

    print("Index \(i) is \(arr[i])")
    
}
print(arr)

var e = arr.map({($0 + 10)})
var ee = arr.filter({$0 > 2})
var eee = arr.reduce(20, combine: {$1 + $0})

print(eee)


var num = 42
print(num)
var ss = 20

var tt = num ?? ss

infix operator +* {
    associativity none
    precedence 160
}

func incrementor( var variable : Int) -> Int{

    return ++variable
}

func makeIncrementor(addNumber : Int) -> ((inout Int)->()){

    func incrementor(inout variable : Int)->(){
    
        variable += addNumber
    }
    return incrementor;
}




class MyClass {

    let name = "xiaoming"
    func hello(){
        print("hello \(name)")
    }
}

let ob = MyClass()
ob.hello()


















