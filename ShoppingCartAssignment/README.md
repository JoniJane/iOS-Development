# Shopping Cart Project

This is my simple shopping cart system in Swift. I made it to experiment with **classes**, **structs**, and to see how **reference** and **value semantics** actually work in practice.  

# Why did you choose class for ShoppingCart?

I made `ShoppingCart` a **class** because it represents a shared object that multiple parts of the app can access and modify. Using a class ensures there’s only **one cart instance**, so adding products in one function updates the cart everywhere. If it were a struct, Swift would copy it every time it’s passed around, and changes wouldn’t persist.  

# Why did you choose struct for Product and Order?

`Product` and `Order` are **structs** because they’re simple, self-contained data. Copying them is safe, and temporary modifications don’t affect the original data. This makes the code predictable and avoids unintended side effects.  

# Explain one example where reference semantics matter

`ShoppingCart` is a **class**, so multiple parts of the code can modify the same cart instance. In my project:

```swift
let cart = ShoppingCart()

// Add products
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

// Modify cart from another function
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)

print("Item count after modifyCart():", cart.itemCount) // Shows that headphones were added
```
This shows that ShoppingCart is reference type: changes in modifyCart affect the original cart.

# Explain one example where value semantics matter

`CartItem` is a struct, so copies can be modified independently:

```swift
var item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)

print("item1 quantity:", item1.quantity)  // 1
print("item2 quantity:", item2.quantity)  // 5
```
Changing item2 does not change item1, which makes structs predictable and safe to work with copies.

# What challenges did you face and how did you solve them?

The main challenge was deciding what should be a class versus a struct. At first, I made everything structs, but updates to the cart didn’t persist. Switching `ShoppingCart` to a class fixed this immediately.
Another tricky part was calculating totals and applying discounts. I solved it by adding **computed properties** (`subtotal`, `discountAmount`, `total`) that automatically update whenever items in the cart change.
Overall, this project helped me understand **reference vs value semantics** in Swift and when to use a class or struct. It also showed how to structure a shopping cart system with products, orders, and users while keeping data safe and predictable.
