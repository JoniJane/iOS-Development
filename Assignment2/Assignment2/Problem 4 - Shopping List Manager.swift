import Foundation

func runProblem4() {
	var shoppingList: [String] = [] // массив для товаров
	while true 	{
		// меню
		print("""
			🛍️🛒------Shopping list Manager------🛒🛍️ 
			1. Add Item
			2. Remove Item
			3. Show shopping list
			4. Exit\n
			Choose an option:
			""")
		
		guard let choice = readLine()  else {
			print("\nInvalid input. Try again.")
			continue
		}
		
		switch choice {
		case "1": // добавить
			print("Enter item to add: ")
			if let itemToAdd = readLine(), !itemToAdd.isEmpty { // ввод товара и проверка на пустой ввод
				shoppingList.append(itemToAdd)
				print("\n✅ '\(itemToAdd)' added to the shopping list.")
			} else {
				print("\n‼️ Please enter the item.")
			}
		case "2": // удалить
			if shoppingList.isEmpty { //
				print("\n😕 Your shopping list is empty.")
			} else {
				print("Enter the item name to remove: ")
				if let itemToRemove = readLine(), !itemToRemove.isEmpty {
					// ищем индекс введённого элемента в массиве
					if let index = shoppingList.firstIndex(of: itemToRemove) {
						shoppingList.remove(at: index) // удаляем элемент по индексу
						print("\n❌ '\(itemToRemove)' removed from the shopping list.")
					} else {
						print("\n❓ '\(itemToRemove)' not finded in the shopping list.")
					}
				}
			}
		case "3": //показать список
			if shoppingList.isEmpty {
				print("\n😕 Your shopping list is empty.")
			} else {
				print("\n🛒 Your shopping list:")
				shoppingList.forEach { print($0) } // выводим каждый элемент списка
			}
		case "4": // выход
			print("Bye 👋")
			return
		default:
			print("\n❓ Invalid input. Please choose 1, 2, 3 or 4.")
		}
		
		print("\n")
	}
}
