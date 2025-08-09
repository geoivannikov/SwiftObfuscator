protocol ObfProtocol1 {
    func draw()
    var color: String { get }
}

extension ObfProtocol1 {
    func defaultDraw() {
        print("Drawing with color: \(color)")
    }
}