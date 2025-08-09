func testTypealiases() {
    // Basic usage
    let userId: UserID = "user123"
    let timestamp: Timestamp = 1234567890.0
    let point: Coordinate = Point(x: 10.0, y: 20.0)
    
    // In function calls
    processUser(id: userId, at: timestamp)
    let newPoint = createPoint(coord: point)
    
    // As array type
    let userIds: [UserID] = ["user1", "user2", "user3"]
    let timestamps: [Timestamp] = [123.0, 456.0, 789.0]
    let coordinates: [Coordinate] = [point, newPoint]
    
    // As dictionary type
    let userMap: [UserID: Timestamp] = ["user1": 123.0, "user2": 456.0]
    let pointMap: [String: Coordinate] = ["origin": Point(x: 0, y: 0)]
    
    // Optional types
    var optUserId: UserID? = "optional_user"
    var optCoordinate: Coordinate? = Point(x: 5, y: 5)
    
    // Completion handler
    let handler: CompletionHandler = { success in
        print("Completed with success: \(success)")
    }
    handleCompletion(handler: handler)
    
    // Nested typealias usage
    typealias NestedAlias = UserID
    let nested: NestedAlias = "nested_user"
}