import UIKit
import Foundation

// MARK: - Part 1.1: Product
struct Product {
	let id: String
	let name: String
	let price: Double
	let category: Category
	let description: String
	
	enum Category{
		case electronics, clothing, books
	}
	
	var displayPrice: String {
		"$\(String(format : "%.2f", price))"
	}
	
	// Инициализатор с проверкой цены
	init?(name: String, price: Double, category: Category, description: String) {
		guard price > 0 else {
			print("Error! Price must be greater than 0")
			return nil
		}
		self.id = UUID().uuidString // генерация уникального id
		self.name = name
		self.price = price
		self.category = category
		self.description = description
	}
}

// MARK: - Part 1.2: CartItem
struct CartItem {
	var product: Product
	private(set) var quantity: Int // защищаем от изменения снаружи
	
	var subTotal: Double {
		product.price * Double(quantity)
	}
	
	// Инициализатор с проверкой количества
	init(product: Product, quantity: Int) {
			if quantity > 0 {
				self.product = product
				self.quantity = quantity
			} else {
				print("Error! Quantity must be greater than 0")
				self.product = product
				self.quantity = 1
			}
		}
	
	// Метод для обновления количество
	mutating func updateQuantity(_ newQuantity: Int) {
		   if newQuantity > 0 {
			   quantity = newQuantity
		   } else {
			   print("Error! Quantity must be greater than 0")
		   }
	}

	// Метод для увеличения количества на заданное числл
	mutating func increaseQuantity(by amount: Int) {
		   if amount > 0 {
			   quantity += amount
		   } else {
			   print("Error! You can't add a negative quantity")
		   }
	}
}
//MARK: - Testing 1
//if let product = Product(name: "Phone", price: 1000, category: .electronics, description: "iPhone17") {
//	var item = CartItem(product: product, quantity: 1)
//	print("Subtotal: ", item.subTotal)
//	item.increaseQuantity(by: 2)
//	print("New subtotal: ", item.subTotal)
//}

// MARK: - DiscountType(for bonus task 2)
enum DiscountType {
	case save10   // скидка 10%
	case save20   // скидка 20%
	case none     // без скидки
}

// MARK: - Part 2: ShoppingCart Class
class ShoppingCart {
	private(set) var items: [CartItem] = []
	//var discountCode: String?
	var discount: DiscountType = .none
	
	// Пустой инициализатор
	init() {}
	
	// Добавляем товар в корзину
	func addItem(product: Product, quantity: Int = 1) {
		// Проверяем, есть ли уже этот товар в корзине
		if let index = items.firstIndex(where: { $0.product.id == product.id }) {
			// Если есть — увеличиваем количество
			items[index].increaseQuantity(by: quantity)
		} else {
			// Если нет — добавляем новый CartItem
			let newItem = CartItem(product: product, quantity: quantity)
			items.append(newItem)
		}
	}
	
	// Удаляем товар по ID
	func removeItem(productId: String) {
		items.removeAll { $0.product.id == productId }
	}
	
	// Обновляем количество
	func updateItemQuantity(productId: String, quantity: Int) {
		if let index = items.firstIndex(where: { $0.product.id == productId }) {
			if quantity > 0 {
				items[index].updateQuantity(quantity)
			} else {
				// Если количество 0 — удаляем товар
				items.remove(at: index)
			}
		}
	}
	
	// Полностью очищаем корзину
	func clearCart() {
		items.removeAll()
	}
	
	// Подсчёт общей суммы без скидки
	var subtotal: Double {
		items.reduce(0) { $0 + $1.subTotal }
	}
	
	// Вычисляем скидку
//	var discountAmount: Double {
//		switch discountCode {
//		case "SAVE10": return subtotal * 0.1
//		case "SAVE20": return subtotal * 0.2
//		default: return 0
//		}
//	}
	var discountAmount: Double {
		switch discount {
		case .save10:
			return subtotal * 0.1
		case .save20:
			return subtotal * 0.2
		case .none:
			return 0
		}
	}
	
	// Итоговая сумма
	var total: Double {
		subtotal - discountAmount
	}
	
	// Общее количество товаров
	var itemCount: Int {
		items.reduce(0) { $0 + $1.quantity }
	}
	
	// Проверка, пустая ли корзина
	var isEmpty: Bool {
		items.isEmpty
	}
}

// MARK: - Testing 2
//if let phone = Product(name: "iPhone 14", price: 1000, category: .electronics, description: "Apple smartphone"),
//   let book = Product(name: "Swift Guide", price: 30, category: .books, description: "Programming book") {
//	
//	let cart = ShoppingCart()
//	cart.addItem(product: phone, quantity: 1)
//	cart.addItem(product: book, quantity: 2)
//	
//	print("Subtotal:", cart.subtotal)     // 1060
//	print("Items in cart:", cart.itemCount) // 3
//	
//	cart.discountCode = "SAVE10"
//	print("Total with discount:", cart.total) // 954
//	
//	cart.updateItemQuantity(productId: phone.id, quantity: 3)
//	print("Updated subtotal:", cart.subtotal)
//	
//	cart.removeItem(productId: book.id)
//	print("Items left:", cart.itemCount)
//}

// MARK: - Part 3.1: Address
struct Address {
	var street: String
	var city: String
	var zipCode: String
	var country: String
	
	// Вычисляемое свойство — форматирует адрес в удобный вид
	var formattedAddress: String {
		"""
		\(street)
		\(city), \(zipCode)
		\(country)
		"""
	}
}

// MARK: - Part 3.2: Order
struct Order {
	let orderId: String
	let items: [CartItem]
	let subtotal: Double // Сумма без скидки
	let discountAmount: Double
	let total: Double // Итоговая сумма после скидки
	let timestamp: Date
	let shippingAddress: Address
	
	// Инициализатор фиксирует текущее состояние корзины при оформлении заказа
	init(from cart: ShoppingCart, shippingAddress: Address) {
		self.orderId = UUID().uuidString
		self.items = cart.items
		self.subtotal = cart.subtotal
		self.discountAmount = cart.discountAmount
		self.total = cart.total
		self.timestamp = Date()
		self.shippingAddress = shippingAddress
	}
	
	// Вычиляет общее количество товаров
	var itemCount: Int {
		items.reduce(0) { $0 + $1.quantity }
	}
}
// MARK: - Testing 3
//if let phone = Product(name: "iPhone 14", price: 1000, category: .electronics, description: "Apple smartphone"),
//   let book = Product(name: "Swift Programming", price: 30, category: .books, description: "Learn Swift easily") {
//
//	// Создаём корзину и добавляем товары
//	let cart = ShoppingCart()
//	cart.addItem(product: phone, quantity: 1)
//	cart.addItem(product: book, quantity: 2)
//	
//	// Добавляем скидку
//	cart.discountCode = "SAVE10"
//	
//	print("🛒 Cart before checkout:")
//	print("- Items count:", cart.itemCount)
//	print("- Subtotal:", cart.subtotal)
//	print("- Discount:", cart.discountAmount)
//	print("- Total:", cart.total)
//	print("--------------------------------")
//	
//	// Создаём адрес доставки
//	let address = Address(
//		street: "123 Main Street",
//		city: "Almaty",
//		zipCode: "050000",
//		country: "Kazakhstan"
//	)
//	
//	// Создаём заказ на основе корзины и адреса
//	let order = Order(from: cart, shippingAddress: address)
//	
//	print("📦 Order created:")
//	print("- Order ID:", order.orderId)
//	print("- Date:", order.timestamp)
//	print("- Items in order:", order.itemCount)
//	print("- Subtotal:", order.subtotal)
//	print("- Discount:", order.discountAmount)
//	print("- Total:", order.total)
//	print("- Shipping address:\n\(order.shippingAddress.formattedAddress)")
//}

// MARK: - User (Bonus 1)
class User {
	let userId: String
	let name: String
	let email: String
	private(set) var orderHistory: [Order] = []
	
	init(name: String, email: String) {
		self.userId = UUID().uuidString
		self.name = name
		self.email = email
	}
	
	// Добавляем заказ в историю
	func placeOrder(_ order: Order) {
		orderHistory.append(order)
	}
	
	// Подсчёт общей суммы потраченных денег
	var totalSpent: Double {
		orderHistory.reduce(0) { $0 + $1.total }
	}
}


// MARK: - Part 4: Testing & Demonstrations
let laptop = Product(name: "MacBook Air M2", price: 1200, category: .electronics, description: "Apple laptop")
let book = Product(name: "Swift Programming", price: 35, category: .books, description: "Learn Swift")
let headphones = Product(name: "AirPods Pro", price: 250, category: .electronics, description: "Wireless earbuds")

// Проверяем, что все продукты успешно создались
let cart = ShoppingCart()
if let laptop = laptop, let book = book, let headphones = headphones {

	//Добавляем товаров в корзину
	cart.addItem(product: laptop, quantity: 1)
	cart.addItem(product: book, quantity: 2)
	
	//Добавляем то же самое еще раз(должно увеличиь количество)
	cart.addItem(product: laptop, quantity: 1)
	print("Laptop quantity increased (should be 2).")
	
	//Проверяем вычислеия корзины
	print("Subtotal: \(cart.subtotal)")       // Сумма всех товаров
	print("Item count: \(cart.itemCount)")    // Общее количество товаров
	
	//Применяем скидку
//	cart.discountCode = "SAVE10"
	cart.discount = .save10
	print("Total with discount: \(cart.total)")  // Проверяем, что скидка сработала
	
	//Удаляем товар
	cart.removeItem(productId: book.id)
	print("Removed book. Cart now has \(cart.itemCount) items.")
	
	//Демонстрция REFERENCE TYPE поведения (class)
	func modifyCart(_ cart: ShoppingCart) {
		cart.addItem(product: headphones, quantity: 1)
	}
	modifyCart(cart)
	print("After modifyCart(), item count:", cart.itemCount)
	//Показывает, что class — ссылочный тип (оригинальная корзина изменилась)
	
	//Демонстрация VALUE TYPE поведения (struct)
	var item1 = CartItem(product: laptop, quantity: 1)
	var item2 = item1
	item2.updateQuantity(5)
	print("item1 quantity:", item1.quantity)  // 1
	print("item2 quantity:", item2.quantity)  // 5
	//Показывает, что struct — тип-значение (копия не влияет на оригинал)
	
	//Создаём адреес и заказ из корзины
	let user = User(name: "Ariana", email: "ariana@example.com") // этот user бфл создан для бонус таска1
	let address = Address(street: "123 Main St", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
	let order = Order(from: cart, shippingAddress: address)

	// Добавляем заказ пользователю и выводим(бонус таск1)
	user.placeOrder(order)
	print("-----------------------------------")
	print("\n👤 User:", user.name)
	print("🧾 Orders in history:", user.orderHistory.count)
	print("💰 Total spent:", user.totalSpent)
	print("\n-----------------------------------")
	
	//Модифицируем корзину после оформления
	cart.clearCart()
	print("🧾 Order items count:", order.itemCount) // Должно быть > 0
	print("🛒 Cart items count:", cart.itemCount)   // Должно быть 0
	//Видим, что Order хранит неизменяемую копию корзины
}
