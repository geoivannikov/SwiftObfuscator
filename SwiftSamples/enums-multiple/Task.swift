struct Task {
    var title: String
    var priority: Priority
    var state: TaskState
    
    init(title: String, priority: Priority = Priority.medium) {
        self.title = title
        self.priority = priority
        self.state = TaskState.todo
    }
    
    mutating func assignTo(_ person: String) {
        state = TaskState.inProgress(assignee: person)
    }
    
    mutating func sendForReview(to reviewer: String) {
        state = TaskState.review(reviewer: reviewer)
    }
    
    mutating func complete() {
        state = TaskState.done
    }
    
    func getInfo() -> String {
        return "\(title) - Priority: \(priority.weight), State: \(state.description)"
    }
}