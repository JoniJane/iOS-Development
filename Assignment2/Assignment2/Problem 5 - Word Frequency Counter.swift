import Foundation

func runProblem5() {
	while true {
		print("Enter a sentence (or type 'exit' to quit): ")
		
		if let input = readLine() {
			if input.lowercased() == "exit" { // выход из программы
				print("Bye 👋")
				return
			}
			let sentence = input.lowercased() // переводим все слова в нижний регистр
			
			// разделяем строку по пунктуации, а затем соединяем обратно без этих символов
			let cleanSentence = sentence.components(separatedBy: CharacterSet.punctuationCharacters).joined()
			
			// разделяем строки по пробелам, убираем пустые строк(которые могли появиться из-за лишних пробелов)
			let words = cleanSentence.components(separatedBy: " ").filter {!$0.isEmpty}
			
			// создаем пустой словарь(ключ - слово, значение - количество его повторении)
			var wordFrequency: [String: Int] = [:]
			
			//считаем слова
			for word in words {
				// если слово уже есть в словаре - прибавляем 1, иначе - создаем с 1
				wordFrequency[word] = (wordFrequency[word] ?? 0) + 1
			}
			
			print("\n Whord frequency: ") // вывод
			for(word, count) in wordFrequency{
				print("\(word) : \(count)")
			}
		}
	}
}
