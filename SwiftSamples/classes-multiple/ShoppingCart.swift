class ShoppingCart {
    var items: [Product] = []
    var owner: User?
    
    init(owner: User) {
        self.owner = owner
    }
    
    func addProduct(_ product: Product) {
        items.append(product)
    }
    
    func getTotalPrice() -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
    
    func checkout() {
        guard let owner = owner else { return }
        print("\(owner.name) is checking out...")
        for item in items {
            item.displayInfo()
        }
        print("Total: $\(getTotalPrice())")
    }
}