import Foundation

public protocol LoggerCreating {
    func make(name: String) -> Logging
}

public final class LoggerFactory: LoggerCreating {
    public func make(name: String) -> Logging {
        return Logger(name: name)
    }
}
