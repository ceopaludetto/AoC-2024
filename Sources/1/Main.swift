import Foundation

print("== Day 1 / Part 1 ==")

let content = try String(contentsOfFile: "./Sources/1/Input.txt")

var left: [Int] = []
var right: [Int] = []

content.components(separatedBy: .newlines)
	.forEach { line in
		let data = line.split(separator: /\s+/)

		if data.count == 0 {
			return
		}

		left.append(Int(data[0])!)
		right.append(Int(data[1])!)
	}

left.sort()
right.sort()

var distance = 0
for index in 0..<left.count {
	distance += abs(left[index] - right[index])
}

print(distance)

print("== Day 1 / Part 2 ==")

var similarity = 0
for index in 0..<left.count {
	similarity += left[index] * right.count { $0 == left[index] }
}

print(similarity)
