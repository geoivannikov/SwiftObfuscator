enum SampleEnum {
    case started
    case inProgress
    case finished

    func status() -> String {
        switch self {
        case .started: return "Started"
        case .inProgress: return "In Progress"
        case .finished: return "Finished"
        }
    }
}
