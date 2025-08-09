struct ObfStruct1 {
    var street: String
    var city: String
    var zipCode: String
    
    init(street: String, city: String, zipCode: String) {
        self.street = street
        self.city = city
        self.zipCode = zipCode
    }
    
    func formatted() -> String {
        return "\(street), \(city) \(zipCode)"
    }
}