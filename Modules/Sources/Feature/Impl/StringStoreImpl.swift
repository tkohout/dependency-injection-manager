import Foundation
import FeatureApi

public final class StringStoreImpl: StringStore {
    private var storedString: String?

    public init() {}

    public func set(data: String?) {
        storedString = data
    }

    public func get() -> String? {
        return storedString
    }

    public func clear() {
        storedString = nil
    }
}
