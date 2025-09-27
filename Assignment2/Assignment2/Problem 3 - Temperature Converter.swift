import Foundation

// Функции для перевода
func celsiusToFahrenheit(_ c: Double) -> Double{
	return c * 9/5 + 32
}
func celsiusToKelvin(_ c: Double) -> Double {
	return c + 273.15
}
func fahrenheitToKelvin(_ f: Double) -> Double {
	return (f - 32) * 5/9 + 273.15
}
func fahrenheitToCelsius(_ f: Double) -> Double {
	return f - 32 * 5/9
}
func kelvinToCelsius(_ k: Double) -> Double {
	return k - 273.15
}
func kelvinToFahrenheit(_ k: Double) -> Double {
	return k * 9/5 - 459.67
}

// Основная функция для запуска задачи
func runProblem3() {
	while true { // общий цикл, чтобы можно было выполнять несколько конвертаций подряд
		var temperature: Double? // Ввод температуры
		while temperature == nil { // спрашиваем, пока не введут число
			print("Enter temperature value (or type 'exit' to quit):")
			let input = readLine()
			
			if input?.lowercased() == "exit" { // выход из программы
				print("Bye 👋")
				return
			}
			if let value = Double(input ?? "") { // проверка: введено ли число
				temperature = value
			} else {
				print("Invalid input. Please enter a valid number.") // сообщение об ошибке
			}
		}
		
		var unit: String? // Ввод единицы измерения
		while unit == nil {
			print("Enter unit (C, K, or F): ") // спрашиваем, пока не введут один из вариантов
			if let input = readLine()?.uppercased(), // переводим в заглавную букву
			   ["C", "K", "F"].contains(input) {
				unit = input
			} else {
				print("Invalid input. Please enter C, K, or F.") // сообщение об ошибке
			}
			
		}
		
		switch unit! { // Конвертация
		case "C":
			let f = celsiusToFahrenheit(temperature!)
			let k = celsiusToKelvin(temperature!)
			print("\(temperature!)°C = \(f)°F = \(k)°K")
			
		case "K":
			let c = kelvinToCelsius(temperature!)
			let f = kelvinToFahrenheit(temperature!)
			print("\(temperature!)°K = \(c)°C = \(f)°F")
			
		case "F":
			let c = fahrenheitToCelsius(temperature!)
			let k = fahrenheitToKelvin(temperature!)
			print("\(temperature!)°F = \(c)°C = \(k)°K")
		default:
			break
		}
		
		print("----🌡️------🌡️------🌡️------🌡️------🌡️-------🌡️------🌡️----")
	}
}
