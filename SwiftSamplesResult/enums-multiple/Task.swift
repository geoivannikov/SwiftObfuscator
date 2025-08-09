struct ObfStruct1 {
    var title: String
    var priority: ObfEnum1
    var state: ObfEnum2
    
    init(title: String, priority: ObfEnum1 = ObfEnum1.medium) {
        self.title = title
        self.priority = priority
        self.state = ObfEnum2.todo
    }
    
    mutating func assignTo(_ person: String) {
        state = ObfEnum2.inProgress(assignee: person)
    }
    
    mutating func sendForReview(to reviewer: String) {
        state = ObfEnum2.review(reviewer: reviewer)
    }
    
    mutating func complete() {
        state = ObfEnum2.done
    }
    
    func getInfo() -> String {
        return "\(title) - ObfEnum1: \(priority.weight), State: \(state.description)"
    }
}