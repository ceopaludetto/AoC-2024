import Testing

@testable import AoC_2024_2

@Test("hasShift()")
func hasShift() {
	#expect(hasShift(1, 2, 3) == false)
	#expect(hasShift(3, 2, 1) == false)
	#expect(hasShift(1, 2, 1) == true)
	#expect(hasShift(1, 2, 2) == false)
	#expect(hasShift(1, 2, 4) == false)
	#expect(hasShift(5, 1, 5) == true)
}

@Test("isSafe(retryable: false)")
func isSafeRetryableFalse() {
	// Increasing
	#expect(isSafe([1, 2, 3, 4, 5], retryable: false) == true)
	#expect(isSafe([1, 3, 4, 5, 6], retryable: false) == true)
	#expect(isSafe([1, 4, 5, 6, 7], retryable: false) == true)

	// Decreasing
	#expect(isSafe([5, 4, 3, 2, 1], retryable: false) == true)
	#expect(isSafe([6, 4, 3, 2, 1], retryable: false) == true)
	#expect(isSafe([7, 4, 3, 2, 1], retryable: false) == true)

	// Repeating
	#expect(isSafe([1, 1, 1, 1, 1], retryable: false) == false)
	#expect(isSafe([1, 2, 2, 3, 4], retryable: false) == false)
	#expect(isSafe([1, 2, 2, 5, 6], retryable: false) == false)

	// Increasing and decreasing
	#expect(isSafe([1, 2, 1, 3, 4], retryable: false) == false)
	#expect(isSafe([4, 3, 1, 2, 1], retryable: false) == false)

	// Multiple errors
	#expect(isSafe([1, 2, 1, 3, 10], retryable: false) == false)

	// AoC page
	#expect(isSafe([7, 6, 4, 2, 1], retryable: false) == true)
	#expect(isSafe([1, 2, 7, 8, 9], retryable: false) == false)
	#expect(isSafe([9, 7, 6, 2, 1], retryable: false) == false)
	#expect(isSafe([1, 3, 2, 4, 5], retryable: false) == false)
	#expect(isSafe([8, 6, 4, 4, 1], retryable: false) == false)
	#expect(isSafe([1, 3, 6, 7, 9], retryable: false) == true)
}

@Test("isSafe(retryable: true)")
func isSafeRetryableTrue() {
	// Increasing
	#expect(isSafe([1, 2, 3, 4, 5], retryable: true) == true)
	#expect(isSafe([1, 3, 4, 5, 6], retryable: true) == true)
	#expect(isSafe([1, 4, 5, 6, 7], retryable: true) == true)

	// Decreasing
	#expect(isSafe([5, 4, 3, 2, 1], retryable: true) == true)
	#expect(isSafe([6, 4, 3, 2, 1], retryable: true) == true)
	#expect(isSafe([7, 4, 3, 2, 1], retryable: true) == true)

	// Repeating
	#expect(isSafe([1, 1, 1, 1, 1], retryable: true) == false)
	#expect(isSafe([1, 2, 2, 3, 4], retryable: true) == true)
	#expect(isSafe([1, 2, 2, 5, 6], retryable: true) == true)
	#expect(isSafe([1, 2, 2, 6, 7], retryable: true) == false)
	#expect(isSafe([5, 2, 2, 1, 0], retryable: true) == true)
	#expect(isSafe([6, 2, 2, 1, 0], retryable: true) == false)

	// Increasing and decreasing
	#expect(isSafe([1, 2, 1, 3, 4], retryable: true) == true)
	#expect(isSafe([4, 3, 1, 2, 1], retryable: true) == true)
	#expect(isSafe([1, 4, 1, 7, 10], retryable: true) == true)
	#expect(isSafe([1, 4, 1, 4, 7], retryable: true) == false)
	#expect(isSafe([1, 10, 4, 5, 6], retryable: true) == true)

	// Multiple errors
	#expect(isSafe([1, 2, 1, 3, 10], retryable: true) == false)
	#expect(isSafe([1, 1, 4, 3, 10], retryable: true) == false)

	// AoC page
	#expect(isSafe([7, 6, 4, 2, 1], retryable: true) == true)
	#expect(isSafe([1, 2, 7, 8, 9], retryable: true) == false)
	#expect(isSafe([9, 7, 6, 2, 1], retryable: true) == false)
	#expect(isSafe([1, 3, 2, 4, 5], retryable: true) == true)
	#expect(isSafe([8, 6, 4, 4, 1], retryable: true) == true)
	#expect(isSafe([1, 3, 6, 7, 9], retryable: true) == true)

	// Edge cases
	#expect(isSafe([48, 46, 47, 49, 51, 54, 56], retryable: true) == true)
	#expect(isSafe([1, 1, 2, 3, 4, 5], retryable: true) == true)
	#expect(isSafe([1, 2, 3, 4, 5, 5], retryable: true) == true)
	#expect(isSafe([5, 1, 2, 3, 4, 5], retryable: true) == true)
	#expect(isSafe([1, 4, 3, 2, 1], retryable: true) == true)
	#expect(isSafe([1, 6, 7, 8, 9], retryable: true) == true)
	#expect(isSafe([1, 2, 3, 4, 3], retryable: true) == true)
	#expect(isSafe([9, 8, 7, 6, 7], retryable: true) == true)
	#expect(isSafe([7, 10, 8, 10, 11], retryable: true) == true)
	#expect(isSafe([29, 28, 27, 25, 26, 25, 22, 20], retryable: true) == true)
	#expect(isSafe([7, 10, 8, 10, 11], retryable: true) == true)
	#expect(isSafe([29, 28, 27, 25, 26, 25, 22, 20], retryable: true) == true)
}
