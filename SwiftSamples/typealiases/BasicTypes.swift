typealias UserID = String
typealias Timestamp = Double
typealias Coordinate = Point
typealias CompletionHandler = (Bool) -> Void

struct Point {
    var x: Double
    var y: Double
}

func processUser(id: UserID, at time: Timestamp) {
    print("Processing user \(id) at \(time)")
}

func createPoint(coord: Coordinate) -> Coordinate {
    return coord
}

func handleCompletion(handler: CompletionHandler) {
    handler(true)
}