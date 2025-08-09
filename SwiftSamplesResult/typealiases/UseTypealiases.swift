func testTypealiases() {
    // Basic ObfAlias5
    let userId: ObfAlias1 = "user123"
    let timestamp: ObfAlias2 = 1234567890.0
    let point: ObfAlias3 = ObfStruct1(x: 10.0, y: 20.0)
    
    // In function calls
    processUser(id: userId, at: timestamp)
    let newPoint = createPoint(coord: point)
    
    // As array type
    let userIds: [ObfAlias1] = ["user1", "user2", "user3"]
    let timestamps: [ObfAlias2] = [123.0, 456.0, 789.0]
    let coordinates: [ObfAlias3] = [point, newPoint]
    
    // As dictionary type
    let userMap: [ObfAlias1: ObfAlias2] = ["user1": 123.0, "user2": 456.0]
    let pointMap: [String: ObfAlias3] = ["origin": ObfStruct1(x: 0, y: 0)]
    
    // Optional types
    var optUserId: ObfAlias1? = "optional_user"
    var optCoordinate: ObfAlias3? = ObfStruct1(x: 5, y: 5)
    
    // Completion handler
    let handler: ObfAlias4 = { success in
        print("Completed with success: \(success)")
    }
    handleCompletion(handler: handler)
    
    // Nested typealias ObfAlias5
    typealias ObfAlias6 = ObfAlias1
    let nested: ObfAlias6 = "nested_user"
}