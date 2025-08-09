protocol Drawable {
    func draw()
}

extension Point: Drawable {
    func draw() {
        print("Drawing point at (\(x), \(y))")
    }
}

extension Point {
    static let zero = Point(x: 0.0, y: 0.0)
    
    var magnitude: Double {
        return sqrt(x * x + y * y)
    }
}

func testPoint() {
    // Initialization
    let point1 = Point(x: 10.0, y: 20.0)
    var point2 = Point(x: 5.0, y: 15.0)

    // As variable type
    var anotherPoint: Point = Point(x: 0.0, y: 0.0)

    // As function parameter type
    func calculateDistance(_ p1: Point, _ p2: Point) -> Double {
        return p1.distance(to: p2)
    }
    let dist = calculateDistance(point1, point2)

    // As function return type
    func createOrigin() -> Point {
        return Point(x: 0.0, y: 0.0)
    }
    let origin = createOrigin()

    // In array
    let points: [Point] = [point1, point2, origin]
    points.forEach { print("Point: (\($0.x), \($0.y))") }

    // In dictionary
    let namedPoints: [String: Point] = ["start": point1, "end": point2]
    namedPoints["start"]?.distance(to: origin)

    // In optional
    var optPoint: Point? = Point(x: 1.0, y: 1.0)
    optPoint?.move(by: Point(x: 5.0, y: 5.0))

    // In typealias
    typealias Coordinate = Point
    let coord = Coordinate(x: 100.0, y: 200.0)
    coord.distance(to: origin)

    // Mutating methods
    point2.move(by: Point(x: 10.0, y: -5.0))
    
    // Extension usage
    let zeroPoint = Point.zero
    let mag = point1.magnitude
    point1.draw()
    
    // Protocol conformance
    let drawable: Drawable = point2
}