protocol Cacheable {
    func cache()
    func invalidate()
}

extension Cacheable {
    func defaultCache() {
        print("Caching data...")
    }
}