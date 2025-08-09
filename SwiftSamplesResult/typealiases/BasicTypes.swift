typealias ObfAlias1 = String
typealias ObfAlias2 = Double
typealias ObfAlias3 = ObfStruct1
typealias ObfAlias4 = (Bool) -> Void

struct ObfStruct1 {
    var x: Double
    var y: Double
}

func processUser(id: ObfAlias1, at time: ObfAlias2) {
    print("Processing user \(id) at \(time)")
}

func createPoint(coord: ObfAlias3) -> ObfAlias3 {
    return coord
}

func handleCompletion(handler: ObfAlias4) {
    handler(true)
}