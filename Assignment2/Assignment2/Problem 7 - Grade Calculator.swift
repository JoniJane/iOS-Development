import Foundation

func runProblem7() {
	// данные студентов (имя: балл)
	let studentScore : [String: Int] = [
		"Zhanel": 100,
		"Amanzhol": 70,
		"Kanat": 88,
		"Alikhan": 65,
		"Aiya": 91
	]
	
	let scores = Array(studentScore.values) // массив всех баллов
	
	let total = scores.reduce(0, +) // сумма всех баллов
	let average = Double(total) / Double(scores.count) // вычисление среднего
	
	// находим макс и мин 
	if let maxScore = scores.max(), let minScore = scores.min() {
		print("Average score: \(average)")
		print("Highest score: \(maxScore)")
		print("Lowest score: \(minScore)")
	}
	// вывод каждого студента
	for (name, score) in studentScore {
		if Double(score) >= average {
			print("\(name): \(score) - above average")
		} else {
			print("\(name): \(score) -  below average")
		}
	}
}
