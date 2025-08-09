struct User: Identifiable, Cacheable {
    var id: String
    var name: String
    
    func cache() {
        print("Caching user: \(name)")
    }
    
    func invalidate() {
        print("Invalidating user cache")
    }
}
