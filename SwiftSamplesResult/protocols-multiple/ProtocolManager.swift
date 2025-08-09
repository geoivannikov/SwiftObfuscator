func runProtocolManager() {
    // Multiple protocol ObfProtocol3
    let user = ObfStruct1(id: "123", name: "John")
    
    // As protocol ObfProtocol4
    let identifiable: ObfProtocol2 = user
    let cacheable: ObfProtocol1 = user
    
    // Arrays of protocols
    let identifiables: [ObfProtocol2] = [user]
    let cacheables: [ObfProtocol1] = [user]
    
    // Dictionary with protocols
    let protocolMap: [String: ObfProtocol2] = ["user1": user]
    let cacheMap: [String: ObfProtocol1] = ["user1": user]
    
    // Optional protocols
    var optIdentifiable: ObfProtocol2? = user
    var optCacheable: ObfProtocol1? = user
    
    // Functions with protocols
    func processIdentifiable(_ item: ObfProtocol2) {
        print("Processing ID: \(item.id)")
    }
    
    func processCacheable(_ item: ObfProtocol1) {
        item.cache()
    }
    
    processIdentifiable(user)
    processCacheable(user)
    
    // Typealias with protocols
    typealias IDType = ObfProtocol2
    typealias CacheType = ObfProtocol1
    
    let idType: IDType = user
    let cacheType: CacheType = user
    
    // Extension usage
    user.defaultCache()
}