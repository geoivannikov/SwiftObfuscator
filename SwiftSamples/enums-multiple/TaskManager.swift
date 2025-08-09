func runTaskManager() {
    // Create tasks with different priorities
    var task1 = Task(title: "Fix bug", priority: Priority.high)
    var task2 = Task(title: "Write docs", priority: Priority.low)
    var task3 = Task(title: "Review code")  // Uses default priority
    
    // Arrays of enums
    let priorities: [Priority] = [Priority.low, Priority.medium, Priority.high, Priority.critical]
    let states: [TaskState] = [TaskState.todo, TaskState.done]
    
    // Dictionary with enums
    let priorityMap: [String: Priority] = [
        "urgent": Priority.critical,
        "normal": Priority.medium,
        "later": Priority.low
    ]
    
    let stateMap: [String: TaskState] = [
        "new": TaskState.todo,
        "finished": TaskState.done
    ]
    
    // Working with tasks
    task1.assignTo("Alice")
    task2.assignTo("Bob")
    task3.sendForReview(to: "Charlie")
    
    // Arrays of tasks (using struct with enums)
    let tasks: [Task] = [task1, task2, task3]
    
    // Process tasks
    for task in tasks {
        print(task.getInfo())
        
        // Switch on priority
        switch task.priority {
        case Priority.critical:
            print("URGENT: Handle immediately!")
        case Priority.high:
            print("High priority task")
        case Priority.medium:
            print("Normal priority")
        case Priority.low:
            print("Low priority - can wait")
        }
        
        // Switch on state
        switch task.state {
        case TaskState.todo:
            print("Task not started")
        case TaskState.inProgress(let assignee):
            print("Working on it: \(assignee)")
        case TaskState.review(let reviewer):
            print("Under review by: \(reviewer)")
        case TaskState.done:
            print("Task completed")
        }
    }
    
    // Optional enums
    var optPriority: Priority? = Priority.high
    var optState: TaskState? = TaskState.todo
    
    optPriority = nil
    optState = TaskState.inProgress(assignee: "Dave")
    
    // Static properties
    let defaultPriority = Priority.defaultPriority
    
    // Typealias with enums
    typealias UrgencyLevel = Priority
    typealias Status = TaskState
    
    let urgency: UrgencyLevel = UrgencyLevel.critical
    let status: Status = Status.done
}