import Foundation

extension DIContainer {

    @discardableResult
    public func register<each Dependency, Service: Any>(_ initializer: @escaping (repeat each Dependency) -> Service, as service: Service.Type) -> DIService<Service> {

        return register(service.self) { r in
            initializer(repeat (r.resolve((each Dependency).self)))
        }
    }
}
