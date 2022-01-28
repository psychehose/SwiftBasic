import UIKit

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")


// 인자 라벨 지정 (Specifying Argument Labels)

func someFunction(argumentLabel parameterName: Int) {
    // 함수 안애서 parameterName로 argumentLabel의 인자값을 참조할 수 있습니다.
}
// Example

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."

func myExample(person name: String, to age: Int) {
    print("Exmaple")
    print(name.count)
    print(age)
}

// 집합 파라미터 ( Variadic Parameters ) - 인자 값으로 특정 형 (type)의 집합 값을 사용할 수 있음.

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

func variadicTest(_ strs: String...) -> String {
    var result = ""
    for str in strs {
        result += " " + str
    }
    return result
}


variadicTest("hello", "hose", "fine", "Pine", "Apple" )


// 인-아웃 파라미터 (In-Out Parameters)

// 인자 값을 직접 변경하는 파라미터 입니다. 선언을 위해 파라미터 앞에 inout 이라는 키워드를 사용합니다. 아래는 인자 두 값을 변경하는 함수입니다.

// Call By Reference

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"


func inoutTestFunction(_ a: inout Int) {
    a = a + 1
}
var aTest = 0
for _ in 0 ..< 5 {
    inoutTestFunction(&aTest)
    print(aTest)
}
// print maybe 1 2 3 4 5
