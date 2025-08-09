class Product {
    var title: String
    var price: Double
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
    
    func displayInfo() {
        print("\(title): $\(price)")
    }
}