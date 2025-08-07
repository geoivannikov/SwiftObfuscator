func test() {
    // Initialization
    let obj = MyClass()
    obj.sayHello()

    // As variable type
    var anotherObj: MyClass = MyClass()
    anotherObj.sayHello()

    // As function parameter type
    func takeClass(_ c: MyClass) {
        c.sayHello()
    }
    takeClass(obj)

    // As function return type
    func makeClass() -> MyClass {
        return MyClass()
    }
    let made = makeClass()
    made.sayHello()

    // In array
    let arr: [MyClass] = [MyClass(), MyClass()]
    arr.forEach { $0.sayHello() }

    // In generic
    let dict: [String: MyClass] = ["one": MyClass()]
    dict["one"]?.sayHello()

    // In optional
    var opt: MyClass? = MyClass()
    opt?.sayHello()

    // In typealias
    typealias Alias = MyClass
    let aliasObj = Alias()
    aliasObj.sayHello()

    // In inheritance
    class SubClass: MyClass {
        override func sayHello() {
            print("Hello from SubClass!")
        }
    }
    let sub = SubClass()
    sub.sayHello()
}
