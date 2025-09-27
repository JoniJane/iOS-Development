import Foundation
// Функция для проверки
func isPalindrome(_ text: String) -> Bool {
	let lowercasedText = text.lowercased() // приводим к нижнему регистру
	
	// убираем пробелы и пунктуацию
	let clean = lowercasedText.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
	
	// сравниваем с перевёрнутым вариантом
	return clean == String(clean.reversed())
}


func runProblem8() {
	print("Enter a text to check:")
	if let input = readLine() {
		if isPalindrome(input) {
			print("Palindrome ✅")
		} else {
			print("Not a palindrome ❌")
		}
	}
}
