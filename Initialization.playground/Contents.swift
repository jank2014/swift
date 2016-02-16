//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*************************************** 构造过程 *****************************************/
print("构造过程是使用类、结构体或枚举类型一个实例的准备过程。在新实例可用前必须执行这个过程,具体操作包括设置实例中每个存储型属性的初始值和执行其他必须的设置或初始化工作。")


/*************************************** 存储属性的初始赋值 *****************************************/
print("当你为存储型属性设置默认值或者在构造器中为其赋值时,它们的值是被直接设置的,不会触发任何属 性观察者( property observers )。")
print("构造器")
//构造器在创建某特定类型的新实例时调用。它的最简形式类似于一个不带任何参数的实例方法,以关键字 init 命 名。

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()

print("The default temperature is \(f.temperature)")

//这个结构体定义了一个不带参数的构造器 init ,并在里面将存储型属性 temperature 的值初始化为 32.0 (华摄 氏度下水的冰点)。

print("默认属性值")

/*

    struct Fahrenheit {
        var temperature = 32.0
    }

*/

/*************************************** 自定义构造过程 *****************************************/
//你可以通过输入参数和可选属性类型来自定义构造过程,也可以在构造过程中修改常量属性
struct Celsius {
    var tempeeratureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        tempeeratureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        tempeeratureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.tempeeratureInCelsius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.tempeeratureInCelsius

//参数的内部名称和外部名称
print("跟函数和方法参数相同,构造参数也存在一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。")

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double){
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)


//注意,如果不通过外部参数名字传值,你是没法调用这个构造器的。只要构造器定义了某个外部参数名,你就必须使用它,忽略它将导致编译错误:

print("不带外部名的构造器参数")


//如果你不希望为构造器的某个参数提供外部名字,你可以使用下划线(_)来显示描述它的外部名,以此重写上面所 说的默认行为。


print("可选属性类型")
/*

    如果你定制的类型包含一个逻辑上允许取值为空的存储型属性--不管是因为它无法在初始化时赋值,还是因为它 可以在之后某个时间点可以赋值为空--
    你都需要将它定义为可选类型 optional type 。可选类型的属性将自动初 始化为空 nil ,表示这个属性是故意在初始化时设置为空的。

*/
struct SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

//调查问题在问题提出之后,我们才能得到回答。所以我们将属性回答 response 声明为 String? 类型,或者说是可 选字符串类型 optional String 。
//当 SurveyQuestion 实例化时,它将自动赋值为空 nil ,表明暂时还不存在此字 符串。


//你可以在构造过程中的任意时间点修改常量属性的值,只要在构造过程结束时是一个确定的值。一旦常量属性被赋值,它将永远不可更改。
struct SurveyQuestionTwo {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beefQuestion = SurveyQuestionTwo(text: "Do you like beef?")
beefQuestion.ask()


/*************************************** 默认构造器 *****************************************/
//如果结构体和类的所有属性都有默认值,同时没有自定义的构造器,那么 Swift 会给这些结构体和类创建一个默 认构造器。
//这个默认构造器将简单的创建一个所有属性值都设置为默认值的实例。

struct SizeOne {
    var width = 0.0, height = 0.0
}
let twoByTwo = SizeOne(width: 2.0, height: 2.0)
/*************************************** 值类型的构造器代理 *****************************************/
//构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理,它能减少多个构造器间的代码重复。
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}



/*************************************** 类的继承和构造过程 *****************************************/
//类里面的所有存储型属性--包括所有继承自父类的属性--都必须在构造过程中设置初始值
 
print("指定构造器和便利构造器")
//指定构造器和便利构造器的语法类的指定构造器的写法跟值类型简单构造器一样:
/*
    init(parameters) {//指定构造器
        statements
    }
*/

//便利构造器也采用相同样式的写法,但需要在 init 关键字之前放置 convenience 关键字,并使用空格将它们俩分 开:
/*
    convenience init(parameters) {//便利构造器
        statements
    }
*/

print("类的构造器代理规则")
print(" 指定构造器必须总是向上代理 • 便利构造器必须总是横向代理")

/*

    规则 1 指定构造器必须调用其直接父类的的指定构造器。
    规则 2 便利构造器必须调用同一类中定义的其它构造器。
    规则 3 便利构造器必须最终以调用一个指定构造器结束。

*/

print("构造器的继承和重写")
//无论是重写属性,方法或者是下标脚本,只要含有 override 修饰符就会去检查父类是否有相匹配的重写指定构造 器和验证重写构造器参数。
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
vehicle.description


class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description


print("自动构造器的继承")
/*

    如上所述,子类不会默认继承父类的构造器。但是如果特定条件可以满足,父类构造器是可以被自动继承的。
    在实践中,这意味着对于许多常见场景你不必重写父类的构造器,并且在尽可能安全的情况下以最小的代价来继承父类的构造器。

*/

print("假设要为子类中引入的任意新属性提供默认值,请遵守以下2个规则:")
/*

    规则 1 如果子类没有定义任何指定构造器,它将自动继承所有父类的指定构造器。
    规则 2 如果子类提供了所有父类指定构造器的实现--不管是通过规则1继承过来的,还是通过自定义实现的--它将自动继 承所有父类的便利构造器。

*/

print("指定构造器和便利构造器实例")
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)


class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ?" : " ?"
        return output
    }
}

print("ShoppingListItem 没有定义构造器来为 purchased 提供初始化值,这是因为任何添加到购物单的项的初始状态总是未购买。")
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}




/*************************************** 可失败的构造器 *****************************************/
/*
 
     如果一个类、结构体或枚举类型的对象,在构造自身的过程中有可能失败,则为其定义一个可失败构造器,是非 常有用的。
     这里所指的“失败”是指,如给构造器传入无效的参数值,或缺少某种所需的外部资源,又或是不满足某种必要的条件等。

 
 */

print("为了妥善处理这种构造过程中可能会失败的情况。你可以在一个类,结构体或是枚举类型的定义中,添加一个或 多个可失败构造器。其语法为在 init 关键字后面加添问号 (init?)")

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
 
/*************************************** 必要构造器 *****************************************/

//在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器:
class SomeClass {
    required init() {
        // 在这里添加该必要构造器的实现代码 
    }
}
//在子类重写父类的必要构造器时,必须在子类的构造器前也添加 required 修饰符,这是为了保证继承链上子类的 构造器也是必要构造器。
//在重写父类的必要构造器时,不需要添加 override 修饰符:

class SomeSubclass: SomeClass {
    required init() {
        // 在这里添加子类必要构造器的实现代码 
    }
}
/*************************************** 通过闭包和函数来设置属性的默认值 *********************************/