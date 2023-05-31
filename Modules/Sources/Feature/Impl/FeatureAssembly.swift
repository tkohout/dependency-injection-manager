import DI
import FeatureApi
import Foundation
import Log

public final class FeatureAssembly: DIAssembly {
    public init() {}
    
    public func assemble(container: DIContainer) {
        container
            .register(StringStoreImpl.init, as: (any StringStore).self)
            .singleton()

        container
            .register(DateStoreImpl.init, as: (any DateStore).self)
            .singleton()

        container.register(FeatureRepository.self) { r in
            let loggerFactory = r.resolve(LoggerCreating.self)
            return FeatureRepositoryImpl(
                stringStore: r.resolve((any StringStore).self),
                dateStore: r.resolve((any DateStore).self),
                logger: loggerFactory.make(name: "FeatureRepository")
            )
        }

        container.register(OtherRepositoryImpl.init, as: OtherRepository.self)
    }
}
