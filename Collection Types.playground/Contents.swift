//: Playground - noun: a place where people can play
//made by jankz jankz@jankz.com
import UIKit

var str = "Hello, playground"

/*************** 集合类型 ****************** */
//数组
//创建一个空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")
someInts.append(3) //追加元素
someInts = []

//创建一个带有默认值的数组
var threeDouble = [Double](count: 3, repeatedValue: 3.23)

var jankzNeed = [String](count: 10, repeatedValue: "jankz need a girl friend")

var anotherThreeDouble = Array(count: 3, repeatedValue: 3.9)
var sixDoubles = threeDouble + anotherThreeDouble

//用字面量构建数组
var shoppingList: [String] = ["Eggs","Milk"]
var shoppinglist = ["泡面","香肠"]//自动推断

//访问和修改数组

print("The shoppinglist contains \(shoppinglist.count) items.")

if shoppinglist.isEmpty {
    print("The shoppingList is empty please go and buy something here.")
} else {
    print("The shopping list is not empty!")
}
shoppinglist.append("烤肉串")
shoppinglist += ["膜片","易拉私募"] //可以用加法赋值运算（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项:
var firstItem = shoppinglist[0]
shoppinglist[0] = "One egg" //返回的是所赋值


var jankzArrayTest = ["jankz","jankz@jankz.com","678489"]

//数组插入
jankzArrayTest.insert("Man", atIndex: 3)

//数组元素删除
jankzArrayTest.removeAtIndex(2)
let jankzArrayLast = jankzArrayTest.removeLast()

//数组循环遍历
for item in jankzArrayTest {
    print(item)
}

//可以使用 enumerate() 方法来进行数组遍历。 enumerate() 返回一 个由每一个数据项索引值和数据值组成的元组。
for (index,value) in jankzArrayTest.enumerate() {
    print("Item \(String(index + 1)): \(value)")
}


/****************************** 集合 sets ******************************/
print("集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次 时可以使用集合而不是数组。")

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

//插入集合元素
letters.insert("a")

//清空元素
letters = []

//用数组字面量创建集合

var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]
print("\(favoriteGenres.count)")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm mot picky !")
} else {
    print("I have partualar music preference.")
}

//你可以通过调用 Set 的 insert(_:) 方法来添加一个新元素:
favoriteGenres.insert("Jazz")

/*
你可以通过调用 Set 的 remove(_:) 方法去删除一个元素,如果该值是该 Set 的一个元素则删除该元素并且返回 被删除的元素值,否则如果该 Set 不包含该值,则返回 nil 。另外, Set 中的所有元素可以通过它的 removeAl l() 方法删除。
*/
favoriteGenres.remove("Rock")

//使用 contains(_:) 方法去检查 Set 中是否包含一个特定的值:

if favoriteGenres.contains("jankz") {
    print("yes")
} else {
    print("JANKZ is not here!")
}


//遍历一个集合
for genre in favoriteGenres {
    print("\(genre)")
}


//集合操作
/*

• 使用 intersect(_:) 方法根据两个集合中都包含的值创建的一个新的集合。 交集
• 使用 exclusiveOr(_:) 方法根据在一个集合中但不在两个集合中的值创建一个新的集合。 并交补
• 使用 union(_:) 方法根据两个集合的值创建一个新的集合。 并集
• 使用 subtract(_:) 方法根据不在该集合中的值创建一个新的集合。 交一个补

*/


let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]

let singleDigitPrimeNumber: Set = [2,3,5,7]

oddDigits.union(evenDigits).sort() //并集

oddDigits.intersect(evenDigits).sort() //交集
oddDigits.intersect(singleDigitPrimeNumber).sort()//交集

oddDigits.subtract(singleDigitPrimeNumber).sort()//一个集合除去交集

oddDigits.exclusiveOr(singleDigitPrimeNumber).sort() //并集除去交集




/*

• 使用“是否相等”运算符( == )来判断两个集合是否包含全部相同的值。
• 使用 isSubsetOf(_:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
• 使用 isSupersetOf(_:) 方法来判断一个集合中包含另一个集合中所有的值。
• 使用 isStrictSubsetOf(_:) 或者 isStrictSupersetOf(_:) 方法来判断一个集合是否是另外一个集合的子集合 或者父集合并且两个集合并不相等。
• 使用 isDisjointWith(_:) 方法来判断两个集合是否不含有相同的值。

*/
let houseAnimals: Set = ["?","?"]
let farmAnimals: Set = ["?","?","?","?"]
let cityAnimals:Set = ["?","?"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)

/********************* 字 典    ******************/


//创建一个 空字典

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "Sixteen"

//清空字典 空字典
namesOfIntegers = [:]

//用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toront Pearson", "DUB": "Dublin"]

//访问和修改字典
print("The dictionary of airports contains \(airports.count)")

if airports.isEmpty {
    print("Is Empty")
} else {
    print("Not Empty")
}

//可用下标赋值
airports["JANKZ"] = "吉贞国际航空集团"
//我们也可以使用下标语法来改变特定键对应的值:
airports["JANKZ"] = "吉贞航空"

/*

作为另一种下标方法,字典的 updateValue(_:forKey:) 方法可以设置或者更新特定键对应的值。就像上面所示的 下标示例,
updateValue(_:forKey:) 方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的 值。和上面的下标方法不同的,
updateValue(_:forKey:) 这个方法返回更新值之前的原值。这样使得我们可以检 查更新是否成功。

*/
if let oldValue = airports.updateValue("JANKZ国际航空", forKey: "JANKZ") {
    print("The old value for JANKZ国际航空 was \(oldValue)")
}


if let airportName = airports["JANKZ"] {
    print("The airport is \(airportName)")
} else {
    print("The airport is not in this dictionary!")
}

//我们还可以使用下标语法来通过给某个键的对应值赋值为 nil 来从字典里移除一个键值对:

airports["apple"] = "苹果航空"
airports["JANKZ"] = nil
airports

//此外, removeValueForKey(_:) 方法也可以用来在字典中移除键值对。
//这个方法在键值对存在的情况下会移除该键 值对并且返回被移除的值或者在没有值的情况下返回 nil :
if let removeValue = airports.removeValueForKey("apple") {
    print("The remove airport'name is \(removeValue) ")
} else {
    print("The airports dictionary does not contain a value of DUB")
}


//字典遍历

for (airportCode,airportName) in airports {
    print("\(airportCode) : \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport Name: \(airportName)")
}


//数组构造字典 
let airportCode = [String](airports.keys)
let airportName = [String](airports.values)
airports



