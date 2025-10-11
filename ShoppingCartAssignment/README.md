README.md

This project is a simple shopping cart system written in Swift.  
It demonstrates the use of classes and structs, computed properties, and value vs. reference semantics.  
All parts were implemented inside a single Swift Playground for easy testing.

---

### Why did I choose `class` for ShoppingCart?

I used a **class** for `ShoppingCart` because it represents a shared object that multiple parts of the program can access and modify.  
When a class instance is changed, the change is reflected everywhere — this is useful for a cart that should stay synchronized.

### Why did I choose `struct` for Product and Order?

`Product` and `Order` are value types that describe data.  
Each instance is independent and should not change unexpectedly.  
This helps keep orders immutable after checkout.

---

### Example where reference semantics matter

When passing a cart to a function:
```swift
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: laptop, quantity: 1)
}
modifyCart(cart)
