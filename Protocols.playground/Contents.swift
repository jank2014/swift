//: Playground - noun: a place where people can play

import UIKit
/****************************************** 协议(Protocols) ******************************************/
//定义了一个蓝图,规定了用来实现某一特定工作或者功能所必需的方法和属性。类,结构体或枚举类型都可以遵循协议,并提供具体实现来完成协议定义的方法和功能。
//任意能够满足协议要求的类型被称为这个协议。
//除了遵循协议的类型必须实现那些指定的规定以外,还可以对协议进行扩展,实现一些特殊的规定或者一些附加的功能,使得遵循的类型能够收益。



/****************************************** 协议的语法 ******************************************/

//协议的定义方式与类,结构体,枚举的定义非常相似。
protocol MySomeProtocol {
    //协议内容
}

protocol MyAnotherProtocol {
    //协议内容
}
print("要使类遵循某个协议,需要在类型名称后加上协议名称,中间以冒号 : 分隔,作为类型定义的一部分。遵循多个 协议时,各协议之间用逗号 , 分隔。")
/*

    struct MySomeStruct: MySomeProtocol, MySomeProtocol {
        //结构体内容
    }

    class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol { 
        // 类的内容
    }
*/



/****************************************** 对属性的规定 ******************************************/
//协议可以规定其 遵循者 提供特定名称和类型的 实例属性(instance property) 或 类属性(type property) ,
//而不用 指定是 存储型属性(stored property) 还是 计算型属性(calculate property) 。此外还必须指明是只读的还是可读 可写的。
//如果协议规定属性是可读可写的,那么这个属性不能是常量或只读的计算属性。如果协议只要求属性是只读的(ge ttable),那个属性不仅可以是只读的,如果你代码需要的话,也可以是可写的
//协议中的通常用var来声明变量属性,在类型声明后加上 { set get } 来表示属性是可读可写的,只读属性则用 { get } 来表示。



protocol SomeProrocolT {
    var mustBeSerrable : Int {get set}
    var doesNotNeedBeSettable : Int { get }
}
//在协议中定义类属性(type property)时,总是使用 static 关键字作为前缀。当协议的遵循者是类时,可以使用 class 或 static 关键字来声明类属性

protocol AnotherProtocolT {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}
struct PersonT: FullyNamed {
    var fullName: String
}
let john = PersonT(fullName: "john Appleseed")

class Starship: FullyNamed {
    var prefix :String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName

/****************************************** 对方法的规定 ******************************************/
/*

    协议可以要求其遵循者实现某些指定的实例方法或类方法。这些方法作为协议的一部分,像普通的方法一样放在协议的定义中,但是不需要大括号和方法体。
    可以在协议中定义具有可变参数的方法,和普通方法的定义方式相同。但是在协议的方法定义中,不支持参数默认值。


*/

protocol SomeProtocolY {
    static func someTypeMethod()
}
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// 输出 : "Here's a random number: 0.37464991998171" 
print("And another one: \(generator.random())")
// 输出 : "And another one: 0.729023776863283"

/****************************************** 对Mutaing 方法的规******************************************/
//有时需要在方法中改变它的实例。例如,值类型(结构体,枚举)的实例方法中,将   关键字作为函数的前 缀,写在   之前,表示可以在该方法中修改它所属的实例及其实例属性的值

print("用类实现协议中的 mutating 方法时,不用写 mutating 关键字;用结构体,枚举实现协议中的 mutating 方法 时,必须写 mutating 关键字。")

protocol Tooglable {
    mutating func toggle()
}

enum OnOffSwitch: Tooglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
/****************************************** 对构造器的规定 ******************************************/
//协议可以要求它的遵循者实现指定的构造器。你可以像书写普通的构造器那样,在协议的定义里写下构造器的声明,但不需要写花括号和构造器的实体:
protocol SomeProtocolM {
//    init(SomeParameter: Int)
}
print("协议构造器规定在类中的实现")
//你可以在遵循该协议的类中实现构造器,并指定其为类的指定构造器(designated initializer)或者便利构造 器(convenience initializer)。
//在这两种情况下,你都必须给构造器实现标上"required"修饰符:
class SomeClassM: SomeProtocolM {
    required init(someParameter: Int) {
        //构造器实现
    }
}


print("如果一个子类重写了父类的指定构造器,并且该构造器遵循了某个协议的规定,那么该构造器的实现需要被同时 标示 required 和 override 修饰符:")

/*
protocol SomeProtocol {
    init()
}
class SomeSuperClass {
    init() {
        // 构造器的实现 }
    }
    class SomeSubClass: SomeSuperClass, SomeProtocol {
        // 因为遵循协议,需要加上"required"; 因为继承自父类,需要加上"override" 
        required override init(){
        // 构造器实现
    }
}
*/
print("可失败构造器的规定")
/*

    可以通过给协议 Protocols 中添加可失败构造器 (页 0)来使遵循该协议的类型必须实现该可失败构造器。如果在协议中定义一个可失败构造器,
    则在遵顼该协议的类型中必须添加同名同参数的可失败构造器或非可失败 构造器。
    如果在协议中定义一个非可失败构造器,则在遵循该协议的类型中必须添加同名同参数的非可失败构造 器或隐式解析类型的可失败构造器( init! )。
*/


/****************************************** 协议类型 ******************************************/
print("尽管协议本身并不实现任何功能,但是协议可以被当做类型来使用。")

/*

    协议可以像其他普通类型一样使用,使用场景:
    • 作为函数、方法或构造器中的参数类型或返回值类型 
    • 作为常量、变量或属性的类型
    • 作为数组、字典或其他容器中的元素类型

*/
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}




/****************************************** 委托（代理）模式******************************************/
/*

    委托是一种设计模式,它允许 类 或 结构体 将一些需要它们负责的功能 交由(或委托) 给其他的类型的实例。
    委托 模式的实现很简单: 定义协议来封装那些需要被委托的函数和方法,使其 遵循者 拥有这些被委托的 函数和方法 。
    委托模式可以用来响应特定的动作或接收外部数据源提供的数据,而无需要知道外部数据源的类型信息。

*/
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game: DiceGame)
}
print("DiceGame 协议可以在任意含有骰子的游戏中实现。 DiceGameDelegate 协议可以用来追踪 DiceGame 的游戏过程")
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self,didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()


/****************************************** 在拓展中添加协议成员 ******************************************/
//在扩展中添加协议成员
//便无法修改源代码,依然可以通过扩展(Extension)来扩充已存在类型(译者注: 类,结构体,枚举等)。扩展可以为已存在的类型添加属性,方法,下标脚本,协议等成员
protocol TextRepresentable {
    var textualDescription: String { get }
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12,generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)





/****************************************** 通过拓展补充协议声明 ******************************************/
//当一个类型已经实现了协议中的所有要求,却没有声明为遵循该协议时,可以通过扩展(空的扩展体)来补充协议 声明:
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    } }
extension Hamster: TextRepresentable {}
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)



/****************************************** 协议类型集合 ******************************************/
//协议类型可以在数组或者字典这样的集合中使用,在协议类型 (页 0)提到了这样的用法。下面的例子创建了一个 类型为 TextRepresentable 的数组:
let things: [TextRepresentable] = [game,d12,simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}


/****************************************** 协议的继承 ******************************************/

//协议能够继承一个或多个其他协议,可以在继承的协议基础上增加新的内容要求。协议的继承语法与类的继承相似,多个被继承的协议间用逗号分隔:

protocol InheritingProtocol: SomeProtocolY, AnotherProtocolT { // 协议定义

}
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}
extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0: output += "▲ "
            case let snake where snake < 0: output += "▼ "
            default:
                output += "○ "
            } }
        return output
    }
}




/****************************************** 类专属协议 ******************************************/
//你可以在协议的继承列表中,通过添加 class 关键字,限制协议只能适配到类(class)类型。
//(结构体或枚举不能 遵循该协议)。该 class 关键字必须是第一个出现在协议的继承列表中,其后,才是其他继承协议。

//protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol { // 协议定义
//
//}
print("当协议想要定义的行为,要求(或假设)它的遵循类型必须是引用语义而非值语义时,应该采用类专属协议。")

















/****************************************** 协议合成 ******************************************/

//有时候需要同时遵循多个协议。你可以将多个协议采用 protocol<SomeProtocol, AnotherProtocol> 这样的格式进行组合,称为 协议合成(protocol composition) 。
//你可以在 <> 中罗列任意多个你想要遵循的协议,以逗号分隔。
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)









/****************************************** 协议检验的一致性 ******************************************/
//你可以使用 is 和 as 操作符来检查是否遵循某一协议或强制转化为某一类型。检查和转化的语法和之前相同

/*

    • is操作符用来检查实例是否遵循了某个协议。
    • as?返回一个可选值,当实例遵循协议时,返回该协议类型;否则返回nil。 
    • as用以强制向下转型,如果强转失败,会引起运行时错误。


*/

protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}






/****************************************** 协可选协议的规定 ******************************************/

/*


协议可以含有可选成员,其   可以选择是否实现这些成员。在协议中使用   oprional 关键字作为前缀来定义 可选成员。当需要使用可选规定的方法或者属性时,他的类型自动会变成可选的。
比如,一个定义为的方法变成 。需要注意的是整个函数定义包裹在可选中,而不是放在函数的返回值后 面。

*/
print("选协议只能在含有 @objc 前缀的协议中生效。 这个前缀表示协议将暴露给Objective-C代码")
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
class ThreeSource: CounterDataSource {
    @objc let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}


class TowardsZeroSource: CounterDataSource {
    @objc func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

/****************************************** 协议拓展 ******************************************/
/*

使用扩展协议的方式可以为遵循者提供方法或属性的实现。通过这种方式,可以让你无需在每个遵循者中都实现
一次,无需使用全局函数,你可以通过扩展协议的方式进行定义。

*/

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}


extension CollectionType where Generator.Element : TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamsters.textualDescription)