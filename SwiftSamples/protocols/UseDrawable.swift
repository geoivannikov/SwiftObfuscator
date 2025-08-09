struct Circle: Drawable {
    var color: String
    
    func draw() {
        print("Drawing circle")
    }
}

func testDrawable() {
    // As variable type
    let drawable: Drawable = Circle(color: "red")
    
    // As function parameter
    func processDrawable(_ item: Drawable) {
        item.draw()
    }
    processDrawable(drawable)
    
    // As function return type
    func createDrawable() -> Drawable {
        return Circle(color: "blue")
    }
    let item = createDrawable()
    
    // In array
    let drawables: [Drawable] = [Circle(color: "red"), Circle(color: "green")]
    drawables.forEach { $0.draw() }
    
    // In dictionary
    let drawableMap: [String: Drawable] = ["primary": Circle(color: "red")]
    drawableMap["primary"]?.draw()
    
    // In optional
    var optDrawable: Drawable? = Circle(color: "yellow")
    optDrawable?.draw()
    
    // In typealias
    typealias Shape = Drawable
    let shape: Shape = Circle(color: "purple")
    
    // Protocol conformance
    let conformingTypes: [Drawable.Type] = [Circle.self]
}