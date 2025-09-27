import Foundation

func fibonacci(_ n: Int) -> [Int] {
	if n <= 0 {
		return [] // если n меньше или равно 0 → возвращаем пустой массив
	}
	var sequence = [0] // начинаем с 0
	
	if n == 1 {
		return sequence // первое число = 0
	}
	
	sequence.append(1) // второй элемент = 1
	
	// ну и сама формула
	while sequence.count < n {
		let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
		sequence.append(nextNumber)
	}
	return sequence
}

func runProblem6() {
	print("Enter how many Fibonacci numbers you want:")
	
	if let input = readLine(), let n = Int(input) {
		print(fibonacci(n))
	}
}
