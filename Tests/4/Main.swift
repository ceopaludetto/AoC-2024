import Testing

@testable import AoC_2024_4

@Test("xmasCount()")
func xmasCount() {
	#expect(xmasCount([["X", "M", "A", "S"]], 0, 0) == 1)
	#expect(xmasCount([["S", "A", "M", "X"]], 0, 3) == 1)
	#expect(xmasCount([["X", "M", "A", "S"]], 0, 1) == 0)
	#expect(xmasCount([["X", "M", "A", "S"]], 0, 2) == 0)

	#expect(xmasCount([["X"], ["M"], ["A"], ["S"]], 0, 0) == 1)
	#expect(xmasCount([["S"], ["A"], ["M"], ["X"]], 3, 0) == 1)
	#expect(xmasCount([["X"], ["M"], ["A"], ["S"]], 1, 0) == 0)
	#expect(xmasCount([["X"], ["M"], ["A"], ["S"]], 2, 0) == 0)

	#expect(
		xmasCount(
			[
				["X", ".", ".", "."],
				[".", "M", ".", "."],
				[".", ".", "A", "."],
				[".", ".", ".", "S"],
			], 0, 0
		) == 1)

	#expect(
		xmasCount(
			[
				["S", ".", ".", "."],
				[".", "A", ".", "."],
				[".", ".", "M", "."],
				[".", ".", ".", "X"],
			], 3, 3
		) == 1)

	#expect(
		xmasCount(
			[
				[".", ".", ".", "S"],
				[".", ".", "A", "."],
				[".", "M", ".", "."],
				["X", ".", ".", "."],
			], 3, 0
		) == 1)

	#expect(
		xmasCount(
			[
				[".", ".", ".", "X"],
				[".", ".", "M", "."],
				[".", "A", ".", "."],
				["S", ".", ".", "."],
			], 0, 3
		) == 1)

	#expect(
		xmasCount(
			[
				["S", "A", "M", "X"],
				[".", ".", "M", "M"],
				[".", "A", ".", "A"],
				["S", ".", ".", "S"],
			], 0, 3
		) == 3)

}

@Test("xMasCount()")
func xMasCount() {
	#expect(
		xMasCount(
			[
				["M", ".", "M"],
				[".", "A", "."],
				["S", ".", "S"],
			], 0, 0
		) == 1)
}
