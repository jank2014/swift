//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Automatic Reference Counting 自动引用计数")

/************************************************ 自动引用计数 ************************************************/
//Swift 使用自动引用计数(ARC)机制来跟踪和管理你的应用程序的内存。通常情况下,Swift 内存管理机制会一直起作用,你无须自己来考虑内存的管理。
//ARC 会在类的实例不再被使用时,自动释放其占用的内存。


/************************************************ 自动引用计数的工作机制 ************************************************/
//当你每次创建一个类的新的实例的时候,ARC 会分配一大块内存用来储存实例的信息。内存中会包含实例的类型 信息,以及这个实例所有相关属性的值。
//此外,当实例不再被使用时,ARC 释放实例所占用的内存,并让释放的内存能挪作他用。这确保了不再被使用的 实例,不会一直占用内存空间。

/************************************************ 自动引用计数实践 ************************************************/
class PersonOne {
    let name: String
    init(name: String){
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized.")
    }
}

var reference1: PersonOne?
var reference2: PersonOne?
var reference3: PersonOne?

reference1 = PersonOne(name: "Joho Appleased")
/*

    由于 Person 类的新实例被赋值给了 reference1 变量,所以 reference1 到 Person 类的新实例之间建立了一个强 引用。
    正是因为这一个强引用,ARC 会保证 Person 实例被保持在内存中不被销毁。

*/
reference2 = reference1
reference3 = reference1



//如果你通过给其中两个变量赋值 nil 的方式断开两个强引用(包括最先的那个强引用),只留下一个强引用, rson 实例不会被销毁:
reference1 = nil
reference2 = nil


//在你清楚地表明不再使用这个 Person 实例时,即第三个也就是最后一个强引用被断开时,ARC 会销毁它

reference3 = nil
//prints "John Appleseed is being deinitialized"



/************************************************ 类实例之间的循环强引用 ************************************************/
//在上面的例子中,ARC 会跟踪你所新创建的 Person 实例的引用数量,并且会在 Person 实例不再被需要时销毁它。
print("然而,我们可能会写出一个类实例的强引用数永远不能变成0的代码。如果两个类实例互相持有对方的强引用,因 而每个实例都让对方一直存在,就是这种情况。这就是所谓的循环强引用。")
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}
class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
var john: Person?
var unit4A: Apartment?

john = Person(name: "Jankz Monkong")
unit4A = Apartment(unit: "4A")

print("现在你能够将这两个实例关联在一起,这样人就能有 寓住了,而 寓也有了房客。注意感叹号是用来展开和访 问可选变量 john 和 unit4A 中的实例,这样实例的属性才能被赋值:")
john!.apartment = unit4A
unit4A!.tenant = john


/************************************************ 解决实例之间的循环强应用 ************************************************/
print("Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题:弱引用(weak reference)和无 主引用(unowned reference)。")
//弱引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用而不产生循环强引用。
print("弱引用")
/*

    弱引用不会对其引用的实例保持强引用,因而不会阻止 ARC 销毁被引用的实例。这个特性阻止了引用变为循环强 引用。
    声明属性或者变量时,在前面加上 weak 关键字表明这是一个弱引用。


*/

print("在实例的生命周期中,如果某些时候引用没有值,那么弱引用可以避免循环强引用。如果引用总是有值,则可以 使用无主引用")
print("注意: 弱引用必须被声明为变量,表明其值能在运行时被修改。弱引用不能被声明为常量。")


//是有一个重要的区别。这一次, ApartmentTwo 的 tenant 属 性被声明为弱引用:
class PersonTwo {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentTwo?
    deinit { print("\(name) is being deinitialized") }
}
class ApartmentTwo {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: PersonTwo?
    deinit { print("ApartmentTwo \(unit) is being deinitialized") }
}

var johnT: PersonTwo?
var unit4AT: ApartmentTwo?
johnT = PersonTwo(name: "John Appleseed")
unit4AT = ApartmentTwo(unit: "4A")
print("÷÷")
/*
    Person 实例依然保持对 Apartment 实例的强引用,但是 Apartment 实例只是对 Person 实例的弱引用。
    这意味着 当你断开 john 变量所保持的强引用时,再也没有指向 Person 实例的强引用了:
*/

johnT = nil


print("唯一剩下的指向 Apartment 实例的强引用来自于变量 unit4A 。如果你断开这个强引用,再也没有指向 Apartment 实例的强引用了:")


unit4AT = nil

//上面的两段代码展示了变量 john 和 unit4A 在被赋值为 nil 后, Person 实例和 Apartment 实例的析构函数都打 印出“销毁”的信息。这证明了引用循环被打破了。


/*
    注意: 在使用垃圾收集的系统里,弱指针有时用来实现简单的缓冲机制,因为没有强引用的对象只会在内存压 力触发垃圾收集时才被销毁。
    但是在 ARC 中,一旦值的最后一个强引用被删除,就会被立即销毁,这导致弱引 用并不适合上面的用途。

*/
print("你可以在声明属性或者变量时,前面加上关键字 unowned 表示这是一个无主引用。")

/*
    和弱引用类似,无主引用不会牢牢保持住引用的实例。和弱引用不同的是,无主引用是永远有值的。
    因此,无主 引用总是被定义为非可选类型(non-optional type)。你可以在声明属性或者变量时,在前面加上关键字 unowned 表示这是一个无主引用。
*/
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
print("注意: CreditCard 类的 number 属性被定义为 UInt64 类型而不是 Int 类型,以确保 number 属性的存储量在32 位和64位系统上都能足够容纳16位的卡号。")
 var johnTh: Customer?
johnTh = Customer(name: "John Appleseed")
johnTh!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnTh!)

/*

    Customer 实例持有对 CreditCard 实例的强引用,而 CreditCard 实例持有对 Customer 实例的无主引用。
    由于 customer 的无主引用,当你断开 john 变量持有的强引用时,再也没有指向 Customer 实例的强引用了:

*/

johnTh = nil
//最后的代码展示了在 john 变量被设为 nil 后 Customer 实例和 CreditCard 实例的构造函数都打印出了“销 毁”的信息。



class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")


print("闭包引起的循环强引用")






/************************************************ 闭包引起的循环强引用 ************************************************/
class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())


//HTMLElement 类只提供一个构造函数,通过 name 和 text (如果有的话)参数来初始化一个元素。该类也定义了 一个析构函数,当 HTMLElement 实例被销毁时,打印一条消息。
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())






/************************************************ 解决闭包引起的循环强应用 ************************************************/
print("定义捕获列表")
//捕获列表中的每一项都由一对元素组成,一个元素是 或   关键字,另一个元素是类实例的引用(如 s )或初始化过的变量(如 )。这些项在方括号中用逗号分开。
class HTMLElementNew {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
//上面的 HTMLElement 实现和之前的实现一致,除了在 asHTML 闭包中多了一个捕获列表。这里,捕获列表是 [unown ed self] ,表示“用无主引用而不是强引用来捕获 self ”。
var paragraphNew: HTMLElementNew? = HTMLElementNew(name: "p", text: "hello, world")
print(paragraphNew!.asHTML())


paragraphNew = nil
// prints "p is being deinitialized"

