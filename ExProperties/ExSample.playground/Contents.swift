import UIKit

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(
    origin: Point(x: 0, y: 0),
    size: Size(width: 10, height: 10)
)

let initialCenter = square.center
print(initialCenter)

square.center = Point(x: 15, y: 15)
print(square.origin)

// Read Only - 오직 Getter만 사용가능


// Read Only라고 let은 아님. 왜냐하면 계산된 값은 변할 수 있기 때문.
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
    
}


// MARK: - 프로퍼티 옵저버 (willSet, didSet)

// willSet: 값이 저장되기 바로 직전에 호출
// didSet: 값이 저장되고 바로 직후에 호출


class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200
stepCounter.totalSteps = 360


// Type Property


