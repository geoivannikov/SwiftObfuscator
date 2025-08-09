class ObfClass2 {
    var items: [ObfClass1] = []
    var owner: ObfClass3?
    
    init(owner: ObfClass3) {
        self.owner = owner
    }
    
    func addProduct(_ product: ObfClass1) {
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