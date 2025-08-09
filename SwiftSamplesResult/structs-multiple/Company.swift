struct ObfStruct3 {
    var name: String
    var address: ObfStruct1
    var employees: [ObfStruct4]
    
    init(name: String, address: ObfStruct1) {
        self.name = name
        self.address = address
        self.employees = []
    }
    
    mutating func addEmployee(_ person: ObfStruct4) {
        employees.append(person)
    }
    
    func getAdultEmployees() -> [ObfStruct4] {
        return employees.filter { $0.isAdult() }
    }
    
    func getCompanyInfo() -> String {
        return "\(name) located at \(address.formatted())"
    }
}