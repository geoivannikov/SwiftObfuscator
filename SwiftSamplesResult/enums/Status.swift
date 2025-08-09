enum ObfEnum1 {
    case pending
    case running
    case completed
    case failed(reason: String)
    
    var description: String {
        switch self {
        case .pending:
            return "Pending"
        case .running:
            return "Running"
        case .completed:
            return "Completed"
        case .failed(let reason):
            return "Failed: \(reason)"
        }
    }
    
    static let allActiveStates: [ObfEnum1] = [.pending, .running]
    
    var isFinished: Bool {
        switch self {
        case .completed, .failed:
            return true
        default:
            return false
        }
    }
}