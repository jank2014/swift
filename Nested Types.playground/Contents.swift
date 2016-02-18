//: Playground - noun: a place where people can play

import UIKit

/************************************************ 嵌套类型(Nested Types) *****************************************************************/

/*

    枚举类型常被用于实现特定类或结构体的功能。也能够在有多种变量类型的环境中,方便地定义通用类或结构体
    来使用,为了实现这种功能,Swift允许你定义嵌套类型,可以在枚举类型、类和结构体中定义支持嵌套的类型。
    要在一个类型中嵌套另一个类型,将需要嵌套的类型的定义写在被嵌套类型的区域{}内,而且可以根据需要定义 多级嵌套。

*/




/************************************************ 嵌套类型实例 *****************************************************************/

print("嵌套类型实例")
//一个结构体 BlackjackCard (二十一点),用来模拟 BlackjackCard 中的扑克牌点数。ckCard 结构体包含2个嵌套定义的枚举类型 Suit 和 Rank 。

struct BlackjackCard {
    //嵌套定义枚举类型Suit
    enum Suit: Character {
        case Spades = "a", Hearts = "b", Diamonds = "c", Clubs = "d"
    }
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack ,Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace :
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
            
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
    
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades: \(theAceOfSpades.description)")
/************************************************ 嵌套类型引用 *****************************************************************/
let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue

//对于上面这个例子,这样可以使 Suit , Rank , 和 Values 的名字尽可能的短,因为它们的名字会自然的由定义 它们的上下文来限定。


