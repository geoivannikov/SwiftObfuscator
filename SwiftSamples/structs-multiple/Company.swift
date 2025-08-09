struct Company {
    var name: String
    var address: Address
    var employees: [Person]
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
        self.employees = []
    }
    
    mutating func addEmployee(_ person: Person) {
        employees.append(person)
    }
    
    func getAdultEmployees() -> [Person] {
        return employees.filter { $0.isAdult() }
    }
    
    func getCompanyInfo() -> String {
        return "\(name) located at \(address.formatted())"
    }
}