//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/******************************************* 属性 ***************************************************/

/*

    属性将值跟特定的类、结构或枚举关联。存储属性存储常量或变量作为实例的一部分,而计算属性计算(不是存储)一个值。
    计算属性可以用于类、结构体和枚举,存储属性只能用于类和结构体。存储属性和计算属性通常与特定类型的实例关联。
    但是,属性也可以直接作用于类型本身,这种属性称为类型属性。
    另外,还可以定义属性观察器来监控属性值的变化,以此来触发一个自定义的操作。
    属性观察器可以添加到自己定义的存储属性上,也可以添加到从父类继承的属性上。

*/

/******************************************* 存储属性 ***************************************************/
print("简单来说,一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量。存储属性可以是变量存储属性(用关键字 var 定义),也可以是常量存储属性(用关键字 let 定义)。")

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数0,1,2
rangeOfThreeItems.firstValue = 6
// 该区间表示整数6,7,8
/*

    FixedLengthRange 的实例包含一个名为 firstValue 的变量存储属性和一个名为 length 的常量存储属性。
    在上面 的例子中, length 在创建实例的时候被初始化,因为它是一个常量存储属性,所以之后无法修改它的值。


*/


//常量结构体的存储属性
print("如果创建了一个结构体的实例并将其赋值给一个常量,则无法修改该实例的任何属性,即使定义了变量存储属性")
let rangOfFourItems = FixedLengthRange(firstValue: 1, length: 5)

//rangOfFourItems.firstValue = 1 //这里会报错
/*

    这种行为是由于结构体(struct)属于值类型。当值类型的实例被声明为常量的时候,它的所有属性也就成了常 量。
    
    属于引用类型的类(class)则不一样。把一个引用类型的实例赋给一个常量后,仍然可以修改该实例的变量属 性。

*/

//延迟存储属性
print("延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储 属性。")

/*

注意:
    必须将延迟存储属性声明成变量(使用 var 关键字),因为属性的初始值可能在实例构造完成之后才会得 到。
    而常量属性在构造过程完成之前必须要有初始值,因此无法声明成延迟属性。

*/

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("SomeCode")
manager.data.append("some more code")


//由于使用了 lazy , importer 属性只有在第一次被访问的时候才被创建。比如访问它的属性 fileName 时:
print(manager.importer.fileName)


/*
    注意：如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问,则无法保证该属性只会被初始化一次。
*/


/******************************************* 计算属性 ***************************************************/
print("除存储属性外，类，结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个getter 和 一个setter 来间接获取和设置其他属性或变量的值")

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
            
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initializeSquare = square.center
initializeSquare.x
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at \(square.origin.x) \(square.origin.y)")


//如果计算属性的 setter 没有定义表示新值的参数名,则可以使用默认名称 newValue 。下面是使用了便捷 sette r 声明的 Rect 结构体代码:

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
  
        }
    }
}

print("只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值,可以通过点运算符访 问,但不能设置新的值。")
/*

注意:
    必须使用 关键字定义计算属性,包括只读计算属性,因为它们的值不是固定的。 关键字只用来声明常 量属性,表示初始化后再也无法修改的值。

*/
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print(fourByFiveByTwo)
print(fourByFiveByTwo.volume)

/******************************************* 属性观察器 ***************************************************/
print("可以为属性添加如下的一个或全部观察器:")
/*

    • willSet在新的值被设置之前调用
        willSet 观察器会将新的属性值作为常量参数传入,在 willSet 的实现代码中可以为这个参数指定一个名称,
        如果不指定则参数仍然可用,这时使用默认名称 newValue 表示。

    • didSet在新的值被设置之后立即调用
        类似地, didSet 观察器会将旧的属性值作为参数传入,可以为该参数命名或者使用默认参数名 oldValue

*/

print("父类的属性在子类的构造器中被赋值时,它在父类中的 willSet 和 didSet 观察器会被调用。")
class StepConuter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps){
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepConuter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300
/*
    例子中的 观察器将表示新值的参数自定义为newTotalSteps 这个观察器只是简单的将新的值输出
    didset 观察器在 的值改变后被调用,它把新的值和旧的值进行对比,如果总的步数增加了,就输出 一个消息表示增加了多少步。
    没有为旧的值提供自定义名称,所以默认值 表示旧值的参数名。

*/



/******************************************* 全局变量和局部变量 ***************************************************/
/*
    计算属性和属性观察器所描述的模式也可以用于全局变量和局部变量。
    全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。
*/

/******************************************* 类型属性 ***************************************************/
/*
    实例的属性属于一个特定类型实例,每次类型实例化后都拥有自己的一套属性值,实例之间的属性相互独立。
    也可以为类型本身定义属性,不管类型有多少个实例,这些属性都只有唯一一份。这种属性就是类型属性。

    类型属性用于定义特定类型所有实例共享的数据,比如所有实例都能用的一个常量(就像 C 语言中的静态常 量),
    或者所有实例都能访问的一个变量(就像 C 语言中的静态变量)。
*/

//使用关键字 static 来定义类型属性。在为类(class)定义计算型类型属性时,可以使用关键字 class 来支持子 类对父类的实现进行重写。
//下面的例子演示了存储型和计算型类

struct SomeStructures {
    static var storedTypeProerty = "Some value."
    static var computedTypeProerty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var overrideableComputedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int{
        return 107
    }
}

print(SomeStructures.storedTypeProerty)
SomeStructures.storedTypeProerty = "Another Value"
print(SomeStructures.storedTypeProerty)

print(SomeEnumeration.overrideableComputedTypeProperty)

print(SomeClass.computedTypeProperty)


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将新电平值设置为阀值
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels { // 存储当前电平值作为新的最大输入电平 AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}






