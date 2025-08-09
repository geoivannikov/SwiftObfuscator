func testStatus() {
    // Initialization
    let status1 = ObfEnum1.pending
    let status2 = ObfEnum1.failed(reason: "Network error")
    
    // As variable type
    var currentStatus: ObfEnum1 = ObfEnum1.running
    
    // As function parameter type
    func printStatus(_ status: ObfEnum1) {
        print(status.description)
    }
    printStatus(status1)
    
    // As function return type
    func getInitialStatus() -> ObfEnum1 {
        return ObfEnum1.pending
    }
    let initialStatus = getInitialStatus()
    
    // In array
    let statuses: [ObfEnum1] = [status1, status2, currentStatus]
    statuses.forEach { printStatus($0) }
    
    // In dictionary
    let statusMap: [String: ObfEnum1] = ["current": ObfEnum1.running, "previous": ObfEnum1.completed]
    statusMap["current"]?.description
    
    // In optional
    var optStatus: ObfEnum1? = ObfEnum1.pending
    optStatus = nil
    
    // In typealias
    typealias TaskStatus = ObfEnum1
    let taskStatus = TaskStatus.running
    
    // Static property
    let activeStates = ObfEnum1.allActiveStates
    
    // Switch statement
    switch currentStatus {
    case ObfEnum1.pending:
        print("Task is pending")
    case ObfEnum1.running:
        print("Task is running")
    case ObfEnum1.completed:
        print("Task completed")
    case ObfEnum1.failed(let reason):
        print("Task failed: \(reason)")
    }
    
    // Property access
    let isFinished = currentStatus.isFinished
}