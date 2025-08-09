protocol ObfProtocol1 {
    func cache()
    func invalidate()
}

extension ObfProtocol1 {
    func defaultCache() {
        print("Caching data...")
    }
}