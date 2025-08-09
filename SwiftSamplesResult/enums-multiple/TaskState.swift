enum ObfEnum2 {
    case todo
    case inProgress(assignee: String)
    case review(reviewer: String)
    case done
    
    var description: String {
        switch self {
        case .todo:
            return "To Do"
        case .inProgress(let assignee):
            return "In Progress (assigned to \(assignee))"
        case .review(let reviewer):
            return "Under Review by \(reviewer)"
        case .done:
            return "Done"
        }
    }
    
    var isCompleted: Bool {
        switch self {
        case .done:
            return true
        default:
            return false
        }
    }
}