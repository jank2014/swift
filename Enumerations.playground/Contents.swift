//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/******************************* 枚举类型 ******************************************/

//枚举类型定义
print("使用 enum 关键词来创建枚举并且把它们的整个定义放在一对大括号内:")
enum CompassPoint {
    case North
    case South
    case East
    case West
}

let MyCompassPointStrat = CompassPoint.East
let MyCompassPointEnd = CompassPoint.West


enum Plant {
    case 金, 木, 水, 火, 土, 地球 //值较多时可以定义在一行 不用引号 有逗号隔开
}

let startPlant = Plant.地球
var endPlant = Plant.土
/******************************* 使用switch语句匹配枚举值 ******************************/
var directionToHead = CompassPoint.West
directionToHead = .South
print("当 directionToHead 的类型已知时,再次为其赋值可以省略枚举类型名。在使用具有显式类型的枚举值时,这种 写法让代码具有更好的可读性。")

switch directionToHead {
case .North:
    print("Good North")
case .South:
    print("Good South")
case .West:
    print("Good West")
case .East:
    print("Good East")
    
}

endPlant = .水
switch endPlant {
case .水:
    print("终点目的地是水星 ！")
default:
    print("终点是其他星球")
}



/******************************* 关联值 ******************************************/
enum Barcode {
    case UPCA(Int, Int, Int, Int)   //一维条形码
    case QRCode(String)             //日本人发明的QR二维码
}

var productBarcode = Barcode.UPCA(8, 88888, 44444, 3)

//productBarcode = Barcode.QRCode("吉贞婴幼儿奶粉")


switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("The UPC-A:\(numberSystem)\(manufacturer)\(product)\(check)")
case .QRCode(let productCode):
    print("qrcode: \(productCode)")
}



/******************************* 原始值 ******************************************/

/*

    在关联值 (页 0)小节的条形码例子中,演示了如何声明存储不同类型关联值的枚举成员。
    作为关联值的替代选 择,枚举成员可以被默认值(称为原始值)预填充,这些原始值的类型必须相同。

*/

enum ASSIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print("原始值可以是字符串,字符,或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。")

/*

    注意
    原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值,像上述三个 ASCII 码。
    对于一个特定的枚 举成员,它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值,枚举成员的关联值 可以变化。

*/
print("在使用原始值为整数或者字符串类型的枚举时,不需要显式地为每一个枚举成员设置原始值,Swift 将会自动为 你赋值。")

//例如,当使用整数作为原始值时,隐式赋值的值依次递增 1 。如果第一个枚举成员没有设置原始值,其原始值将 为0。

enum PlantNew :Int {
    case 地球 = 1, 金, 木, 水星, 土星, 天王星, 海王星
}
PlantNew.地球
PlantNew.水星


enum CompassPointNew: String {
    case 东, 南, 西, 北
}


//使用枚举成员的rawValue属性可以访问该枚举成员的原始值
print("使用枚举成员的rawValue属性可以访问该枚举成员的原始值")
let earthsOrder = PlantNew.地球.rawValue
let earthHash = PlantNew.地球.hashValue
print(" 18329004144 74vD8jyr")



/******************************* 递归枚举 ******************************************/

print("递归枚举")

/* 

递归枚举(recursive enumeration)是一种枚举类型,它有一个或多个枚举成员使用该枚举类型的实例作为关联 值。
使用递归枚举时,编译器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归。

*/

enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}


//你也可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的:")

print("你也可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的:")
indirect enum ArithmeticExpressionTwo {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)

}

//该函数如果遇到纯数字,就直接返回该数字的值。如果遇到的是加法或乘法运算,则分别计算左边表达式和右边表达式的值,然后相加或相乘。

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
    
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product)) //输出18






