import UIKit

// MARK: - Closure

/*
 * 클로저는 상수나, 변수의 참조를 capture 해서 저장할 수 있음.
 * 클로저의 3가지 형태로 나타남
 
 * 1. 전역 함수 - 이름이 있고, 어떤 값도 캡쳐하지 않는 클로저
 * 2. 중첩 함수 - 이름이 있고 관련된 함수로 부터 값을 캡쳐할 수 있는 클로저
 * 3. 클로저 표현 - 경량화 된 문법, context로 부터 캡쳐할 수 있음 (익명)
 
 
 */

// 클로저 표현 Example1. - The Sorted Method.

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
// sorted(by:)는 두개의 인자를 갖는 클로저를 인자로 사용.
// (string, string) -> Bool 이것이 클로저임.
//names.sorted(by: <#T##(String, String) throws -> Bool#>)

func backward(_ s1: String, _ s2: String) -> Bool {
  return s1 > s2
}

var reversedNames = names.sorted(by: backward)

  // 같은 식, 다른 표현 방식

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print(reversedNames)
reversedNames = names.sorted(by: { $0 > $1 })
print(reversedNames)
reversedNames = names.sorted(by: > )
print(reversedNames)

// MARK: - Trailing Clousre

reversedNames = names.sorted() { $0 > $1 }
print(reversedNames)

reversedNames = names.sorted { $0 > $1 }
print(reversedNames)



let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
      // Dictionary의 subscript는 optional 이므로 ! 가 붙어있음.
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

  // MARK: - Capturing Values


/*
 *  클로저는 특정 문맥의 상수나 변수의 값을 캡쳐할 수 있음.
 *  즉 원본 값이 사라져도 closure의 body 안에서 값 활용 가능
 */


// Example 1.

/*
 * makeIncrementer는 incrementer 라는 함수를 호출. (return type: Void 가 아니라 (Void -> Int) 임)
 * increment 라는 함수를 들여다 보면 runningTotal, amount 이라는 변수가 없지만 에러가 없음 Why?
 * -> increment에서 runningTotal, amount 라는 값을 캡쳐해서 가지고 있기 때문
 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  var runningTotal = 0
  func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
  }
  return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())

 // MARK: - 클로저는 참조 타입

let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
print(incrementByTen())


// MARK: - Escaping Closure
// 복습하는 것이 좋을듯.
/*
 * 함수 밖(함수가 끝나고)에서 실행되는 클로저 (Ex. 비동기, completionHandler etc.)
 * -> @escaping 이라는 키워드를 명시.
 */

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
  closure()
}

class SomeClass {
  var x = 10
  func doSomething() {
    someFunctionWithEscapingClosure {
      self.x = 100
    }
    someFunctionWithNonescapingClosure { x = 200 }
  }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)


var completionHandlers2: [(Int) -> Void] = []

func someFunctionWithEscapingClosure2(completionHandler: @escaping (Int) -> Void) {
  completionHandlers2.append(completionHandler)
}

func someFunctionWithNonescapingClosure2(closure: () -> Void) {
  closure()
}

class SomeClass2 {
  var x = 10
  func doSomething() {
    someFunctionWithEscapingClosure2 { test in
      self.x = test
    }
    someFunctionWithNonescapingClosure2 { x = 200 }
  }
}
let instance2 = SomeClass2()
instance2.doSomething()
print(instance2.x)

completionHandlers2.first?(300)
print(instance2.x)

// MARK: - Auto Closures

/*
 * No args
 * 특정 표현을 감싸서 다른 함수의 args로 전달 가능
 *  "클로저를 실행하고 나서 실제 진행"
 *
 */

// Example.


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"


// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"


// Using @autoclosure

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"


// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []        //  클로저를 저장하는 배열을 선언
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
} // 클로저를 인자로 받아 그 클로저를 customerProviders 배열에 추가하는 함수를 선언
collectCustomerProviders(customersInLine.remove(at: 0))    // 클로저를 customerProviders 배열에 추가
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."        // 2개의 클로저가 추가 됨
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")    // 클로저를 실행하면 배열의 0번째 원소를 제거하며 그 값을 출력
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"
