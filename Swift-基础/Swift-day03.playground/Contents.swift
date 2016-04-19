//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//集合类型
//数组构造

var shoppingList :[String] = ["Eggs","Milk"]


println("shoppingList has \(shoppingList.count) items")


if shoppingList.isEmpty {

    println("weikong")

}else{

    println("buweikong")

}

//追加
shoppingList.append("coco")
shoppingList.append("coco")
shoppingList.append("coco")
shoppingList.append("coco")


shoppingList += ["2ww","fqwf","vcrfre"]

println("shoppingList has \(shoppingList.count) items")

//查

var firstItem = shoppingList[0]

var last = shoppingList[shoppingList.count-1]

//改

shoppingList[2...4] = ["2iii","3iii"]

println(shoppingList.count)

//调用数组的insert(atIndex:)方法来在某个具体索引值之前添加数据项：

shoppingList.insert("insert ", atIndex: 0)

let removeItem = shoppingList.removeAtIndex(0)

println(removeItem)

for item in shoppingList {
    
    println(item)
}

//枚举
for (index,item) in enumerate(shoppingList)
{

    println("index = \(index ) item = \(item)")

}

//创建并且构造一个数组

var someInts = [Int]()

var someI  = [0]

var threeDou = [Double](count : 3,repeatedValue:0.3)

var antherTD = Array(count: 3 ,repeatedValue:0.5)

var sixD = threeDou + antherTD

/***
*  **********   SET *****
*/
var fSet :Set<String> = ["rock1","class"]

println("fSet has \(fSet.count) item")

fSet.isEmpty

fSet.insert("setInsert")

/*你可以通过调用Set的remove(_:)方法去删除一个元素，如果该值是该Set的一个元素则删除该元素并且返回被删除的元素值，否认如果该Set不包含该值，则返回nil。另外，Set中的所有元素可以通过它的removeAll()方法删除。
*/

var removeItem_set = fSet.remove("ss")

/*
集合的交并补

使用union(_:)方法根据两个集合的值创建一个新的集合。
使用subtract(_:)方法根据不在该集合中的值创建一个新的集合。
使用intersect(_:)方法根据两个集合中都包含的值创建的一个新的集合。
使用exclusiveOr(_:)方法根据值在一个集合中但不在两个集合中的值创建一个新的集合。

*/


/**
*  ******************  字典类型
*/

var aDir : [String : String ] = ["one":"oneValue" , "two":"twoValue"]


aDir.count

aDir.isEmpty

aDir["three"] = "threeValue"

aDir

/*
updateValue(forKey:)函数会返回包含一个字典值类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。如果值存在，则这个可选值值等于被替换的值，否则将会是nil。
*/

if let oldValue = aDir.updateValue("four", forKey: "four")
{

    println("存在")

}else{


    println("不存在")
}

/*
我们也可以使用下标语法来在字典中检索特定键对应的值。由于使用一个没有值的键这种情况是有可能发生的，可选类型返回这个键存在的相关值，否则就返回nil
*/

if let isexit = aDir["four"]{


    println("存在")
}else{


    println("不存在")
}

/*
我们还可以使用下标语法来通过给某个键的对应值赋值为nil来从字典里移除一个键值对：
*/
aDir["four"] = "replace"

aDir["four"] = nil

aDir

/**
*  另外，removeValueForKey方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键值对并且返回被移除的value或者在没有值的情况下返回nil：
*/

if let removeValue = aDir.removeValueForKey("four")
{
    println("存在")

}else{

    println("不存在")
}

for (key,value) in aDir{

    println("key:\(key)  value: \(value)")

}

for key in aDir.keys{

    println("key : \(key)")
}


for value in aDir.values {

    println("value:\(value)")
}

//创建一个空字典
var nameOfIntegers = Dictionary<Int , String>()

var aa = Array<Int>()




















