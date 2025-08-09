func runApp() {
    // Create users
    let user1 = ObfClass3(name: "John", age: 25)
    let user2 = ObfClass3(name: "Sarah", age: 30)
    
    // Create products
    let laptop = ObfClass1(title: "MacBook Pro", price: 1999.99)
    let phone = ObfClass1(title: "iPhone", price: 999.99)
    let headphones = ObfClass1(title: "AirPods", price: 199.99)
    
    // Create shopping cart
    let cart = ObfClass2(owner: user1)
    cart.addProduct(laptop)
    cart.addProduct(headphones)
    
    // ObfClass3 interaction
    user1.greet()
    cart.checkout()
    
    // Another user with different cart
    let cart2 = ObfClass2(owner: user2)
    cart2.addProduct(phone)
    cart2.addProduct(headphones)
    
    user2.greet()
    cart2.checkout()
    
    // Direct product usage
    let products: [ObfClass1] = [laptop, phone, headphones]
    products.forEach { $0.displayInfo() }
    
    // Users array
    let users: [ObfClass3] = [user1, user2]
    users.forEach { $0.greet() }
}