import UIKit

// continue
// break
// fallthrough
// return
// throw - 제일 궁금한 것

public extension String {
	var charactersArray: [Character] {
		return Array(self)
	}
}

let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
let str = "aeiou "
// 옵션을 누르고 보면 String.Elemnet라 뜨는데 이것이 Character와 같은 말이다.
var test1 = str.map { $0 }
var test2 = str.charactersArray
print(test1 , test2)

if test1 == test2 {
	print ("same")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
		if charactersToRemove.contains(character) {
				continue
		} else {
				puzzleOutput.append(character)
		}
}
print(puzzleOutput)

 // MARK: - Fallthrouh
// fallthrough를 쓰게 되면 바로 밑의 case 조건을 확인하지 않고 바로 실행한다.
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
		description += " a prime number, and also"
		fallthrough
case 21:
	description += " intercept"
default:
		description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."


// MARK: - Labeled Statements 레이블 구문
//
//gameLoop: while square != finalSquare {
//		diceRoll += 1
//		if diceRoll == 7 { diceRoll = 1 }
//		switch square + diceRoll {
//		case finalSquare:
//				// diceRoll will move us to the final square, so the game is over
//				break gameLoop
//		case let newSquare where newSquare > finalSquare:
//				// diceRoll will move us beyond the final square, so roll again
//				continue gameLoop
//		default:
//				// this is a valid move, so find out its effect
//				square += diceRoll
//				square += board[square]
//		}
//}
//print("Game over!")

// MARK: - 이른 탈출 (Early Exit)

func greet(person: [String: String]) {
		guard let name = person["name"] else {
				return
		}

		print("Hello \(name)!")

		guard let location = person["location"] else {
				print("I hope the weather is nice near you.")
				return
		}

		print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."
