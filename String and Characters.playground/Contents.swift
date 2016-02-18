//: Playground - noun: a place where people can play
// made by jankz jankz@jankz.com
import UIKit

var str = "Hello, playground"
/************************ 字符串和字符 *******************/
var emptyString = ""                //空字符串字面量
var anotherEmptyString = String()   //初始化方法
if emptyString.isEmpty {
    print("The string is empty!")
}

var variableString = "Horse"
variableString += " and carriage"
// variableString 现在为 "Horse and carriage"
let constantString = "Highlander"
//constantString += " and another Highlander"
// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。
