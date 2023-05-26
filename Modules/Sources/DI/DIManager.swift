import Foundation

final public class DIManager {
    private static let container: DIContainer = DIContainer()

    public static func assemble(assemblies: [DIAssembly]) {
        for assembly in assemblies {
            assembly.assemble(container: container)
        }
    }

    @discardableResult
    public static func register<T: Any>(_ type: T.Type, factory: @escaping (DIResolver) -> T) -> DIService<T> {
        return container.register(type, factory: factory)
    }

    public static func resolve<T: Any>(_ type: T.Type) -> T {
        return container.resolve(type)
    }
}
