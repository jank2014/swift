//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************************************************* 泛型(Generics) ********************************************************/
//泛型代码可以让你写出根据自我需求定义、适用于任何类型的,灵活且可重用的函数和类型。它的可以让你避免重复的代码,用一种清晰和抽象的方式来表达代码的意图。



/********************************************************* 泛型所解决的问题 ********************************************************/
//这里是一个标准的,非泛型函数 swapTwoInts ,用来交换两个Int值:
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
someInt
anotherInt
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//但实际应用中通常需要一个用处更强大并且尽可能的考虑到更多的灵活性单个函数,可以用来交换两个任何类型值,很幸运的是,泛型代码帮你解决了这种问题。

/********************************************************* 泛型函数 ********************************************************/
print("泛型函数 可以工作于任何类型,这里是一个上面 swapTwoInts(_:_:) 函数的泛型版本,用于交换两个值:")
func swapTwoValues<T>(inout a: T,inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
print("")

// func swapTwoInts(inout a: Int, inout _ b: Int)
//func swapTwoValues<T>(inout a: T, inout _ b: T)
/*

这个函数的泛型版本使用了占位类型名字(通常此情况下用字母 来表示)来代替实际类型名(如Int 、String 或 Double  )。
占位类型名没有提示 T必须是什么类型,但是它提示了 a  和  b 必须是同一类型   ,而不管 T  表 示什么类型。只有 函数在每次调用时所传入的实际类型才能决定 T所代表的类型。
另外一个不同之处在于这个泛型函数名后面跟着的占位类型名字(T)是用尖括号括起来的(<T> )。这个尖括号 告诉 Swift 那个  T 是  swapTwoValues  函数所定义的一个类型。因为   是一个占位命名类型,Swift 不会去 查找命名为T的实际类型。


*/


 someInt = 3
 anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
var someString = "Hello "
var anotherStrig = "World "
swapTwoValues(&someString, &anotherStrig)
someString
anotherStrig


/********************************************************* 类型参数 ********************************************************/
//在上面的 swapTwoValues  例子中,占位类型 是一种类型参数的示例。类型参数指定并命名为一个占位类型,并 且紧随在函数名后面,使用一对尖括号括起来(如 )。
//你可支持多个类型参数,命名在尖括号中,用逗号分开。


/********************************************************* 命名类型参数 ********************************************************/
//在简单的情况下,泛型函数或泛型类型需要指定一个占位类型(如上面的 swapTwoValues   泛型函数,或一个存储 单一类型的泛型集,如数组),
//通常用一单个字母 T 来命名类型参数。不过,你可以使用任何有效的标识符来作 为类型参数名。

//如果你使用多个参数定义更复杂的泛型函数或泛型类型,那么使用更多的描述类型参数是非常有用的。例如,Swift 字典(Dictionary)类型有两个类型参数,一个是键,另外一个是值。
//如果你自己写字典,你或许会定义这两 个类型参数为  key和 value   ,用来记住它们在你的泛型代码中的作用。

print("注意 请始终使用大写字母开头的驼峰式命名法(例如   和   )来给类型参数命名,以表明它们是类型的占位 符,而非类型值。")


/********************************************************* 泛型类型 ********************************************************/
print("泛型类型")


//通常在泛型函数中,Swift 允许你定义你自己的泛型类型。这些自定义类、结构体和枚举作用于任何类型,如同 Array和Dictionary的用法。



/*

    一个栈是一系列值域的集合,和 array  (数组)类 似,但其是一个比 Swift 的  array 类型更多限制的集合。一个数组可以允许其里面任何位置的插入/删除操 作,
    而栈,只允许在集合的末端添加新的项(如同push一个新值进栈)。同样的一个栈也只能从末端移除项(如 同pop一个值出栈)。

*/

struct IntStack {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
//这个结构体在栈中使用一个 Array 性质的 items 存储值。 Stack 提供两个方法: push 和 pop ,从栈中压进一个 值和移除一个值。
//这些方法标记为可变的,因为它们需要修改(或转换)结构体的 items 数组。

print("这里是一个相同代码的泛型版本:")
struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}
//注意到 Stack 的泛型版本基本上和非泛型版本相同,但是泛型版本的占位类型参数为T代替了实际 Int 类型。这种类型参数包含在一对尖括号里( <T> ),紧随在结构体名字后面。

print("你可以通过在尖括号里写出栈中需要存储的数据类型来创建并初始化一个 Stack 实例。比如,要创建一个 strings 的栈,你可以写成 Stack<String>() :")

var stackOfStrings = Stack<String>()
stackOfStrings.push("UNO")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
let fromTheTop = stackOfStrings.pop()



/********************************************************* 拓展一个泛型类型 ********************************************************/
/*

    当你扩展一个泛型类型的时候,你并不需要在扩展的定义中提供类型参数列表。更加方便的是,原始类型定义中声明的类型参数列表在扩展里是可以使用的,
    并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。

*/

extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

print("topItem 属性会返回一个 T 类型的可选值。当栈为空的时候, topItem 将会返回 nil ;当栈不为空的时候, top Item 会返回 items 数组中的最后一个元素。")
if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}

/********************************************************* 类型约束 ********************************************************/

//swapTwoValues(_:_:) 函数和 Stack 类型可以作用于任何类型,不过,有的时候对使用在泛型函数和泛型类型上 的类型强制约束为某种特定类型是非常有用的。
//类型约束指定了一个必须继承自指定类的类型参数,或者遵循一 个特定的协议或协议构成。

print("类型约束语法")
//你可以写一个在一个类型参数名后面的类型约束,通过冒号分割,来作为类型参数链的一部分。这种作用于泛型
//函数的类型约束的基础语法如下所示(和泛型类型的语法相同):
print("通过冒号分割")
/*
    func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) { 
        // 这里是函数主体
    }
*/

//类型约束实例
func findStringIndex(array: [String], _ valueToFind: String) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil

}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
    print("The index of llama is \(foundIndex)")
}














/********************************************************* 关联类型 ********************************************************/
//当定义一个协议时,有的时候声明一个或多个关联类型作为协议定义的一部分是非常有用的。一个关联类型作为 协议的一部分,给定了类型的一个占位名(或别名)。
//作用于关联类型上实际类型在协议被实现前是不需要指定 的。关联类型被指定为 typealias 关键字。

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
//这个协议没有指定容器里的元素是如何存储的或何种类型是允许的。这个协议只指定三个任何遵循 container  类 型所必须支持的功能点。
//一个遵循的类型在满足这三个条件的情况下也可以提供其他额外的功能。
struct MyIntStack: Container {
    // IntStack的原始实现
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // 遵循Container协议的实现 typealias ItemType = Int
    mutating func append(item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
//IntStack 类型实现了 Container 协议的所有三个要求,在 IntStack 类型的每个包含部分的功能都满足这些要 求。

/********************************************************* where 语句 ********************************************************/


/*

    对关联类型定义约束是非常有用的。你可以在参数列表中通过where语句定义参数的约束。一个 where 语句能够使 一个关联类型遵循一个特定的协议,
    以及(或)那个特定的类型参数和关联类型可以是相同的。你可以写一个 wh ere 语句,紧跟在在类型参数列表后面,where语句后跟一个或者多个针对关联类型的约束,
    以及(或)一个或多 个类型和关联类型间的等价(equality)关系。

*/


func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, anotherContainer: C2) -> Bool {
        // 检查两个Container的元素个数是否相同
        if someContainer.count != anotherContainer.count {
            return false
        }
        for i in 0..<someContainer.count {
        // 检查两个Container相应位置的元素彼此是否相等 for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // 如果所有元素检查都相同则返回true return true
return true
}





