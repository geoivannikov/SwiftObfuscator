struct ObfStruct1 {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func distance(to other: ObfStruct1) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        return sqrt(dx * dx + dy * dy)
    }
    
    mutating func move(by offset: ObfStruct1) {
        x += offset.x
        y += offset.y
    }
}