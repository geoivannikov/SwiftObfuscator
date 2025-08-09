func runApp() {
    // Create users
    let user1 = User(name: "John", age: 25)
    let user2 = User(name: "Sarah", age: 30)
    
    // Create products
    let laptop = Product(title: "MacBook Pro", price: 1999.99)
    let phone = Product(title: "iPhone", price: 999.99)
    let headphones = Product(title: "AirPods", price: 199.99)
    
    // Create shopping cart
    let cart = ShoppingCart(owner: user1)
    cart.addProduct(laptop)
    cart.addProduct(headphones)
    
    // User interaction
    user1.greet()
    cart.checkout()
    
    // Another user with different cart
    let cart2 = ShoppingCart(owner: user2)
    cart2.addProduct(phone)
    cart2.addProduct(headphones)
    
    user2.greet()
    cart2.checkout()
    
    // Direct product usage
    let products: [Product] = [laptop, phone, headphones]
    products.forEach { $0.displayInfo() }
    
    // Users array
    let users: [User] = [user1, user2]
    users.forEach { $0.greet() }
}