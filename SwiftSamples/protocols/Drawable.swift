protocol Drawable {
    func draw()
    var color: String { get }
}

extension Drawable {
    func defaultDraw() {
        print("Drawing with color: \(color)")
    }
}