import Foundation

public final class DIContainer: DIResolver {
    private var registrations: [String: DIServiceInstanceRetrieving] = [:]

    @discardableResult
    public func register<T: Any>(_ type: T.Type, factory: @escaping (DIResolver) -> T) -> DIService<T> {
        let service = DIService(factory: factory)
        service.container = self
        registrations[String(describing: type)] = service
        return service
    }

    public func resolve<T: Any>(_ type: T.Type) -> T {
        guard
            let service = registrations[String(describing: type)],
            let instance = service.getInstance() as? T
        else {
            fatalError("Failed to resolve type '\(type)'")
        }
        return instance
    }
}
