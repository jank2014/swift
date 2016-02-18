//: Playground - noun: a place where people can play

import UIKit
/******************************************* 错误处理(Error Handling) ********************************************************/
print("错误处理(Error handling)是响应错误以及从错误中恢复的过程。swift提供了在运行对可恢复错误抛出,捕 获,传送和操作的高级支持。")

/******************************************* 表示错误抛出 ********************************************************/


enum VendingMachineError: ErrorType {
    case InvalidSelection           //选择无效
    case InsufficientFunds(coinsNeeded: Int)        //金额不足
    case OutOfStock                 //缺货
}

print("抛出一个错误会让你对所发生的意外情况做出提示,表示正常的执行流程不能被执行下去。抛出错误使用 throws 关键字。比如下面的代码抛出一个错误,提示贩卖机还需要5个硬币:")

throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)
/*
    注意 Swift中的错误处理和其他语言中的用 try , catch 和 throw 的异常处理(exception handling)很像。
    和 其他语言中(包括Objective-C)的异常处理不同的是,Swift中的错误处理并不涉及堆栈解退(Stack unwindin g),
    这是一个计算昂贵(computationally expensive)的过程。就此而言, throw 语句的性能特性是可以和return 语句相当的。

*/

/******************************************* 错误处理 ********************************************************/

print("用throwing函数传递错误")
/*
    用 throws 关键字标来识一个可抛出错误的函数,方法或是构造器。在函数声明中的参数列表之后加上 throws 。
    一个标识了 throws 的函数被称作throwing函数。如果这个函数还有返回值类型, throws 关键词需要写在箭 头(->)的前面。
    func canThrowErrors() throws -> String
    func cannotThrowErrors() -> String
*/

//用throwing函数传递错误

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }

    

func vend(itemNamed name: String) throws {
    guard var item = inventory[name] else {
        throw VendingMachineError.InvalidSelection
    }
    guard item.count > 0 else {
        throw VendingMachineError.OutOfStock
    }
    guard item.price <= coinsDeposited else {
        throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
    }
    coinsDeposited -= item.price
    --item.count
    inventory[name] = item
    dispenseSnack(name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
//上例中 buyFavoriteSnack(_:vendingMachine) 函数会查找某人最喜欢的零食,并通过调用 vend(itemNamed:) 方法 来尝试为他们买。
//因为 vend(itemNamed:) 方法能抛出错误,所以在调用的它时候在它前面加了 try 关键字。

//用 Do-Catch 处理错误
print("用 Do-Catch 处理错误")
//可以使用一个 do-catch 语句运行一段闭包代码来做错误处理。
//如果在 do 语句中的代码抛出了一个错误,则这个 错误会与 catch 语句做匹配来决定哪条语句能处理它。 下面是 do-catch 语句的通用形式:
/*
        do {
            try expression
            statements
        } catch pattern 1 {
            statements
        } catch pattern 2 where condition {
            statements
        }


*/
//在 catch 后面写一个模式(pattern)来表示这个语句能处理什么样的错误。
//如果一条 catch 语句没带一个模式,那 么这条语句可以和任何错误相匹配,并且把错误和一个名字为 name 的局部常量做绑定
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
print("将错误转换成可选值")
//可以使用  try? 通过将其转换成一个可选值来处理错误。如果在评估   try?表达式时一个错误被抛出,那么这个表 达式的值就是nil 。例如下面代码中的 x和 y有相同的值和特性:
/*
        func someThrowingFunction() throws -> Int {
            // ...
        }
        let x = try? someThrowingFunction()
        let y: Int?
        do {
            y = try someThrowingFunction()
        } catch {
            y = nil
        }
*/
/*
    如果 someThrowingFunction() 抛出一个错误, x 和 y 的值是 nil 。否则 x 和 y 的值就是该函数的返回值。
    注意 无论 someThrowingFunction() 的返回值类型是什么类型, x 和 y 都是这个类型的可选类型。
    例子中此函数返回一 个整型,所以 x 和 y 是整型的可选类型。 如果你想对所有的错误都采用同样的方式来处理,用 try? 
    就可以让你 写出简洁的错误处理代码。比如下面的代码用一些的方式来获取数据,如果所有的方法都失败则返回 nil 。

    func fetchData() -> Data? {
        if let data = try? fetchDataFromDisk() { return data }
        if let data = try? fetchDataFromServer() { return data }
        return nil
    }
*/

print(<#T##items: Any...##Any#>)


// let photo = try! loadImage("./Resources/John Appleseed.jpg")

/******************************************* 指定清除处理********************************************************/
/*

func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() { // 处理文件
        }
        // 在这里,作用域的最后调用 close(file) }
}
*/


