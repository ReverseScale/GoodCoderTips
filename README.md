10 Tips to Keep Your Swift Code Simple

[EN](#Requirements) | [中文](#中文说明)

## 🎨 Why test the UI?

|1.List page | 2.Show page | 3.Show page | 4.Show page |
| ------------- | ------------- | ------------- | ------------- | 
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/46526620.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/12840369.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/14277353.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/167775.jpg) |
| Building a basic framework via storyboard | Enum type safety | Nil Coalescing | Closure vs. Method |

## 🤖 Requirements

* iOS 9.0+
* Xcode 9.0+
* Swift

## 🛠 Configuration

### 1.Extension
Example: Square a number
```
// Okay Version
func square(x: Int) -> Int { return x * x }
var squaredOFFive = square(x: 5)
square(x:squaredOFFive) // 625
```
The above code produces the squaredOFFive intermediate variable, which is not necessary. We can use Extension to add a squared method to Int. The advantage of this is that chaining can be performed later.```
// Better Version
extension Int { 
 var squared: Int { return self * self }
}
5.squared // 25
5.squared.squared // 625
```
### 2.Generics

Example: Output all the elements in an array.
```
// Bad Code
var stringArray = ["Bob", "Bobby", "SangJoon"]
var intArray = [1, 3, 4, 5, 6]
var doubleArray = [1.0, 2.0, 3.0]
func printStringArray(a: [String]) { for s in a { print(s) } }
func printIntArray(a: [Int]) { for i in a { print(i) } }
func printDoubleArray(a: [Double]) {for d in a { print(d) } }
```
The above example defines a lot of repetitive methods, if you use generics to implement this feature, the entire world will be refreshed.
```
// Awesome Code
func printElementFromArray<T>(a: [T]) {
 for element in a { print(element) } }
```
### 3.for cycle vs While cycle

Example: Print "count" 5 times
```
// Okay Code
var i = 0
while 5 > i {
print("Count")
i += 1 }
```
In order to control the number of while loops, a variable i has to be defined here. The for loop is more concise.
```
// Better Code
for _ in 1...5 { print("Count") }
```
### 4.Optional Unwrapping
Example: gaurd let vs if let
```
var myUsername: Double?
var myPassword: Double?
// Hideous Code
func userLogIn() {
 if let username = myUsername {
  if let password = myPassword {
   print("Welcome, \(username)"!)
  }
 }
}
```
Every time you see this nested if let statement is a headache, if you use guard let can make the code more concise.
```
// Pretty Code
func userLogIn() {
 guard let username = myUsername, let password = myPassword 
  else { return } 
 print("Welcome, \(username)!") }
 ```
### 5. Calculate Attribute vs Method

Example: Calculate the diameter of a circle:
```
// 💩 Code
func getDiameter(radius: Double) -> Double { return radius * 2}
func getRadius(diameter: Double) -> Double { return diameter / 2}

getDiameter(radius: 10) // return 20
getRadius(diameter: 200) // return 100
getRadius(diameter: 600) // return 300
```
This code creates two methods that convert each other. In fact, we can associate them by calculating properties.
```
// Good Code
var radius: Double = 10

var diameter: Double {
 get { return radius * 2}
 set { radius = newValue / 2}
}

radius // 10
diameter // 20
diameter = 1000
radius // 500
```
The radius and diameter are now related.

### 6.Enum type security

Example: Ticket sales
```
// Simply Bad

switch person {
 case "Adult": print("Pay $7")
 case "Child": print("Pay $3")
 case "Senior": print("Pay $4")
 default: print("You alive, bruh?")
}
```
Here we judge the content of the person (string), but this is a very dangerous practice, because we can't guarantee that the string in the switch case is written correctly, and xcode will not perform code completion.
```
// Beautiful Code
enum People { case adult, child, senior }
var person = People.adult
switch person {
 case .adult: print("Pay $7")
 case .child: print("Pay $3")
 case .senior: print("Pay $4")
}
```
Use enum to find your errors during compilation.

### 7.Nil Coalescing

Example: The user selects the theme color of twitter:
```
// Long Code

var userChosenColor: String?
var defaultColor = "Red"
var colorToUse = ""

if let Color = userChosenColor { colorToUse = Color } else
 { colorToUse = defaultColor }
```
This code is too long. Let's simplify it.
```
// Concise AF 
var colorToUse = userChosenColor ?? defaultColor
If userChosenColor is nil, the userChosenColor ?? defaultColor expression returns defaultColor, otherwise it returns userChosenColor.
```
### 8.Conditional Coalescing
```
// Simply Verbose
var currentHeight = 185
var hasSpikyHair = true
var finalHeight = 0

if hasSpikyHair { finalHeight = currentHeight + 5}
 else { finalHeight = currentHeight }
```

This code is too long, we can use the trinocular operator to simplify this code.
```
finalHeight = currentHeight + (hasSpikyHair ? 5: 0)
```
### 9.Functional Programming

Example: Get an even number:
```
var newEvens = [Int]()

for i in 1...10 {
 if i % 2 == 0 { newEvens.append(i) }
}

print(newEvens) // [2, 4, 6, 8, 10]
```
Looking at this code, we need to spend the energy to analyze this for loop. The more direct operation is as follows.
```
// Declarative 😎
var evens = Array(1...10).filter { $0 % 2 == 0 }
print(evens) // [2, 4, 6, 8, 10]
```
This code can clearly show our intentions.

### 10.Closure vs method
```
// Normal Function
func sum(x: Int, y: Int) -> Int { return x + y }
var result = sum(x: 5, y: 6) // 11
```
Sometimes we do not need to use the method name and parameter name of the function. We only want to use the function function. At this time, we can use the closure instead.
```
// Closure
var sumUsingClosure: (Int, Int) -> (Int) = { $0 + $1 }
sumUsingClosure(5, 6) // 11
```

## 📝 Reference source

《10 Tips to become a better Swift Developer》

---
# 中文说明

让你的 Swift 代码简洁的 10 个 Tips

## 🎨 测试 UI 什么样子？
|1.列表页 |2.展示页 |3.展示页 |4.展示页 |
| ------------- | ------------- | ------------- | ------------- | 
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/46526620.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/12840369.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/14277353.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-20/167775.jpg) |
| 通过 storyboard 搭建基本框架 | Enum 类型安全 | Nil Coalescing | 闭包 vs 方法 | 

## 🤖 要求

* iOS 9.0+
* Xcode 9.0+
* Swift 

## 🛠 配置
### 1.Extension
例：平方一个数字
```
// Okay Version
func square(x: Int) -> Int { return x * x }
var squaredOFFive = square(x: 5)
square(x:squaredOFFive) // 625
```
上面这段代码产生了 squaredOFFive 中间变量，其实是没有必要的，我们可以用 Extension 来给 Int 添加一个 squared 方法，这样的好处是以后可以进行链式操作。
```
// Better Version
extension Int { 
 var squared: Int { return self * self }
}
5.squared // 25
5.squared.squared // 625
```
### 2.Generics（泛型）

例：输出数组中的所有元素。
```
// Bad Code
var stringArray = ["Bob", "Bobby", "SangJoon"]
var intArray = [1, 3, 4, 5, 6]
var doubleArray = [1.0, 2.0, 3.0]
func printStringArray(a: [String]) { for s in a { print(s) } }
func printIntArray(a: [Int]) { for i in a { print(i) } }
func printDoubleArray(a: [Double]) {for d in a { print(d) } }
```
上例定义了很多重复功能的方法，如果用泛型实现该功能整个世界都清爽了。
```
// Awesome Code
func printElementFromArray<T>(a: [T]) {
 for element in a { print(element) } }
```
### 3.for 循环 vs While 循环

例：打印 “count” 5 次
```
// Okay Code
var i = 0
while 5 > i {
print("Count")
i += 1 }
```
为了控制 while 的循环次数，这里不得不定义一个变量 i 。而 for 循环更加简洁。
```
// Better Code
for _ in 1...5 { print("Count") }
```
### 4.Optional Unwrapping
例：gaurd let vs if let
```
var myUsername: Double?
var myPassword: Double?
// Hideous Code
func userLogIn() {
 if let username = myUsername {
  if let password = myPassword {
   print("Welcome, \(username)"!)
  }
 }
}
```
每次看到这种嵌套 if let 语句就让人头疼，如果使用 guard let 能让代码更简洁。
```
// Pretty Code
func userLogIn() {
 guard let username = myUsername, let password = myPassword 
  else { return } 
 print("Welcome, \(username)!") }
 ```
### 5.计算属性 vs 方法

例：计算一个圆的直径：
```
// 💩 Code
func getDiameter(radius: Double) -> Double { return radius * 2}
func getRadius(diameter: Double) -> Double { return diameter / 2}

getDiameter(radius: 10) // return 20
getRadius(diameter: 200) // return 100
getRadius(diameter: 600) // return 300
```
这段代码创建了两个相互转换的方法，其实我们完全可以通过计算属性把他们关联起来。
```
// Good Code
var radius: Double = 10

var diameter: Double {
 get { return radius * 2}
 set { radius = newValue / 2}
}

radius // 10
diameter // 20
diameter = 1000
radius // 500
```
现在，半径和直径是相互关联的。

### 6.Enum 类型安全

例：售票
```
// Simply Bad

switch person {
 case "Adult": print("Pay $7")
 case "Child": print("Pay $3")
 case "Senior": print("Pay $4")
 default: print("You alive, bruh?")
}
```
这里对 person (string) 的内容进行判断处理，但是这是一种很危险的做法，因为我们不能保证 switch case 中的字符串有没编写正确，而且 xcode 不会进行代码补全。
```
// Beautiful Code
enum People { case adult, child, senior }
var person = People.adult
switch person {
 case .adult: print("Pay $7")
 case .child: print("Pay $3")
 case .senior: print("Pay $4")
}
```
使用 enum 可以在编译期间发现你的错误。

### 7.Nil Coalescing

例：用户选择 twitter 的主题颜色：
```
// Long Code

var userChosenColor: String?
var defaultColor = "Red"
var colorToUse = ""

if let Color = userChosenColor { colorToUse = Color } else
 { colorToUse = defaultColor }
```
这代码太长，让我们来简化一下。
```
// Concise AF 
var colorToUse = userChosenColor ?? defaultColor
如果 userChosenColor 为 nil ，那么 userChosenColor ?? defaultColor 表达式返回 defaultColor，否则返回 userChosenColor。
```
### 8.Conditional Coalescing
```
// Simply Verbose
var currentHeight = 185
var hasSpikyHair = true
var finalHeight = 0

if hasSpikyHair { finalHeight = currentHeight + 5}
 else { finalHeight = currentHeight }
```

这代码太长，我们可以用三目运算符简化这段代码。
```
finalHeight = currentHeight + (hasSpikyHair ? 5: 0)
```
### 9.函数式编程

例：获取偶数：
```
var newEvens = [Int]()

for i in 1...10 {
 if i % 2 == 0 { newEvens.append(i) }
}

print(newEvens) // [2, 4, 6, 8, 10]
```
看这段代码我们需要花费精力去分析这个 for 循环, 更直接的操作如下。
```
// Declarative 😎
var evens = Array(1...10).filter { $0 % 2 == 0 }
print(evens) // [2, 4, 6, 8, 10]
```
这段代码能够很清晰的表示我们的意图。

### 10.闭包 vs 方法
```
// Normal Function
func sum(x: Int, y: Int) -> Int { return x + y }
var result = sum(x: 5, y: 6) // 11
```
我们有时不需要用到函数的方法名和参数名，只想用到函数功能，这个时候就可以使用闭包来代替。
```
// Closure
var sumUsingClosure: (Int, Int) -> (Int) = { $0 + $1 }
sumUsingClosure(5, 6) // 11
```

## 📝  参考来源
《10 Tips to become a better Swift Developer》
