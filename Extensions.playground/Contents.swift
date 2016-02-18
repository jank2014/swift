//: Playground - noun: a place where people can play

import UIKit

/************************************ 扩展(Extensions) *************************************/
//扩展就是向一个已有的类、结构体、枚举类型或者协议类型添加新功能(functionality)。这包括在没有权限获 取原始源代码的情况下扩展类型的能力(即逆向建模)。
//扩展和Objective-C 中的分类(categories)类 似。(不过与 Objective-C 不同的是,Swift 的扩展没有名字。)

print("Swift 中的扩展可以:")
/*

    • 添加计算型属性和计算型静态属性 
    • 定义实例方法和类型方法
    • 提供新的构造器
    • 定义下标
    • 定义和使用新的嵌套类型
    • 使一个已有类型符合某个协议

*/
//在 Swift 中,你甚至可以对一个协议(Protocol)进行扩展,提供协议需要的实现,或者添加额外的功能能够对合 适的类型带来额外的好处。
print("扩展可以对一个类型添加新的功能,但是不能重写已有的功能。")

/************************************ 扩展语法 *************************************/
print("声明一个扩展使用关键字 extension :")
/*
    extension SomeType {
        // 加到SomeType的新功能写到这里
    }
*/


print("一个扩展可以扩展一个已有类型,使其能够适配一个或多个协议(protocol)。当这种情况发生时,协议的名字 应该完全按照类或结构体的名字的方式进行书写:")

/*
    extension SomeType: SomeProtocol, AnotherProctocol {
        // 协议实现写到这里
    }
*/


/********************************************* 计算属性 **********************************************/
/*
    扩展可以向已有类型添加计算型实例属性和计算型类型属性。下面的例子向 Swift 的内建 Double 类型添加了5个 计算型实例属性,从而提供与距离单位协作的基本支持:
*/
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }

    var ft: Double { return self / 3.28084 }

}
let OneInch = 25.4.mm
print("OneInch is \(OneInch) meters")
let threeFeet = 3.ft
print("three feet is \(threeFeet) meters")
/*
    这些计算属性表达的含义是把一个   型的值看作是某单位下的长度值。即使它们被实现为计算型属性,
    但这 些属性仍可以接一个带有dot语法的浮点型字面值,而这恰恰是使用这些浮点型字面量实现距离转换的方式。

*/

print("扩展可以添加新的计算属性,但是不可以添加存储属性,也不可以向已有属性添加属性观测器(property observers)。")
let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

/********************************************* 构造器 **********************************************/

/*

    扩展可以向已有类型添加新的构造器。这可以让你扩展其它类型,将你自己的定制类型作为构造器参数,或者提供该类型的原始实现中没有包含的额外初始化选项。
    扩展能向类中添加新的便利构造器,但是它们不能向类中添加新的指定构造器或析构器。指定构造器和析构器必须总是由原始的类实现来提供。

    如果你使用扩展向一个值类型添加一个构造器,在该值类型已经向所有的存储属性提供默认值,而且没有定义任 何定制构造器(custom initializers)时,
    你可以在值类型的扩展构造器中调用默认构造器(default initiali zers)和逐一成员构造器(memberwise initializers)。

*/
print("定义了一个用于描述几何矩形的定制结构体 Rect 。这个例子同时定义了两个辅助结构体 Size 和 t ,它们都把 0.0 作为所有属性的默认值")
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

//因为结构体 Rect 提供了其所有属性的默认值,所以正如默认构造器 (页 0)中描述的,它可以自动接受一个默认构造器和一个逐一成员构造器。这些构造器可以用于构造新的 Rect 实例:
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
print("你可以提供一个额外的使用特殊中心点和大小的构造器来扩展 Rect 结构体:")
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY),size: size)

    }
}
//这个新的构造器首先根据提供的 center 和 size 值计算一个合适的原点。
//然后调用该结构体自动的逐一成员构造 器 init(origin:size:) ,该构造器将新的原点和大小存到了合适的属性中:
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print("注意！ 如果你使用扩展提供了一个新的构造器,你依旧有责任保证构造过程能够让所有实例完全初始化。")

/********************************************* 方法 **********************************************/
//扩展可以向已有类型添加新的实例方法和类型方法。下面的例子向 Int 类型添加一个名为 repetitions 的新实例 方法:
/*
    extension Int {
        func repetitions(task: () -> ()) {
        for i in 0..<self {
            task()
            }
        }
    }
//这个 repetitions 方法使用了一个 () -> () 类型的单参数(single argument),表明函数没有参数而且没有返 回值。

*/
extension Int {
    func repetitions(task: () -> ()) {
        for i in 0..<self {
            print(i)
            task()
        }
    }
}
3.repetitions({
    print("Hello!")
})
3.repetitions{
    print("Goodbye!")
}

print("可变实例方法(Mutating Instance Methods)")
/*
    通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self 或其属性的方法必须将该实例方 法标注为 mutating ,正如来自原始实现的修改方法一样。

*/
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()




/********************************************* 下标 **********************************************/
print("扩展可以向一个已有类型添加新下标。这个例子向Swift内建类型 Int 添加了一个整型下标。该下标 [n] 返回十 进制数字从右向左数的第n个数字")
extension Int {
    subscript(var digitIndex: Int) ->Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]
746381295[9]


/********************************************* 嵌套类型 **********************************************/
print("扩展可以向已有的类、结构体和枚举添加新的嵌套类型:")
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
            
        }
    }
}

print("该例子向 Int 添加了新的嵌套枚举。这个名为 Kind 的枚举表示特定整数的类型。具体来说,就是表示整数是正 数,零或者负数。")
func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
        case .Zero:
            print("0 ", terminator: "")
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])

//函数 printIntegerKinds 的输入是一个 Int 数组值并对其字符进行迭代。在每次迭代过程中,考虑当前字符的 kin d 计算属性,并打印出合适的类别描述。
//注意: 由于已知 number.kind 是 Int.Kind 型,所以 Int.Kind 中的所有成员值都可以使用 switch 语句里的形 式简写,比如使用 . Negative 代替 Int.Kind.Negative 。









