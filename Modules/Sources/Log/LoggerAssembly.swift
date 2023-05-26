import Foundation
import DI

public final class LoggerAssembly: DIAssembly {
    public init() {}
    
    public func assemble(container: DIContainer) {
        container.register(Logging.self) { _ in
            return Logger()
        }

        container.register(LoggerCreating.self) { _ in
            return LoggerFactory()
        }
    }
}
