//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/************************************ 方法 *************************************/


/*

    结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一。
    在 Objective-C 中,类是唯一能定义 方法的类型。但在 Swift 中,你不仅能选择是否要定义一个类/结构体/枚举,
    还能灵活的在你创建的类型(类/ 结构体/枚举)上定义方法。

*/


/************************************ 实例方法 *************************************/

/*
    实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
    实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能,并以此来支撑实例的功能。
    实例方法的语法与函数完全一致
*/

class Counter {
    var count = 0
    func increment() {
        ++count
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment()
counter.incrementBy(10)
counter.reset()

//方法的局部参数名称和外部参数名称(Local and External Parameter Names for Methods)

class CounterTwo {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counter2 = CounterTwo()
counter2.incrementBy(5, numberOfTimes: 3)
/*

    方法有两个参数:amount: Int, numberOfTimes: Int) 默认情况下只把amount: Int当作一个局部名称,
    但是把 numberOfTimes: Int 即看作局部名称又看作外部名称

*/


print("修改方法的外部参数名称(Modifying External Parameter Name Behavior for Methods)")
/*


    有时为方法的第一个参数提供一个外部参数名称是非常有用的,尽管这不是默认的行为。你可以自己添加一个显
    式的外部名称作为第一个参数的前缀来把这个局部名称当作外部名称使用。
    相反,如果你不想为方法的第二个及后续的参数提供一个外部名称,可以通过使用下划线( _ )作为该参数的显 式外部名称,这样做将覆盖默认行为。

*/


print("self 属性(The self Property)")
//类型的每一个实例都有一个隐含属性叫做 self , self 完全等同于该实例本身。你可以在一个实例的实例方法中 使用这个隐含的 self 属性来引用当前实例。

struct Point {
    var x = 0.0,y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 2.0, y: 12.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x ==1.0")
}

struct MyTest {
    var x = 0.0, y = 0.0
    func test(x: Double) -> Double {
        return self.x //带self 用来区别函数的参数
    }
}
let mytest = MyTest(x: 2.0, y: 2.0)
mytest.test(3.0)

print("在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)")
//结构体和枚举是值类型。一般情况下,值类型的属性不能在它的实例方法中被修改。

print(" 变异(mutating) ")
/*

    如果你确实需要在某个具体的方法中修改结构体或者枚举的属性,你可以选择 变异(mutating) 这个方 法,然后方法就可以从方法内部改变它的属性;
    并且它做的任何改变在方法结束时还会保留在原始结构中。方法 还可以给它隐含的 self 属性赋值一个全新的实例,这个新实例在方法结束后将替换原来的实例。

*/

print("要使用 变异 方法, 将关键字 mutating 放到方法的 func 关键字之前就可以了")

struct PointTwo {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePointTwo = PointTwo(x: 1.0, y: 1.0)
somePointTwo.moveByX(2.0, y: 3.0)
print("The point is at (\(somePointTwo.x),\(somePointTwo.y))")

//注意:不能在结构体类型常量上调用可变方法,因为常量的属性不能被改变,即使想改变的是常量的变量属性也 不行

//let fixedPoint = PointTwo(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)
// 这里将会抛出一个错误


print("在可变方法中给 self 赋值(Assigning to self Within a Mutating Method)")
struct NewPoint {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = NewPoint(x: x + deltaX, y: y + deltaY)
    }
}

print("枚举的可变方法可以把 self 设置为相同的枚举类型中不同的成员:")
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()

/************************************ 类型方法 *************************************/

/*

    实例方法是被类型的某个实例调用的方法。你也可以定义类型本身调用的方法,这种方法就叫做类型方法。
    声明 结构体和枚举的类型方法,在方法的 func 关键字之前加上关键字 static 。
    类可能会用关键字 class 来允许子类 重写父类的实现方法。

*/


class SomeClass {
    static func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()


struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func LevelIsUnLocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.LevelIsUnLocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
    
}
/*

    LevelTracker 监测玩家的已解锁的最高等级。这个值被存储在静态属性 highestUnlockedLevel 中。
    LevelTracker 还定义了两个类型方法与 highestUnlockedLevel 配合工作。
    第一个类型方法是 unlockLevel :一旦 新等级被解锁,它会更新 highestUnlockedLevel 的值。
    第二个类型方法是 levelIsUnlocked :如果某个给定的等 级已经被解锁,它将返回 true 。
    (注意:尽管我们没有使用类似 LevelTracker.highestUnlockedLevel 的写 法,这个类型方法还是能够访问静态属性 highestUnlockedLevel )
    除了静态属性和类型方法, LevelTracker 还监测每个玩家的进度。它用实例属性 currentLevel 来监测玩家当前 的等级。

*/

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completeLevel(level: Int){
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String){
        playerName = name
    }
}

var player = Player(name: "jankz")
player.completeLevel(1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}








