func runBusinessApp() {
    // Create addresses
    let homeAddress = Address(street: "123 Main St", city: "New York", zipCode: "10001")
    let officeAddress = Address(street: "456 Business Ave", city: "San Francisco", zipCode: "94105")
    
    // Create people
    var john = Person(firstName: "John", lastName: "Doe", age: 25)
    var sarah = Person(firstName: "Sarah", lastName: "Smith", age: 30)
    let teenager = Person(firstName: "Mike", lastName: "Johnson", age: 16)
    
    // Create company
    var company = Company(name: "Tech Corp", address: officeAddress)
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
    let addresses: [Address] = [homeAddress, officeAddress]
    addresses.forEach { print($0.formatted()) }
    
    let people: [Person] = [john, sarah, teenager]
    people.forEach { print($0.fullName) }
    
    // Optional structures
    var optionalPerson: Person? = Person(firstName: "Optional", lastName: "User", age: 20)
    optionalPerson?.haveBirthday()
    
    // Dictionary with structures
    let employeeDatabase: [String: Person] = [
        "john": john,
        "sarah": sarah
    ]
    employeeDatabase["john"]?.isAdult()
    
    // Nested struct usage
    let companies: [Company] = [company]
    companies.forEach { comp in
        print(comp.getCompanyInfo())
        comp.employees.forEach { emp in
            print("  - \(emp.fullName)")
        }
    }
}