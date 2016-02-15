//: Playground - noun: a place where people can play
// made by jankz jankz@jankz.com
print("This code is made by jankz")
print("函数(Functions)")

import UIKit

var str = "Hello, playground"

/******************************** 函数的定义与调用 *************************************/
print("函数是用来完成特定任务的独立的代码块。")
func sayHello(personName: String) ->String {
    let greeting = "Hello ," + personName + "!"
    return greeting
}

sayHello("jankz")
print(sayHello("PINCK"))




/******************************** 函数参数与返回值  *************************************/

//无参函数
func sayHelloWorld() -> String {
    return "Hello World!"
}
print(sayHelloWorld())

print("尽管这个函数没有参数,但是定义中在函数名后还是需要一对圆括号。当被调用时,也需要在函数名后写一对圆括号")

//多参函数
func sayHelloPreson(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloWorld()
    }else{
        return sayHello(personName)
    }
}

sayHelloPreson("JANKZ", alreadyGreeted: false)
sayHelloPreson("tank", alreadyGreeted: true)

//无返回值函数(Functions Without Return Values)
print("无返回值函数(Functions Without Return Values")

func sayGoodBye(personName: String) {
    print("Goodbye, \(personName)")
}

sayGoodBye("JANKZ2016")
/*

注意
严格上来说,虽然没有返回值被定义,sayGoodbye(_:) 函数依然返回了值。
没有定义返回类型的函数会返回特 殊的值,叫 Void 。它其实是一个空的元组(tuple),没有任何元素,可以写成 () 。

*/

//多重返回值函数(Functions with Multiple Return Values)
print("多重返回值函数(Functions with Multiple Return Values")
func minMax(array: [Int]) -> (min:Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
var (x,y) = minMax([1,2,3,4,5,6,7,8,18])!
print(x)
print(y)

if let bounds = minMax([8, -6, 2, 109, 3, 71]) {
    print("MIN is \(bounds.min) and MAX is \(bounds.max)")
}




/******************************** 函数参数名称     *************************************/


//函数参数都有一个外部参数名(external parameter name)和一个局部参数名(local parameter name)。
//外部 参数名用于在函数调用时标注传递给函数的参数,局部参数名在函数的实现内部使用
/*

func someFunction(firstParameterName: Int, secondParameterName: Int) {
// function body goes here
// firstParameterName and secondParameterName refer to
// the argument values for the first and second parameters
}
someFunction(1, secondParameterName: 2)

*/

print("一般情况下,第一个参数省略其外部参数名,第二个以及随后的参数使用其局部参数名作为外部参数名")


//指定外部参数名(Specifying External Parameter Names）
print("如果你提供了外部参数名,那么函数在被调用时,必须使用外部参数名。")


func sayHelloNew(to preson :String, and anotherPerson: String) -> String {
    return "Hello \(preson) and \(anotherPerson)"
}
print(sayHelloNew(to: "jankz", and: "hiny"))
//忽略外部参数名(Omitting External Parameter Names)

print("如果你不想为第二个及后续的参数设置外部参数名,用一个下划线( _ )代替一个明确的参数名。")
func sayHelloNewTwo(to preson :String, _ anotherpreson : String) -> String {
    return "Hello \(preson) and "
}

//默认参数

print("你可以在函数体中为每个参数定义 默认值(Deafult Values) 。当默认值被定义后,调用这个函数时可以忽略这个参数。")
func someFunction(parameterWithDefault: Int = 12) {
    print(parameterWithDefault)
}
someFunction()
//someFunction(18)


//可变参数(Variadic Parameters)
//下面的这个函数用来计算一组任意长度数字的 算术平均数(arithmetic mean) 
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)


arithmeticMean(12, 11.23, 23)

print("一个函数最多只能有一个可变参数。如果函数有一个或多个带默认值的参数,而且还有一个可变参数,那么把可变参数放在参数表的最后。")


//常量参数和变量参数(Constant and Variable Parameters)
print("函数参数默认是常量。你可以通过指定一个或多个参数为变量参数,从而避免自己在函数中定义新的变量。")

func alignRight(var string: String, totalLength: Int, pad: Character) ->String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")


/******************************** 函数类型        *************************************/
print("每个函数都有种特定的函数类型,由函数的参数类型和返回类型组成。")
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}


func printHelloWorld() {
    print("hello, world")
}
print("这个函数的类型是: () -> void ,或者叫“没有参数,并返回 Void 类型的函数”。")

//有相同匹配类型的不同函数可以被赋值给同一个变量,就像非函数类型的变量一样:
var mathFunction: (Int, Int) -> Int = addTwoInts
var anotherMathFunction = addTwoInts



func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}


/******************************** 嵌套函数        *************************************/


print("也可以把函数定义在 别的函数体中,称作嵌套函数(nested functions)。")

//默认情况下,嵌套函数是对外界不可见的,但是可以被它们的外围函数(enclosing function)调用。一个外围 函数也可以返回它的某一个嵌套函数,使得这个函数可以在其他域中被使用。

func chooseStepFunctionNew(backwords: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    return backwords ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunctionNew(currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("Over!")



