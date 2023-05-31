import Foundation

public protocol DIResolver {
    func resolve<T: Any>(_ type: T.Type) -> T
    func callAsFunction<T: Any>() -> T
}
