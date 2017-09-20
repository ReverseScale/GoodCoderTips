//
//  TableViewController.swift
//  GoodCoder
//
//  Created by WhatsXie on 2017/9/20.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension TableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexRow = indexPath.row
        switch indexRow {
        case 0:
            one()
        case 1:
            two()
        case 2:
            three()
        case 3:
            four()
        case 4:
            five()
        case 5:
            six()
        case 6:
            seven()
        case 7:
            eight()
        case 8:
            nine()
        default:
            ten()
        }
    }
}
/// 1.Extension
extension TableViewController {
    // 例：平方一个数字
    func one(){
        // 💩 Code
//        let squaredOFFive = squarefunc(x: 5)
        let squaredOFFive = 5.squared
        SwiftProgressHUD.showSuccess("1.Extension:平方一个数字5 = \(squaredOFFive)")
    }
    func squarefunc(x: Int) -> Int { return x * x }
}
extension Int {
    var squared: Int { return self * self }
}

/// 2.Generics
extension TableViewController {
    // 例：输出数组中的所有元素。
    func two(){
        let stringArray = ["Bob", "Bobby", "SangJoon"]
        let intArray = [1, 3, 4, 5, 6]
        let doubleArray = [1.0, 2.0, 3.0]
        // 💩 Code
//        printIntArray(a: intArray)
//        printStringArray(a: stringArray)
//        printDoubleArray(a: doubleArray)
        
        printElementFromArray(a: intArray)
        printElementFromArray(a: stringArray)
        printElementFromArray(a: doubleArray)
        
        SwiftProgressHUD.showSuccess("请看控制台")
    }
    func printStringArray(a: [String]) { for s in a { print("打印字符串数组:\n\(s)") } }
    func printIntArray(a: [Int]) { for i in a { print("打印整型数组:\n\(i)") } }
    func printDoubleArray(a: [Double]) {for d in a { print("打印浮点型数组:\n\(d)") } }

    func printElementFromArray<T>(a: [T]) {
        for element in a {
            print("Generics打印:\(element)")
        }
    }
}

/// 3.for 循环 vs While 循环
extension TableViewController {
    // 例：打印 “count” 5 次
    func three(){
        // 💩 Code
//        var i = 0
//        while 5 > i {
//            print("重复打印Count")
//            i += 1
//        }
        for _ in 1...5 { print("重复打印Count") }
        SwiftProgressHUD.showSuccess("请看控制台")
    }
}

/// 4.Optional Unwrapping
var myUsername: Double?
var myPassword: Double?
extension TableViewController {
    // 例：gaurd let vs if let (不显示就对了)
    // 💩 Code
//    func four(){
//        if myUsername != nil {
//            if myPassword != nil {
//                print("Welcome!")
//            }
//        }
//    }
    func four() {
        SwiftProgressHUD.showSuccess("控制台 不显示就对了")
        guard let _ = myUsername, let _ = myPassword
            else { return }
        print("Welcome!")
    }
}

/// 5.计算属性 vs 方法
var radius: Double = 10
var diameter: Double {
    get { return radius * 2}
    set { radius = newValue / 2}
}
extension TableViewController {
    // 例：计算一个圆的直径
    func five(){
//        let diameter = getDiameter(radius: 10) // return 20
//        let radius = getRadius(diameter: 200) // return 100
        print(diameter)
        print(radius)
        SwiftProgressHUD.showSuccess("Diameter:\(diameter), Radius:\(radius)")
    }
    // 💩 Code
    func getDiameter(radius: Double) -> Double { return radius * 2}
    func getRadius(diameter: Double) -> Double { return diameter / 2}
}


/// 6.Enum 类型安全
extension TableViewController {
    // 例：售票情景
    func six(){
        // 💩 Code
//        switch person {
//            case "Adult": print("Pay $7")
//            case "Child": print("Pay $3")
//            case "Senior": print("Pay $4")
//            default: print("You alive, bruh?")
//        }
        enum People { case adult, child, senior }
        let person = People.adult
        switch person {
            case .adult:
                print("Pay $7")
                SwiftProgressHUD.showSuccess("Adult Pay $7")
            case .child:
                print("Pay $3")
                SwiftProgressHUD.showSuccess("Child Pay $3")
            case .senior:
                print("Pay $4")
                SwiftProgressHUD.showSuccess("Senior Pay $4")
        }
    }
}


/// 7.Nil Coalescing
extension TableViewController {
    // 例：用户选择 twitter 的主题颜色
    func seven(){
        let userChosenColor: String?
        let defaultColor = "Red"
        // 💩 Code
//        var colorToUse = ""
//        if userChosenColor != nil {
//            colorToUse = "Color"
//        } else {
//            colorToUse = "defaultColor"
//        }
        userChosenColor = "red"
        let colorToUse = userChosenColor ?? defaultColor
        SwiftProgressHUD.showSuccess("用户选择 twitter 的主题颜色：\(colorToUse)")
    }
}


/// 8.Conditional Coalescing
extension TableViewController {
    // 例：三目运算符简化代码
    func eight(){
        let currentHeight = 185
        let hasSpikyHair = true
        var finalHeight = 0
        // 💩 Code
//        if hasSpikyHair {
//            finalHeight = currentHeight + 5
//        } else {
//            finalHeight = currentHeight
//        }
        
        finalHeight = currentHeight + (hasSpikyHair ? 5: 0)
        SwiftProgressHUD.showSuccess("三目运算符简化代码\(finalHeight)")
    }
}


/// 9.函数式编程
extension TableViewController {
    // 例：获取偶数
    func nine(){
        // 💩 Code
//        var newEvens = [Int]()
//        for i in 1...10 {
//            if i % 2 == 0 { newEvens.append(i) }
//        }
//        print(newEvens) // [2, 4, 6, 8, 10]
        
        let evens = Array(1...10).filter { $0 % 2 == 0 }
        SwiftProgressHUD.showSuccess("获取偶数:\(evens)")

    }
}


/// 10.闭包 vs 方法
var sumUsingClosure: (Int, Int) -> (Int) = { $0 + $1 }
extension TableViewController {
    // 例：不需要用到函数的方法名和参数名时
    func ten(){
//        let result = sum(x: 5, y: 6) // 11
        
        let result = sumUsingClosure(5, 6) // 11
        SwiftProgressHUD.showSuccess("5 + 6 = \(result)")
    }
    // 💩 Code
    // Normal Function
//    func sum(x: Int, y: Int) -> Int { return x + y }
}

