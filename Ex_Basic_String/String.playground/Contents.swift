import UIKit
import Foundation

let greeting = "Guten Tag!"

// Curious Thing: rawbits:  65536
// 65536 bit = 8192 Byte
// 8bit = 1 byte
// 2^3 = 1

greeting[greeting.index(before: greeting.endIndex)]
for index in greeting.indices {
	print(index)
}
