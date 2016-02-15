//: Playground - noun: a place where people can play
//made by jankz jankz@jankz.com
print("This code made by jankz email:jankz@jankz.com.")
import UIKit

var str = "Hello, playground"

/************************************ for循环 **************************************/
print("************************************ for循环 **************************************")
//for in 循环
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//如果你不需要知道区间序列内每一项的值,你可以使用下划线( _ )替代变量名来忽略对值的访问:
print("如果你不需要知道区间序列内每一项的值,你可以使用下划线( _ )替代变量名来忽略对值的访问:")
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")


let names = ["Anna","Alex","Brain","Jack"]
for name in names {
    print("Hello \(name)")
}

//你也可以通过遍历一个字典来访问它的键值对。遍历字典时,字典的每项元素会以 (key, value) 元组的形式返 回
//你可以在 for-in 循环中使用显式的常量名称来解读 (key, value) 元组。
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName,animalLegs) in numberOfLegs {
    print("The \(animalName) has \(animalLegs) legs")
}

//字典是无序的
//除了 for-in 循环,Swift 提供使用条件判断和递增方法的标准 C 样式 for 循环:
for var index = 0; index < 3; ++index {
    print("Index is : \(index)")
}
var index: Int
for index = 0; index < 5; index++ {
    print("The Index is : \(index)")
}

/************************************ While循环 **************************************/
print("************************************ While循环 **************************************")
//• while循环,每次在循环开始时计算条件是否符合;
print("• while循环,每次在循环开始时计算条件是否符合;")
/*

while condition {
    statements
}

*/
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("Game over!")

//• repeat-while循环,每次在循环结束时计算条件是否符合。
print("• repeat-while循环,每次在循环结束时计算条件是否符合。")
/*

repeat {
    statements
} while condition

*/
/*
let finalSquare1 = 25
var board1 = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square1 = 0
var diceRoll1 = 0

repeat {
//    square1 += board1[square1]
if ++diceRoll1 == 7 {
        square1 += diceRoll1
    }
} while square1 < finalSquare1
print("Game over!")

*/
/************************************ 条件语句 if **************************************/
print("*********************************** 条件语句 if **************************************")
var temperatureInFahrenheit = 30

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
    print("It's very cold consider wearing a scarf.")
} else {
    print("It's not that cold.Wearing a t-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86{
    print("It's very cold.Don't forget fo wear sunscreen.")
} else {
    print("It's not that cold.Wear a t-shirt")
}


/************************************ switch 语句 **************************************/
print("************************************ switch 语句 **************************************")
let someCharacter: Character = "a"
switch someCharacter {
    case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vomel 元音字母")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant 辅音字母")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//每一个 case 分支都必须包含至少一条语句。像下面这样书写代码是无效的,因为第一个 case 分支是空的:
print("每一个 case 分支都必须包含至少一条语句。像下面这样书写代码是无效的,因为第一个 case 分支是空的:")
//case "a":
//case "A":




//一个 case 也可以包含多个模式,用逗号把它们分开(如果太长了也可以分行写):
print("一个 case 也可以包含多个模式,用逗号把它们分开(如果太长了也可以分行写):")
/*

switch some value to consider {
case value 1, value 2:
statements }

*/


print("注意: 如果想要贯穿至特定的 case 分支中,请使用 fallthrough 语句")


print("区间匹配")

let approximateCount = 162
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
    
}
print("There are \(naturalCount) \(countedThings)")


//元组
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0,0) is at the origin")
case (_,0):
    print("(\(somePoint.0),0) is on the x-aris")
case (0,_):
    print("(\(0, somePoint.1) is on the y-aris)")
case (-2...2,-2...2):
    print("(\(somePoint.0),\(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0),\(somePoint.1)) is outside the box")
}
//
print("值绑定")

let anotherPoint = (2, 10)
switch anotherPoint {
case (let x, 0):
    print("on the x-aris with an x value of \(x)")
case (0, let y):
    print("on the y-aris with a y value of \(y)")
case let (x, y):
    print("Somewhere else at (\(x), \(y))")
}
//
print("Where")
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("在二四象限对角线上")
case let(x, y) where x == -y:
    print("在一三象限对角线上")
case let(x, y):
    print("普通点")
}









/************************************ 控制转移语句(Control Transfer Statements) ************************/
//continue 语句告诉一个循环体立刻停止本次循环迭代,重新开始下次循环迭代。就好像在说“本次循环迭代我已 经执行完了”,但是并不会离开整个循环体。
print("continue 语句告诉一个循环体立刻停止本次循环迭代,重新开始下次循环迭代。就好像在说“本次循环迭代我已 经执行完了”,但是并不会离开整个循环体。")
/*

注意: 在一个带有条件和递增的for循环体中,调用 continue 语句后,迭代增量仍然会被计算求值。
循环体继 续像往常一样工作,仅仅只是循环体中的执行代码会被跳过。

*/
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print("\(puzzleOutput)")

print("Break break 语句会立刻结束整个控制流的执行。当你想要更早的结束一个 switch 代码块或者一个循环体时,你都可以 使用 break 语句。")


/*

循环语句中的 break
当在一个循环体中使用 break 时,会立刻中断该循环体的执行,然后跳转到表示循环体结束的大括号( } )后的第 一行代码。
不会再有本次循环迭代的代码被执行,也不会再有下次的循环迭代产生。

*/
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "?", "一", "?":
    possibleIntegerValue = 1
case "2", "?", "二", "?":
    possibleIntegerValue = 2
case "3", "?", "三", "?":
    possibleIntegerValue = 3
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) maybe \(integerValue)")
} else {
    print("An integer value could not be found for \(numberSymbol)")
}

/*贯穿(Fallthrough)*/
//fallthough 可以通过循环匹配再继续
print("贯穿(Fallthrough)")
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is "
switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += "a prime number, and also "
    fallthrough
default:
    description += " an integer"
    
}


/*  带标签的语句  */
print("带标签的语句")
/*

gameLoop: while square != finalSquare {
if ++diceRoll == 7 { diceRoll = 1 }
switch square + diceRoll {
case finalSquare:
// 到达最后一个方块,游戏结束
break gameLoop
case let newSquare where newSquare > finalSquare:
// 超出最后一个方块,再掷一次骰子
continue gameLoop
default:
// 本次移动有效
square += diceRoll square += board[square]
} }
print("Game over!")

*/


/**** 提前提出 ****/
print("提前退出")

/*

像 if 语句一样, guard 的执行取决于一个表达式的布尔值。我们可以使用 guard 语句来要求条件必须为真 时,以执行 guard 语句后的代码。
不同于 if 语句,一个 guard 语句总是有一个 else 分句,如果条件不为真则执 行 else 分句中的代码。

*/
func greet(person: [String: String]) {
    guard let name = person["name"] else{
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name": "jankz"])
greet(["name": "jankz", "location": "ShaoGuan"])


print("相比于可以实现同样功能的 if 语句,按需使用 guard 语句会提升我们代码的可靠性。 它可以使你的代码连贯的 被执行而不需要将它包在 else 块中,它可以使你处理违反要求的代码使其接近要求。")


/**** 检测 API 可用性 ****/
print("检测 API 可用性")

/*

if #available(iOS 9, OSX 10.10, *) {
// 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
} else {
// 使用先前版本的 iOS 和 OS X 的 API
}

*/
//以上可用性条件指定了在 iOS 系统上, if 段的代码仅会在 iOS 9 及更高版本的系统上执行;在 OS X,仅会在 OS X v10.10 及更高版本的系统上执行。
//最后一个参数, * ,是必须写的,用于处理未来潜在的平台。

print("最后一个参数, * ,是必须写的,用于处理未来潜在的平台。")

/*

if #available(platform name version, ..., *) {
    statements to execute if the APIs are available
} else {
    fallback statements to execute if the APIs are unavailable
}


*/


/************************************ for循环 **************************************/
