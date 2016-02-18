//: Playground - noun: a place where people can play
//made by janzk jankz@jankz.com
import UIKit

var str = "Hello, playground"

/*********************************The Basic*********/

// 1.变量 常量 let var 来声明

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

// 2.类型标注

var welcomeMessage:String  //声明一个类型为String类型的值
welcomeMessage = "Hello Jankz"

//可以在一行中定义多个同样类型的变量 用逗号分开 并在最后一个变量名之后添加类型标注

var red, green, blue: Double

var name, sex, age, email, score: String


// 3.变量常量的命名

let pi = 3.1415926
let 你好 = "你好世界，你好jankz"
let ？？ = "dogcow"

// 4.变量常量输出
print(你好)
print("Pi的近似值是\(pi)")



/******** 注释***********/
//1.双斜杠

//这是个注释


//行注释

/*
这是一行
注释
*/


//嵌套注释

/*
123

/*这是嵌套注释（代码段）*/

我是嵌套注释

*/

/********* 分号 *************/
//与其他大部分编程语言不同,Swift 并不强制要求你在每条语句的结尾处使用分号( ; ),
//当然,你也可以按照 你自己的习惯添加分号。有一种情况下必须要用分号,即你打算在同一行内写多条独立的语句:
let cat = "？";print(cat)
let jankz = "Jankz is good man";print(jankz)

/********* 整数 *************/
//一般来说,你不需要专门指定整数的长度。Swift 提供了一个特殊的整数类型   ,长度与当前平台的原生字长 相同:

let min8Value = Int8.min
let max8Value = Int8.max

let min16Value = Int16.min
let max16Value = Int16.max

let min32Value = Int32.min
let max32Value = Int32.max

let min64Value = Int64.min
let max64Value = Int64.max


//Swift 也提供了一个特殊的无符号类型 UInt ,长度与当前平台的原生字长相同: • 在32位平台上, UInt 和 UInt32 长度相同。
//在64位平台上, UInt 和 UInt64 长度相同。

let umin8Value = UInt8.min
let umax8Value = UInt8.max

let umin16Value = UInt16.min
let umax16Value = UInt16.max

let umin32Value = UInt32.min
let umax32Value = UInt32.max

let umin64Value = UInt64.min
let umax64Value = UInt64.max


/********* 浮点数 *************/
/*
浮点数是有小数部分的数字,比如 3.14159 , 0.1 和 -273.15 。
浮点类型比整数类型表示的范围更大,可以存储比 Int 类型更大或者更小的数字。Swift 提供了两种有符号浮点 数类型:
Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。 Float表示32位浮点数。精度要求不高的话可以使用此类型
*/
//Double 精确度很高,至少有15位数字,而 Float 最少只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围。

let newPiFloat: Float = 3.1415926123456789     //精确6位
let newPiDouble: Double = 3.1415926123456789   //精确15位


/********* 类型安全和类型推断 *************/

let meaningOfLife = 42
let pi01 = 3.14158
let anotherPi = 3 + 0.1415926


/********** 数值型字面量 ******************/

/*

• 一个十进制数,没有前缀
• 一个二进制数,前缀是 0b
• 一个八进制数,前缀是 0o
• 一个十六进制数,前缀是 0x

*/
let decimalInteger = 17         //十进制17
let binaryInteger = 0b10001     //二进制17
let octalInteger = 0o21         //八进制17
let hexadecimalInteger = 0x11   //十六进制17

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadcimalDouble = 0xC.3p0 //这里有点不懂
/*

浮点字面量可以是十进制(没有前缀)或者是十六进制(前缀是 0x )。小数点两边必须有至少一个十进制数 字(或者是十六进制的数字)。浮点字面量还有一个可选的指数(exponent,在十进制浮点数中通过大写或者小 写的 e 来指定,在十六进制浮点数中通过大写或者小写的 p 来指定。
如果一个十进制数的指数为 exp ,那这个数相当于基数和10^exp的乘积: * 1.25e2 表示 1.25 × 10^2,等于 125.0 。 * 1.25e-2 表示 1.25 × 10^-2,等于 0.0125 。
如果一个十六进制数的指数为 exp ,那这个数相当于基数和2^exp的乘积: * 0xFp2 表示 15 × 2^2,等于 6 0.0 。 * 0xFp-2 表示 15 × 2^-2,等于 3.75 。

*/



/************* 数值型类型转换 *****************/

let cannotBeNegative: UInt8 = 255
//let cannotBeNegative: UInt8 = -1     //超出值
//let cannotBeNegative: UInt8 = 256     //超出值

let twoThousand: UInt16 = 2_000
let one:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


//整数和浮点数转换
let three = 3
let pointOneFourFiveNine = 0.14159
let pipin = Double(three) + pointOneFourFiveNine
//常量 three 的值被用来创建一个 Double 类型的值,所以加号两边的数类型须相同。如果不进行转 换,两者无法相加。
let integerPi = Int(pipin)
let integer39 = Int(-3.9)


/************* 数值型类型转换 *****************/
//类型别名(type aliases)就是给现有类型定义另一个名字。你可以使用 typealias 关键字来定义类型别名。
typealias jankzInt = Int32
let jankzIntMin = jankzInt.min
let jankzIntMax = jankzInt.max


/************* 布尔值 *****************/
//Swift 有一个基本的布尔(Boolean)类型,叫做 Bool 。布尔值指逻辑上的值,因为它们只能是真或者假。Swift 有两个布尔常量, true 和 false :

let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm tasty turnips!")
} else{
    print("Eww, turnips are horrible.")
}
let i = 1
if i == 1 {
    
}

/************* 元组 *****************/
//元组(tuples)把多个值组合成一个复合值。元组内的值可以是任意类型,并不要求是相同类型。
let http404Error = (404,"Not Found")

let (statusCode,statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The Message is \(statusMessage)")
print(http404Error.0)
print(http404Error.1)
let http200Status = (statusCode: 200,description: "OK")
print(http200Status.statusCode)
print(http200Status.description)


/************* 可选类型 *****************/

//使用可选类型(optionals)来处理值可能缺失的情况。可选类型表示:
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//一个可选的 Int 被写 作 Int? 而不是 Int 。问号暗示包含的值是可选类型,也就是说可能包含 Int 值也可能不包含值
var serverResoponseCode: Int? = 404
serverResoponseCode = nil

var surveyAnswer: String?
//Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中, nil 是一个指向不存在对象的指 针。
//在 Swift 中, nil 不是指针——它是一个确定的值,用来表示值缺失。任何类型的可选状态都可以被设置 为 nil ,不只是对象类型。



// 2 if 语句以及强制解析
if convertedNumber != nil{
    print("convertedNumbr contains some integer value")
}
//当你确定可选类型确实包含值之后,你可以在可选的名字后面加一个感叹号( ! )来获取值。
//这个惊叹号表 示“我知道这个可选有值,请使用它。”这被称为可选值的强制解析(forced unwrapping):
if convertedNumber != nil{
    print("convertedNumbr contains some integer value of\(convertedNumber!).")
}

// 3 可选绑定
//使用可选绑定(optional binding)来判断可选类型是否包含值,如果包含就把值赋给一个临时常量或者变量。
//可选绑定可以用在 if 和 while 语句中,这条语句不仅可以用来判断可选类型中是否有值,同时可以将可选 类型中的值赋给一个常量或者变量。
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber) ")
}

/************* 断 言 *************** */
let jankzAge = 3
assert(jankzAge >= 0, "A person's age can't be less than zero")

//断言
