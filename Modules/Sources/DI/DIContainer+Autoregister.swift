import Foundation

extension DIContainer {
    // This file can be generated by a script with N of dependencies

    @discardableResult
    public func register<T>(_ initializer: @escaping () -> T, as type: T.Type) -> DIService<T> {
        return register(type.self) { _ in
            initializer()
        }
    }

    @discardableResult
    public func register<T, A>(_ initializer: @escaping (A) -> T, as type: T.Type) -> DIService<T> {
        return register(type.self) { r in
            initializer(r.resolve(A.self))
        }
    }

    @discardableResult
    public func register<T, A, B>(_ initializer: @escaping (A, B) -> T, as type: T.Type) -> DIService<T> {
        return register(type.self) { r in
            initializer(r.resolve(A.self), r.resolve(B.self))
        }
    }

    @discardableResult
    public func register<T, A, B, C>(_ initializer: @escaping (A, B, C) -> T, as type: T.Type) -> DIService<T> {
        return register(type.self) { r in
            initializer(r.resolve(A.self), r.resolve(B.self), r.resolve(C.self))
        }
    }
}
