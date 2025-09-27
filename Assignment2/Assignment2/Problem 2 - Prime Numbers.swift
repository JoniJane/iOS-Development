import Foundation

func runProblem2() {
	func isPrime(_ number:Int) -> Bool {
		if number <= 1 {
			return false
		}
		if number == 2 {
			return true
		}
		// проверяем делители только до квадратного корня
		for i in 2..<Int(sqrt(Double(number))) {
			if number % i == 0 {
				return false
			}
		}
		return true
	}
	
	for numbers in 1...100 {
		if isPrime(numbers) { print(numbers) }
	}
}
