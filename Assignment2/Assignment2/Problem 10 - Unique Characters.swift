import Foundation

// Функция для проверки
func hasUniqueCharacters(_ text: String) -> Bool {
	// создаём пустой Set для хранения встреченных символов
	var seenCharacters = Set<Character>()
	
	// перебираем строку посимвольно
	for char in text {
		if seenCharacters.contains(char) {
			// если символ уже встречался → не уникально
			return false
		}
		// добавляем символ в Set
		seenCharacters.insert(char)
	}
	
	// если цикл завершился без повторов → все символы уникальны
	return true
}

// Основной запуск
func runProblem10() {
	while true {
		print("\nEnter a string to check for unique characters (or type 'exit' to quit):")
		
		if let input = readLine() {
			if input.lowercased() == "exit" {
				print("Bye 👋")
				break
			}
			
			if hasUniqueCharacters(input) {
				print("All characters are unique ✅")
			} else {
				print("String has duplicate characters ❌")
			}
		} else {
			print("Invalid input")
		}
		print("-----------------------------------")
	}
}
