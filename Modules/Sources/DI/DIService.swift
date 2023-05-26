import Foundation

protocol DIServiceInstanceRetrieving {
    func getInstance() -> Any
}

public final class DIService<T: Any>: DIServiceInstanceRetrieving {
    private let factory: (DIContainer) -> T
    private var scope: DIServiceScope
    private var instance: T?

    weak var container: DIContainer?

    init(factory: @escaping (DIContainer) -> T) {
        self.factory = factory
        self.scope = .standard
    }

    func getInstance() -> Any {
        guard let container else {
            fatalError("DIService: No reference to container")
        }

        switch scope {
        case .standard:
            return factory(container)
        case .singleton:
            if let existingInstance = instance {
                return existingInstance
            }

            let newInstance = factory(container)
            instance = newInstance
            return newInstance
        }
    }

    public func singleton() {
        scope = .singleton
    }
}
