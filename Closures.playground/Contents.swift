//: Playground - noun: a place where people can play
//this code made by jankz jankz@jankz.com
import UIKit

var str = "Hello, playground"
/******************************** 闭包 *********************************/
print("闭包是自包含的函数代码块,可以在代码中被传递和使用。Swift 中的闭包与 C 和Objective-C 中的代码块(blocks)以及其他一些编程语言中的匿名函数比较相似。")

/*

闭包可以捕获和存储其所在上下文中任意常量和变量的引用。这就是所谓的闭合并包裹着这些常量和变量,俗称 闭包。Swift 会为您管理在捕获过程中涉及到的所有内存操作。

*/

/*

• 全局函数是一个有名字但不会捕获任何值的闭包
• 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
• 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

*/

/******************************** 闭包表达式     *********************************/
print("闭包表达式")
let names = ["Chris", "Alex", "Ewa", "Danreila"]
func backwards(s1: String, s2:String) -> Bool {
    return s1 > s2
}

var reversed = names.sort()
var reversedNew = names.sort(backwards) //逆序输出
print("对于字符串中的字符来说 ‘大于’ 表示按照字母顺序较晚出现 B>A ")

//闭包表达式语法
print("闭包表达式语法")
   
/*


    {(parameters) -> returnType in
        statements
    }


*/

//闭包表达式语法可以使用常量、变量和 inout 类型作为参数,不能提供默认值。也可以在参数列表的最后使用可 变参数。元组也可以作为参数和返回值。
print("闭包表达式语法可以用常量、变量和inout 类型作为参数，不能提供默认值。也可以在参数列表的最后使用可变参数。元组也可以作为参数和返回值")

reversed = names.sort({(s1: String, s2: String) -> Bool in
    return s1 > s2
})
//reversed = names.sort({(s1: String, s2: String) -> Bool in return s1 > s2})  //写成一行


print("在内联闭包表达式中,函数和返回值类型都写在大括号内,而不是大 括号外。")
//闭包的函数体部分由关键字 in 引入。该关键字表示闭包的参数和返回值类型定义已经完成,闭包函数体即将开 始。
print("闭包的函数体部分由关键字 in 引入。该关键字表示闭包的参数和返回值类型定义已经完成,闭包函数体即将开 始。")


//根据上下文推断类型(Inferring Type From Context)



/*

因为排序闭包函数是作为 sort(_:) 方法的参数传入的,Swift 可以推断其参数和返回值的类型。 
sort(_:) 方法 被一个字符串数组调用,因此其参数必须是 (String, String) -> Bool 类型的函数。
这意味着 (String, String) 和 Bool 类型并不需要作为闭包表达式定义的一部分。
因为所有的类型都可以被正确推断,返回箭头( -> )和 围绕在参数周围的括号也可以被省略:

*/

reversed = names.sort({s1, s2 in return s1 > s2 })     //上下文推断类型


//单表达式闭包隐式返回(Implicit Return From Single-Expression Clossures)

print("单表达式闭包隐式返回(Implicit Return From Single-Expression Clossures)")

//单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果
reversed = names.sort({ s1, s2 in s1 > s2 })   //省略return 写成单行模式


//参数名称缩写(Shorthand Argument Names)

print("参数名称缩写(Shorthand Argument Names)")
/*

    Swift 自动为内联闭包提供了参数名称缩写功能,您可以直接通过 $0 , $1 , $2 来顺序调用闭包的参数,以此 类推

*/


reversed = names.sort({$0 > $1})  //这个例子中$0 和 $1 表示闭包中的第一个和第二个参数

//运算符函数
print("运算符函数")

reversed = names.sort(>)  //真是绝了 闭包还真不错




/******************************** 尾随闭包       *********************************/
print("尾随闭包(Trailing Closures)")

/*

    如果您需要将一个很长的闭包表达式作为最后一个参数传递给函数,可以使用尾随闭包来增强函数的可读性。
    尾随闭包是一个书写在函数括号之后的闭包表达式,函数支持将其作为最后一个参数调用


    func someFunctionThatTakesAClosure(closure: () -> Void) { 
        // 函数体部分
    }

// 以下是不使用尾随闭包进行函数调用
    someFunctionThatTakesAClosure({
        // 闭包主体部分 })

// 以下是使用尾随闭包进行函数调用 
    someFunctionThatTakesAClosure() {
        // 闭包主体部分 }


*/

reversed = names.sort() {$0 > $1}

reversed = names.sort {$0 > $1 }

let digitNames = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
strings
/******************************** 捕获值         *********************************/
print("闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在,闭包仍然可以在闭包函数体内引用和修改这些值。")

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor  //返回函数
}
/*

    makeIncrementor 返回类型为 () -> Int 。这意味着其返回的是一个函数,而不是一个简单类型的值。该函数在 每次调用时不接受参数,只返回一个 Int 类型的值。

*/

let incrementByTen = makeIncrementor(forIncrement: 10)

incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
incrementBySeven()





/******************************** 闭包是引用类型 *********************************/

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen() //这里证明闭包是引用类型


/******************************** 非逃逸闭包    *********************************/
print("当一个闭包作为参数传到一个函数中,但是这个闭包在函数返回之后才被执行,我们称该闭包从函数中逃逸")

/*

    当定义接受闭包作为参数的函数时,你可以在参数名之前标注 @noescape ,用来指明这个闭包是不允许“逃 逸”出这个函数的。
    将闭包标注 @noescape 能使编译器知道这个闭包的生命周期(译者注:闭包只能在函数体中 被执行,不能脱离函数体执行,所以编
    译器明确知道运行时的上下文),从而可以进行一些比较激进的优化。

    func someFunctionWithNoescapeClosure(@noescape closure: () -> Void) {
        closure()
    }

*/
print("在参数名之前标注 @noescape ,用来指明这个闭包是不允许“逃 逸”出这个函数的。")

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoescapeClosure(@noescape closure: () -> Void) {
    closure()
}
/*

someFunctionWithEscapingClosure(_:) 函数接受一个闭包作为参数,该闭包被添加到一个函数外定义的数组 中。
如果你试图将这个参数标注为 @noescape ,你将会获得一个编译错误。

*/
print("将闭包标注为 @noescape 使你能在闭包中隐式地引用 self 。")

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNoescapeClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)



/******************************** 自动闭包     *********************************/



