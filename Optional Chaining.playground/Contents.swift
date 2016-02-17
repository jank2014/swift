//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/******************************************** 可空链式调用 **************************************************/

/*

    可空链式调用(Optional Chaining)是一种可以请求和调用属性、方法及下标的过程,它的可空性体现于请求或 调用的目标当前可能为空(nil)。
    如果可空的目标有值,那么调用就会成功;如果选择的目标为空(nil),那 么这种调用将返回空(nil)。
    多个连续的调用可以被链接在一起形成一个调用链,如果其中任何一个节点为 空(nil)将导致整个链调用失败。

*/


//过在想调用非空的属性、方法、或下标的可空值(optional value)后面放一个问号,可以定义一个可空 链。这一点很像在可空值后面放一个叹号(!)来强制展开其中值。
//它们的主要的区别在于：
print("当可空值为空时可空 链式只是调用失败,然而强制展开将会触发运行时错误。")

//别地,可空链式调用的返回结果与原本的返回结果具有相同的类型,但是被包装成了一个可空类型值。当可空 链式调用成功时,一个本应该返回 Int 的类型的结果将会返回 Int? 类型。
/******************************************** 使用可空链式调用来来强制展开 *******************************************/

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

print("Residence 有一个 Int 类型的属性 numberOfRooms ,其默认值为1。 Person 具有一个可空的 residence 属性,其 类型为 Residence? 。")

let john = Person()
//如果使用叹号(!)强制展开获得这个 john 的 residence 属性中的 numberOfRooms 值,会触发运行时错误,因为 这时没有可以展开的 residence :
//let roomCount = john.residence!.numberOfRooms //这里会报错
print("john.residence 非空的时候,上面的调用成功,并且把 roomCount 设置为 Int 类型的房间数量。正如上面说到 的,当 residence 为空的时候上面这段代码会触发运行时错误。")

//通过赋给 john.residence 一个 Residence 的实例变量:
john.residence = Residence()



//这样 john.residence 不为 nil 了。现在就可以正常访问 john.residence.numberOfRooms ,其值为默认的1,类型 为Int?:
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms")
} else {
    print("Unable to retrieve the number of rooms")
}



/******************************************** 为可空链式调用定义模型类 *******************************************/
print("通过使用可空链式调用可以调用多层属性,方法,和下标。这样可以通过各种模型向下访问各种子属性。并且判断能否访问子属性的属性,方法或下标")

class NewPerson {
    var residence: NewResidence?
}

class NewResidence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms id \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}

/******************************************** 通过可空链式调用访问属性 **************************************************/

print("通过可空链式调用访问属性")
let johnT = NewPerson()

if let roomCount = johnT.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms")
}
//为 john.residence 为 nil ,所以毫无疑问这个可空链式调用失败。


print("通过可空链式调用来设定属性值:")
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Jankz 18 Road"
johnT.residence?.address = someAddress
print("在这个例子中,通过 john.residence 来设定 address 属性也是不行的,因为 john.residence 为 nil 。")


/******************************************** 通过可空链式调用来调用方法 **************************************************/
print("通过可空链式调用来调用方法")

/*
    如果在可空值上通过可空链式调用来调用这个方法,这个方法的返回类型为 Void? ,而不是 Void ,因为通过可空 链式调用得到的返回值都是可空的。
    这样我们就可以使用 if 语句来判断能否成功调用 printNumberOfRooms() 方 法,即使方法本身没有定义返回值。通过返回值是否为 nil 可以判断调用是否成功:

*/
if johnT.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
/*

    同样的,可以判断通过可空链式调用来给属性赋值是否成功。在上面的例子中,我们尝试给 john.residence 中的 address 属性赋值,即使 residence 为 nil 。
    通过可空链式调用给属性赋值会返回 Void? ,通过判断返回值是否为 nil 可以知道赋值是否成功:
*/
if (johnT.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}




/******************************************** 通过可空链式调用来访问下标 **************************************************/
print("通过可空链式调用来访问下标")
if let firstRoomName = johnT.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

print("在这个例子中,问号直接放在 john.residence 的后面,并且在方括号的前面,因为 john.residence 是可空值。")
//johnt.residence?[0] = Room(name: "Bathroom")  //这次赋值同样会失败,因为 residence 目前是 nil 

//如果你创建一个 Residence 实例,添加一些 Room 实例并赋值给 john.residence ,那就可以通过可选链和下标来 访问数组中的元素:
let johnsHouse = NewResidence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
johnT.residence = johnsHouse
if let firstRoomName = johnT.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

print("如果下标返回可空类型值,比如Swift中 Dictionary 的 key 下标。可以在下标的闭合括号后面放一个问号来链接 下标的可空返回值:")
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72
/*

    上面的例子中定义了一个 testScores 数组,包含了两个键值对, 把 String 类型的 key 映射到一个整形数组。
    这 个例子用可空链式调用把“Dave”数组中第一个元素设为91,把”Bev”数组的第一个元素+1,然后尝试把”Bria n”数组中的第一个元素设为72。
    前两个调用是成功的,因为这两个 key 存在。但是key“Brian”在字典中不存 在,所以第三个调用失败。


*/



/******************************************** 多层链接              ***************************************************/
print("可以通过多个链接多个可空链式调用来向下访问属性,方法以及下标。但是多层可空链式调用不会添加返回值的可空性。")
/*

    也就是说:
    • 如果你访问的值不是可空的,通过可空链式调用将会放回可空值。
    • 如果你访问的值已经是可空的,通过可空链式调用不会变得“更”可空。
    因此:
    • 通过可空链式调用访问一个 Int 值,将会返回 Int? ,不过进行了多少次可空链式调用。
    • 类似的,通过可空链式调用访问 Int? 值,并不会变得更加可空。

*/
if let johnsStreet = johnT.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

print("如果把 john.residence.address 指向一个实例,并且为 address 中的 street 属性赋值,我们就能过通过可空链式 调用来访问 street 属性。")
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
johnT.residence?.address = johnsAddress
if let johnsStreet = johnT.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}






/******************************************** 对返回可空值函数进行链接 **************************************************/
print("对返回可空值的函数进行链接")
//通过可空链式调用来调用 Address 的 buildingIdentifier() 方法。这个方法返回 String? 类 型。正如上面所说,通过可空链式调用的方法的最终返回值还是 String? :
if let buildingIdentifier = johnT.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
if let beginsWithThe =
    johnT.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
        if beginsWithThe {
            print("John's building identifier begins with \"The\".")
        } else {
            print("John's building identifier does not begin with \"The\".")
        }
}

//注意: 在上面的例子中在,在方法的圆括号后面加上问号是因为 buildingIdentifier() 的返回值是可空值,而 不是方法本身是可空的。






