import Foundation

// функции для операций
func add(_ a: Double, _ b: Double) -> Double {
	return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
	return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
	return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
	if b == 0 {
		return nil // деление на 0 запрещено
	}
	return a / b
}

func runProblem9() {
	while true {
		print("\nEnter first number (or type 'exit' to quit):")
		guard let input1 = readLine(), input1.lowercased() != "exit" else {
			print("Bye 👋")
			break
		}
		guard let num1 = Double(input1) else {
			print("Invalid number!")
			continue
		}
		
		print("Enter second number:")
		guard let input2 = readLine(), let num2 = Double(input2) else {
			print("Invalid number!")
			continue
		}
		
		print("Choose operation (+, -, *, /):")
		guard let op = readLine() else {
			continue
		}
		
		var result: Double?
		
		switch op {
		case "+":
			result = add(num1, num2)
		case "-":
			result = subtract(num1, num2)
		case "*":
			result = multiply(num1, num2)
		case "/":
			result = divide(num1, num2)
			if result == nil {
				print("Error: Division by zero ❌")
				continue
			}
		default:
			print("Invalid operation!")
			continue
		}
		
		if let res = result {
			print("Result: \(res)")
		}
		
		print("---➖----➕----✖️----➗----🟰----")
	}
}
