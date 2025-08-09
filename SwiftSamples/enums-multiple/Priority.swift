enum Priority {
    case low
    case medium
    case high
    case critical
    
    var weight: Int {
        switch self {
        case .low:
            return 1
        case .medium:
            return 2
        case .high:
            return 3
        case .critical:
            return 4
        }
    }
    
    static let defaultPriority: Priority = .medium
}