import Foundation

public final class DIContainer: DIResolver {
    private var registrations: [String: DIServiceInstanceRetrieving] = [:]
    private var lock: NSRecursiveLock = NSRecursiveLock()

    @discardableResult
    public func register<T: Any>(_ type: T.Type, factory: @escaping (DIResolver) -> T) -> DIService<T> {
        let service = DIService(factory: factory)
        service.container = self
        registrations[String(describing: type)] = service
        return service
    }

    public func resolve<T: Any>(_ type: T.Type) -> T {
        guard let service = registrations[String(describing: type)] else {
            fatalError("Failed to resolve '\(type)'")
        }

        let needsSynchronization = !Thread.isMainThread && service.scope == .singleton
        if needsSynchronization {
            lock.lock()
        }
        guard let instance = service.getInstance() as? T else {
            fatalError("Failed to get instance for '\(type)'")
        }
        if needsSynchronization {
            lock.unlock()
        }
        return instance
    }

    public func callAsFunction<T>() -> T {
        return resolve(T.self)
    }
}
