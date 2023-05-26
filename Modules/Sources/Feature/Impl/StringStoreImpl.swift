import Foundation
import FeatureApi

final class StringStoreImpl: StringStore {
    private var storedString: String?

    func set(data: String?) {
        storedString = data
    }

    func get() -> String? {
        return storedString
    }

    func clear() {
        storedString = nil
    }
}
