import Foundation
import FeatureApi

public final class DateStoreImpl: DateStore {
    private var storedDate: Date?

    public init() {}

    public func set(data: Date?) {
        storedDate = data
    }

    public func get() -> Date? {
        return storedDate
    }

    public func clear() {
        storedDate = nil
    }
}
