import Foundation

let content = try String(contentsOfFile: "./Sources/3/Input.txt")
	.components(separatedBy: .newlines)
	.joined(separator: "")

let MUL_REGEX = /mul\((\d{1,3}),(\d{1,3})\)/
let BRANCH_REGEX = /don't\(\).*?do\(\)/

print("== Day 3 / Part 1 ==")

let sum1 = content.matches(of: MUL_REGEX).reduce(0) { (acc, match) in
	let (_, lhs, rhs) = match.output
	return acc + (Int(lhs)! * Int(rhs)!)
}

print(sum1)

print("== Day 3 / Part 2 ==")

let sum2 = content.replacing(BRANCH_REGEX, with: "").matches(of: MUL_REGEX).reduce(0) { (acc, match) in
	let (_, lhs, rhs) = match.output
	return acc + (Int(lhs)! * Int(rhs)!)
}

print(sum2)
