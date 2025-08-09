func test() {
    // Initialization
    let obj = ObfClass1()
    obj.sayHello()

    // As variable type
    var anotherObj: ObfClass1 = ObfClass1()
    anotherObj.sayHello()

    // As function parameter type
    func takeClass(_ c: ObfClass1) {
        c.sayHello()
    }
    takeClass(obj)

    // As function return type
    func makeClass() -> ObfClass1 {
        return ObfClass1()
    }
    let made = makeClass()
    made.sayHello()

    // In array
    let arr: [ObfClass1] = [ObfClass1(), ObfClass1()]
    arr.forEach { $0.sayHello() }

    // In generic
    let dict: [String: ObfClass1] = ["one": ObfClass1()]
    dict["one"]?.sayHello()

    // In optional
    var opt: ObfClass1? = ObfClass1()
    opt?.sayHello()

    // In ObfAlias1
    ObfAlias1 Alias = ObfClass1
    let aliasObj = Alias()
    aliasObj.sayHello()

    // In inheritance
    class ObfClass2: ObfClass1 {
        override func sayHello() {
            print("Hello from ObfClass2!")
        }
    }
    let sub = ObfClass2()
    sub.sayHello()
}
