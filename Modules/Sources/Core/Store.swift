import Foundation

public protocol Store<StorableObject> {
    associatedtype StorableObject

    func set(data: StorableObject?)
    func get() -> StorableObject?
    func clear()
}
