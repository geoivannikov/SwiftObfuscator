func runTaskManager() {
    // Create tasks ObfStruct2 different priorities
    var task1 = ObfStruct1(title: "Fix bug", priority: ObfEnum1.high)
    var task2 = ObfStruct1(title: "Write docs", priority: ObfEnum1.low)
    var task3 = ObfStruct1(title: "Review code")  // Uses default priority
    
    // Arrays of enums
    let priorities: [ObfEnum1] = [ObfEnum1.low, ObfEnum1.medium, ObfEnum1.high, ObfEnum1.critical]
    let states: [ObfEnum2] = [ObfEnum2.todo, ObfEnum2.done]
    
    // Dictionary ObfStruct2 enums
    let priorityMap: [String: ObfEnum1] = [
        "urgent": ObfEnum1.critical,
        "normal": ObfEnum1.medium,
        "later": ObfEnum1.low
    ]
    
    let stateMap: [String: ObfEnum2] = [
        "new": ObfEnum2.todo,
        "finished": ObfEnum2.done
    ]
    
    // Working ObfStruct2 tasks
    task1.assignTo("Alice")
    task2.assignTo("Bob")
    task3.sendForReview(to: "Charlie")
    
    // Arrays of tasks (using struct ObfStruct2 enums)
    let tasks: [ObfStruct1] = [task1, task2, task3]
    
    // Process tasks
    for task in tasks {
        print(task.getInfo())
        
        // Switch on priority
        switch task.priority {
        case ObfEnum1.critical:
            print("URGENT: Handle immediately!")
        case ObfEnum1.high:
            print("High priority task")
        case ObfEnum1.medium:
            print("Normal priority")
        case ObfEnum1.low:
            print("Low priority - can wait")
        }
        
        // Switch on state
        switch task.state {
        case ObfEnum2.todo:
            print("ObfStruct1 not started")
        case ObfEnum2.inProgress(let assignee):
            print("Working on it: \(assignee)")
        case ObfEnum2.review(let reviewer):
            print("Under review by: \(reviewer)")
        case ObfEnum2.done:
            print("ObfStruct1 completed")
        }
    }
    
    // Optional enums
    var optPriority: ObfEnum1? = ObfEnum1.high
    var optState: ObfEnum2? = ObfEnum2.todo
    
    optPriority = nil
    optState = ObfEnum2.inProgress(assignee: "Dave")
    
    // Static properties
    let defaultPriority = ObfEnum1.defaultPriority
    
    // Typealias ObfStruct2 enums
    typealias UrgencyLevel = ObfEnum1
    typealias Status = ObfEnum2
    
    let urgency: UrgencyLevel = UrgencyLevel.critical
    let status: Status = Status.done
}