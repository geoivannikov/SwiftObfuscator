struct ObfStruct1: ObfProtocol2, ObfProtocol1 {
    var id: String
    var name: String
    
    func cache() {
        print("Caching user: \(name)")
    }
    
    func invalidate() {
        print("Invalidating user cache")
    }
}
