# Shopping Cart Project

This is my simple shopping cart system in Swift. I made it to experiment with **classes**, **structs**, and to see how **reference** and **value semantics** actually work in practice.  

# Why did you choose class for ShoppingCart?

I made `ShoppingCart` a **class** because it represents a shared object that multiple parts of the app can access and modify. Using a class ensures there’s only **one cart instance**, so adding products in one function updates the cart everywhere. If it were a struct, Swift would copy it every time it’s passed around, and changes wouldn’t persist.  

# Why did you choose struct for Product and Order?

`Product` and `Order` are **structs** because they’re simple, self-contained data. Copying them is safe, and temporary modifications don’t affect the original data. This makes the code predictable and avoids unintended side effects.  

# Explain one example where reference semantics matter

Reference semantics are important when updating the shopping cart from different places. In my code, I can add products and calculate totals across multiple functions, all working on the same cart instance:  

```swift
class ShoppingCart {
    var products: [Product] = []

    func add(product: Product) {
        products.append(product)
    }

    func totalPrice() -> Double {
        products.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
}

let cart = ShoppingCart()
let apple = Product(name: "Apple", price: 50.0, quantity: 2)
cart.add(product: apple)
print(cart.totalPrice()) // 100.0

If ShoppingCart were a struct, these updates wouldn’t stick.

# Explain one example where value semantics matter

Value semantics are useful for `Product`. In my project, I can make a copy of a product to adjust quantity or options without affecting the original catalog:

```swift
struct Product {
    var name: String
    var price: Double
    var quantity: Int
}

var banana = Product(name: "Banana", price: 30.0, quantity: 1)
var tempBanana = banana
tempBanana.quantity = 5

print("Original quantity: \(banana.quantity)") // 1
print("Temp quantity: \(tempBanana.quantity)") // 5

This keeps data safe and predictable while experimenting with product options.

# What challenges did you face and how did you solve them?

The main challenge was deciding what should be a class versus a struct. Initially, I made everything structs, but updates to the cart didn’t persist. Switching `ShoppingCart` to a class solved this. Another tricky part was keeping the total price accurate after adding or removing items. I fixed this by using a **computed property** for total price that recalculates automatically whenever products change.

Overall, this project helped me understand **reference vs value semantics** in Swift and when to use a class or struct. Plus, it was fun to see a small shop working in code!
