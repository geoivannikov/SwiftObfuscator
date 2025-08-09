func runProtocolManager() {
    // Multiple protocol conformance
    let user = User(id: "123", name: "John")
    
    // As protocol types
    let identifiable: Identifiable = user
    let cacheable: Cacheable = user
    
    // Arrays of protocols
    let identifiables: [Identifiable] = [user]
    let cacheables: [Cacheable] = [user]
    
    // Dictionary with protocols
    let protocolMap: [String: Identifiable] = ["user1": user]
    let cacheMap: [String: Cacheable] = ["user1": user]
    
    // Optional protocols
    var optIdentifiable: Identifiable? = user
    var optCacheable: Cacheable? = user
    
    // Functions with protocols
    func processIdentifiable(_ item: Identifiable) {
        print("Processing ID: \(item.id)")
    }
    
    func processCacheable(_ item: Cacheable) {
        item.cache()
    }
    
    processIdentifiable(user)
    processCacheable(user)
    
    // Typealias with protocols
    typealias IDType = Identifiable
    typealias CacheType = Cacheable
    
    let idType: IDType = user
    let cacheType: CacheType = user
    
    // Extension usage
    user.defaultCache()
}