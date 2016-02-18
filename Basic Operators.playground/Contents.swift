//: Playground - noun: a place where people can play
//made by jankz jankz@jankz.com
import UIKit

var str = "Hello, playground"

/**************** 基本运算符 *************/

// 1. 术语
/*

一元运算符： ++ -- ！-

二元运算符： > < = !=

三元运算符：? :

*/

/************ 赋值运算符 ***************/
let b = 10
var a = 5
a = b

//元组赋值
let (x,y) = (1,2)
x
y

/************ 算术运算符 ***************/
//加法 +
1+2
"Hellow World!" + " Jankz"
//减法 —
5-4
//乘法 *
2*7
//除法 /
13/4
10/2.5
//求余数 (a % b) 计算 b的多少倍刚刚好可以容下a 返回多出来的那部分 a = (b × 倍数) + 余数
13%5
//浮点数求余数 这里不同于OC
8%2.5

//自增和自减运算
var testZi = 0
testZi++
++testZi
//    • 当 ++ 前置的时候,先自増再返回。 • 当 ++ 后置的时候,先返回再自增。


/************ 组合赋值运算符 ***************/
//如同 C 语言,Swift 也提供把其他运算符和赋值运算( = )组合的组合赋值运算符,组合加运算( += )是其中 一个例子:
var a1 = 2
a1 += 2
/************ 比较运算符 ***************/

/*

• 等于( a == b )
• 不等于( a != b )
• 大于( a > b )
• 小于( a < b )
• 大于等于( a >= b )
• 小于等于( a <= b )


*/

/************ 三目运算符 ***************/
//它的原型是 问题 ? 答案1 : 答案2 。它简洁地表达根据
//问题 成立与否作出二选一的操作。如果 问题 成立,返回 答案1 的结果; 如果不成立,返回 答案2 的结果。
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
/************ 空🈴运算符 ***************/
/*
空合运算符( a??b  )将对可选类型 进行空判断,如果 包含一个值就进行解封,否则就返回一个默认值 .这个运算符有两个条件:
• 表达式 必须是Optional类型
• 默认值 的类型必须要和 存储值的类型保持一致
*/

//a != nil ? a! : b
/*
上述代码使用了三目运算符。当可选类型 a 的值不为空时,进行强制解封( a! )访问 a 中值,反之当 a 中值为空 时,返回默认值b。
无疑空合运算符( ?? )提供了一种更为优雅的方式去封装条件判断和解封两种行为,显得简洁 以及更具可读性。

*/

/************ 区间运算符 ***************/
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
//半开区间运算符

let names = ["Anna","Alex","Brain","Jack"]
let count = names.count
for i in 0..<count {
    print("第\(i+1)个人叫\(names[i])")
}
/************ 逻辑运算符 ***************/
/*
• 逻辑非(!a) 逻辑非运算( !a )对一个布尔值取反,使得 true 变 false , false 变 true 。
它是一个前置运算符,需紧跟在操作数之前,且不加空格。读作 非 a ,例子如下:
• 逻辑与( a && b ) 逻辑与( a && b )表达了只有 a 和 b 的值都为 true 时,整个表达式的值才会是 true 。
只要任意一个值为 false ,整个表达式的值就为 false 。
事实上,如果第一个值为 false ,那么是不去计算第二 个值的,因为它已经不可能影响整个表达式的结果了。
这被称做“短路计算(short-circuit evaluation)”。

• 逻辑或( a || b ) 逻辑或( a || b )是一个由两个连续的 | 组成的中置运算符。它表示了两个逻辑表达式的其中一个为 true ,整 个表达式就为 true 。
*/
let allowedEntary = false
if !allowedEntary {
    print("ACCESS DEFINE")
}

let enteredDoorGode = true
let passedRetinaScan = false
if enteredDoorGode && passedRetinaScan {
    print("Welocme!")
}else{
    print("ACCCESS DEFINE!")
}

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome")
}else{
    print("ACCESS DEFINE!")
}
//逻辑运算符组合计算

if (enteredDoorGode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome")
}else{
    print("ACCESS DEFINE!")
}





