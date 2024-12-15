import Foundation

let content = try String(contentsOfFile: "./Sources/3/Input.txt")
	.components(separatedBy: .newlines)
	.joined(separator: "")

print("== Day 3 / Part 1 ==")

let mulRegex = /mul\((\d{1,3}),(\d{1,3})\)/
let sum1 = content.matches(of: mulRegex).reduce(0) { (acc, match) in
	let (_, lhs, rhs) = match.output
	return acc + (Int(lhs)! * Int(rhs)!)
}

print(sum1)

print("== Day 3 / Part 2 ==")

let instructionRegex = /don't\(\).*?do\(\)/
let instructions = content.replacing(instructionRegex, with: "")

let sum2 = instructions.matches(of: mulRegex).reduce(0) { (acc, match) in
	let (_, lhs, rhs) = match.output
	return acc + (Int(lhs)! * Int(rhs)!)
}

print(sum2)
