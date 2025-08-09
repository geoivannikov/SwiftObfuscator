func testStatus() {
    // Initialization
    let status1 = Status.pending
    let status2 = Status.failed(reason: "Network error")
    
    // As variable type
    var currentStatus: Status = Status.running
    
    // As function parameter type
    func printStatus(_ status: Status) {
        print(status.description)
    }
    printStatus(status1)
    
    // As function return type
    func getInitialStatus() -> Status {
        return Status.pending
    }
    let initialStatus = getInitialStatus()
    
    // In array
    let statuses: [Status] = [status1, status2, currentStatus]
    statuses.forEach { printStatus($0) }
    
    // In dictionary
    let statusMap: [String: Status] = ["current": Status.running, "previous": Status.completed]
    statusMap["current"]?.description
    
    // In optional
    var optStatus: Status? = Status.pending
    optStatus = nil
    
    // In typealias
    typealias TaskStatus = Status
    let taskStatus = TaskStatus.running
    
    // Static property
    let activeStates = Status.allActiveStates
    
    // Switch statement
    switch currentStatus {
    case Status.pending:
        print("Task is pending")
    case Status.running:
        print("Task is running")
    case Status.completed:
        print("Task completed")
    case Status.failed(let reason):
        print("Task failed: \(reason)")
    }
    
    // Property access
    let isFinished = currentStatus.isFinished
}