import Foundation

let content = try String(contentsOfFile: "./Sources/4/Input.txt")
	.components(separatedBy: .newlines)
	.map { $0.split(separator: "") }

extension Collection where Element == [String.SubSequence], Index == Int {
	public func at(_ i: Index, _ j: Element.Index) -> Element.Element {
		if i < 0 || i > self.count - 1 || j < 0 || j > self[i].count - 1 {
			return ""
		}

		return self[i][j]
	}
}

infix operator ?+ : AdditionPrecedence

func ?+ (lhs: Substring?, rhs: Substring?) -> Substring {
	return (lhs ?? "") + (rhs ?? "")
}

func xmasCount(_ content: [[String.SubSequence]], _ i: Int, _ j: Int) -> Int {
	if content[i][j] != "X" {
		return 0
	}

	let F = content.at(i, j + 1) ?+ content.at(i, j + 2) ?+ content.at(i, j + 3)
	let B = content.at(i, j - 1) ?+ content.at(i, j - 2) ?+ content.at(i, j - 3)
	let D = content.at(i + 1, j) ?+ content.at(i + 2, j) ?+ content.at(i + 3, j)
	let U = content.at(i - 1, j) ?+ content.at(i - 2, j) ?+ content.at(i - 3, j)
	let LT = content.at(i - 1, j - 1) ?+ content.at(i - 2, j - 2) ?+ content.at(i - 3, j - 3)
	let RT = content.at(i - 1, j + 1) ?+ content.at(i - 2, j + 2) ?+ content.at(i - 3, j + 3)
	let LB = content.at(i + 1, j - 1) ?+ content.at(i + 2, j - 2) ?+ content.at(i + 3, j - 3)
	let RB = content.at(i + 1, j + 1) ?+ content.at(i + 2, j + 2) ?+ content.at(i + 3, j + 3)

	return [F, B, D, U, LT, RT, LB, RB].filter { $0 == "MAS" }.count
}

print("== Day 4 / Part 1 ==")

var sum1 = 0
for i in 0..<content.count {
	for j in 0..<content[i].count {
		sum1 += xmasCount(content, i, j)
	}
}

print(sum1)

print("== Day 4 / Part 2 ==")

func xMasCount(_ content: [[String.SubSequence]], _ i: Int, _ j: Int) -> Int {
	if content[i][j] != "A" {
		return 0
	}

	let LtR = content.at(i - 1, j - 1) ?+ content.at(i + 1, j + 1)
	let RtL = content.at(i - 1, j + 1) ?+ content.at(i + 1, j - 1)

	return [LtR, RtL].allSatisfy { $0 == "MS" || $0 == "SM" } ? 1 : 0
}

var sum2 = 0
for i in 0..<content.count {
	for j in 0..<content[i].count {
		sum2 += xMasCount(content, i, j)
	}
}

print(sum2)
