import UIKit
import OrderedCollections

let tuples = [
	"MyTest1": 1,
	"MyTest2": 2,
	"MyTest3:": 3,
	"MyTest0": 0
]

// Not sorted
// 딕셔너리는 순서를 보장하지 않는다.
for (str, ind) in tuples {
	print(str, ind)
}

// 딕셔너리로 순서를 보장하고 싶으면 어떻게?
// 아래는 sorted 된 형태
let order = tuples.sorted(by: <)
print(order)

//넣은 순서대로 보장하는 법은 있을까
// Apple에서 제공하는 swift-collections에서 OrderdCollection을 import 해야함
let orderedTuples: OrderedDictionary  = [
	"MyTest1": 1,
	"MyTest2": 2,
	"MyTest3:": 3,
	"MyTest0": 0
]

print("I'm Oreder Tuples")
for (str, ind) in orderedTuples {
	print(str, ind)
}


// Stride (보폭이라는 뜻으로 보폭 설정 가능하다.
// from은 시작점, through는 끝점, by는 간격으로 생각하면 될 거 같다.
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 8, through: hours, by: hourInterval) {
		print(tickMark)
}

// Stride의 예제
// To, Through 의 차이점은 딱 떨어졌을 때 포함 여부 To는 포함 안함.
print("Stride To")
for radians in stride(from: 0, to: .pi * 2.5, by: .pi / 2) {
		let degrees = Int(radians * 180 / .pi)
		print("Degrees: \(degrees), radians: \(radians)")
}
print("Stride Through")
for radians in stride(from: 0.0, through: .pi * 2.5, by: .pi / 2) {
		let degrees = Int(radians * 180 / .pi)
		print("Degrees: \(degrees), radians: \(radians)")
}
// Stride의 이용

extension Array {
	func chunked(into size: Int) -> [[Element]] {
		return stride(from: 0, to: count, by: size).map {
			Array(self[$0 ..< Swift.min($0 + size, count)])
		}
	}
}

let chunked = [1,2,3,4,5,6,7,8,9,0].chunked(into: 2)
print("Chunked: \(chunked)")
var testRange = 0..<3
print(testRange.isEmpty)
print(testRange.contains(0))
print(testRange.contains(3))


let anotherPoint = (2,0)
switch anotherPoint {
case (let x, 0):
	print("on the x-axis with an x value of \(x)")
case (0, let y):
	print("on the x-axis with an x value of \(y)")
case let (x, y):
	print("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x,y) where x == y:
	print("\(x), \(y) is on line x==y")
case let (x,y) where x == -y:
	print("\(x), \(y) is on line x==-y")
case let (x,y):
	print("\(x), \(y) is just some arbitrary point")
}
