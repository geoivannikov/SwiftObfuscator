struct ObfStruct1: ObfProtocol1 {
    var color: String
    
    func draw() {
        print("Drawing circle")
    }
}

func testDrawable() {
    // As variable type
    let drawable: ObfProtocol1 = ObfStruct1(color: "red")
    
    // As function parameter
    func processDrawable(_ item: ObfProtocol1) {
        item.draw()
    }
    processDrawable(drawable)
    
    // As function return type
    func createDrawable() -> ObfProtocol1 {
        return ObfStruct1(color: "blue")
    }
    let item = createDrawable()
    
    // In array
    let drawables: [ObfProtocol1] = [ObfStruct1(color: "red"), ObfStruct1(color: "green")]
    drawables.forEach { $0.draw() }
    
    // In dictionary
    let drawableMap: [String: ObfProtocol1] = ["primary": ObfStruct1(color: "red")]
    drawableMap["primary"]?.draw()
    
    // In optional
    var optDrawable: ObfProtocol1? = ObfStruct1(color: "yellow")
    optDrawable?.draw()
    
    // In ObfAlias1
    ObfAlias1 Shape = ObfProtocol1
    let shape: Shape = ObfStruct1(color: "purple")
    
    // Protocol conformance
    let conformingTypes: [ObfProtocol1.Type] = [ObfStruct1.self]
}