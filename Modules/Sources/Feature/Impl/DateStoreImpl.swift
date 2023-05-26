import Foundation
import FeatureApi

final class DateStoreImpl: DateStore {
    private var storedDate: Date?

    func set(data: Date?) {
        storedDate = data
    }

    func get() -> Date? {
        return storedDate
    }

    func clear() {
        storedDate = nil
    }
}
