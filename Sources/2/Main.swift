import Foundation

let content = try String(contentsOfFile: "./Sources/2/Input.txt")
	.components(separatedBy: .newlines)
	.map { $0.split(separator: /\s+/).compactMap { Int($0) } }

extension Collection {
	public subscript(safe index: Index) -> Element? {
		return self.indices.contains(index) ? self[index] : nil
	}
}

public func hasShift(_ previous: Int, _ current: Int, _ next: Int?) -> Bool {
	if next == nil {
		return false
	}

	return (current > previous && current > next!) || (current < previous && current < next!)
}

public func isSafe(_ list: [Int], retryable: Bool) -> Bool {
	for index in 1..<list.count {
		let current = list[index]
		let previous = list[index - 1]
		let next = list[safe: index + 1]

		// If is unsafe
		if hasShift(previous, current, next) || current == previous || abs(current - previous) > 3 {
			if !retryable {
				return false
			}

			let enumerated = list.enumerated()

			let removedPrevious = enumerated.filter { $0.offset != index - 1 }.map(\.element)
			let removedCurrent = enumerated.filter { $0.offset != index }.map(\.element)
			let removedNext = enumerated.filter { $0.offset != index + 1 }.map(\.element)

			return [
				isSafe(removedPrevious, retryable: false),
				isSafe(removedCurrent, retryable: false),
				isSafe(removedNext, retryable: false),
			].contains { $0 }
		}
	}

	return true
}

print("== Day 2 / Part 1 ==")

let safe1 = content.reduce(0) { (acc, data) in
	guard data.count > 0 else {
		return acc
	}

	return isSafe(data, retryable: false) ? acc + 1 : acc
}

print(safe1)

print("== Day 2 / Part 2 ==")

let safe2 = content.reduce(0) { (acc, data) in
	guard data.count > 0 else {
		return acc
	}

	return isSafe(data, retryable: true) ? acc + 1 : acc
}

print(safe2)
