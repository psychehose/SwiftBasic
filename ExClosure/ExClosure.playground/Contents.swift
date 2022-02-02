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
reversedNames = names.sorted(by: { $0 > $1 })
reversedNames = names.sorted(by: > )

print(reversedNames)



