//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*************************************** 继承 *********************************************/

/*
    一个类可以继承(inherit)另一个类的方法(methods),属性(properties)和其它特性。
    当一个类继承其它 类时,继承类叫子类(subclass),被继承类叫超类(或父类,superclass)。
    在 Swift 中,继承是区 分「类」与其它类型的一个基本特征
*/

/*
    
    可以为类中继承来的属性添加属性观察器(property observers),这样一来,当属性值改变时,类就会被通知 到。
    可以为任何属性添加属性观察器,无论它原本被定义为存储型属性(stored property)还是计算型属性(co mputed property)。


*/
/*************************************** 定义一个基类 *********************************************/
//不继承于其它类的类,称之为基类(base calss)。
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour."
    }
    func makeNoise() {
        //
    }
}

let someVehicle = Vehicle()
print("Vehihcle: \(someVehicle.description)")

/*************************************** 子类生成 *********************************************/
print("子类生成(Subclassing)指的是在一个已有类的基础上创建一个新的类。子类继承超类的特性,并且可以优化或 改变它。你还可以为子类添加新的特性。")


class Bicyle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicyle()
bicycle.currentSpeed = 88.0
bicycle.hasBasket = true
print(bicycle.description)

class Tandem: Bicyle {
    var currentNumberOfPassengers = 0

}

let tandem = Tandem()
tandem.currentNumberOfPassengers
print(tandem.description)   //这里说明是值类型


/*************************************** 重写 *********************************************/
/*

    子类可以为继承来的实例方法(instance method),类方法(class method),实例属性(instance property),
    或下标脚本(subscript)提供自己定制的实现(implementation)。我们把这种行为叫重写(overriding)。


    如果要重写某个特性,你需要在重写定义的前面加上 override 关键字。这么做,你就表明了你是想提供一个重写 版本,而非错误地提供了一个相同的定义。
    意外的重写行为可能会导致不可预知的错误,任何缺少override关键 字的重写都会在编译时被诊断为错误。
*/

print("在合适的地方,你可以通过使用 super 前缀来访问超类版本的方法,属性或下标脚本:")
/*

    • 在方法 someMethod 的重写实现中,可以通过 super.someMethod() 来调用超类版本的 someMethod 方法。
    • 在属性 someProperty 的 getter 或 setter 的重写实现中,可以通过 super.someProperty 来访问超类版本的 someProperty 属性。
    • 在下标脚本的重写实现中,可以通过 super[someIndex] 来访问超类版本中的相同下标脚本。

*/

print("重写方法")
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo...")
    }
    
}

let train = Train()
train.makeNoise()


print("重写属性")
/*

    你可以将一个继承来的只读属性重写为一个读写属性,只需要你在重写版本的属性里提供 getter 和 setter 即 可。但是,你不可以将一个继承来的读写属性重写为一个只读属性。

*/

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 34.0
car.gear = 3

print("Car : \(car.description)")


print("重写属性观察器(Property Observer)")

//你可以在属性重写中为一个继承来的属性添加属性观察器。这样一来,当继承来的属性值发生改变时,你就会被 通知到,无论那个属性原本是如何实现的。
/*

    注意: 你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置 的,
    所以,为它们提供 willSet 或 didSet 实现是不恰当。此外还要注意,你不可以同时提供重写的 setter 和 重写的属性观察器。
    如果你想观察属性值的变化,并且你已经为那个属性提供了定制的 setter,那么你在 sett er 中就可以观察到任何值变化了

*/

class AutoCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutoCar()
automatic.currentSpeed = 55.6
print("The gear is \(automatic.description)")



/*************************************** 防止重写 *********************************************/

/*

    你可以通过把方法,属性或下标脚本标记为 final 来防止它们被重写,只需要在声明关键字前加上 final 特性即可。
    (例如: final var , final func , final class func , 以及 final subscript )

    如果你重写了 final 方法,属性或下标脚本,在编译时会报错。在类扩展中的方法,属性或下标脚本也可以在扩展的定义里标记为 final。

    你可以通过在关键字 class 前添加 final 特性( final class )来将整个类标记为 final 的,这样的类是不可被 继承的,任何子类试图继承此类时,在编译时会报错。

*/



