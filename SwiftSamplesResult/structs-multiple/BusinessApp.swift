func runBusinessApp() {
    // Create addresses
    let homeAddress = ObfStruct1(street: "123 Main St", city: "New York", zipCode: "10001")
    let officeAddress = ObfStruct1(street: "456 Business Ave", city: "San Francisco", zipCode: "94105")
    
    // Create people
    var john = ObfStruct4(firstName: "John", lastName: "Doe", age: 25)
    var sarah = ObfStruct4(firstName: "Sarah", lastName: "Smith", age: 30)
    let teenager = ObfStruct4(firstName: "Mike", lastName: "Johnson", age: 16)
    
    // Create company
    var company = ObfStruct3(name: "Tech Corp", address: officeAddress)
    company.addEmployee(john)
    company.addEmployee(sarah)
    company.addEmployee(teenager)
    
    // Use structures
    print(company.getCompanyInfo())
    print("Employees: \(company.employees.count)")
    
    // Work with adult employees
    let adults = company.getAdultEmployees()
    print("Adult employees: \(adults.count)")
    
    // Modify structures
    john.haveBirthday()
    sarah.haveBirthday()
    
    // Arrays of structures
    let addresses: [ObfStruct1] = [homeAddress, officeAddress]
    addresses.forEach { print($0.formatted()) }
    
    let people: [ObfStruct4] = [john, sarah, teenager]
    people.forEach { print($0.fullName) }
    
    // Optional structures
    var optionalPerson: ObfStruct4? = ObfStruct4(firstName: "Optional", lastName: "User", age: 20)
    optionalPerson?.haveBirthday()
    
    // Dictionary with structures
    let employeeDatabase: [String: ObfStruct4] = [
        "john": john,
        "sarah": sarah
    ]
    employeeDatabase["john"]?.isAdult()
    
    // Nested struct ObfStruct2
    let companies: [ObfStruct3] = [company]
    companies.forEach { comp in
        print(comp.getCompanyInfo())
        comp.employees.forEach { emp in
            print("  - \(emp.fullName)")
        }
    }
}