import DI
import FeatureApi
import Foundation
import Log

public final class FeatureAssembly: DIAssembly {
    public init() {}
    
    public func assemble(container: DIContainer) {
        container.register((any StringStore).self) { _ in
            return StringStoreImpl()
        }.singleton()

        container.register((any DateStore).self) { _ in
            return DateStoreImpl()
        }.singleton()

        container.register(FeatureRepository.self) { r in
            let loggerFactory = r.resolve(LoggerCreating.self)
            return FeatureRepositoryImpl(
                stringStore: r(),
                dateStore: r(),
                logger: loggerFactory.make(name: "FeatureRepository")
            )
        }
    }
}
