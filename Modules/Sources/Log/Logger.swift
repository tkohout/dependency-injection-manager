import Foundation

public protocol Logging {
    func log(message: String)
}

public final class Logger: Logging {
    private let name: String
    public init(name: String = "Default") {
        self.name = name
    }

    public func log(message: String) {
        print("[\(name)] - \(message)")
    }
}
