struct Person {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func isAdult() -> Bool {
        return age >= 18
    }
    
    mutating func haveBirthday() {
        age += 1
    }
}