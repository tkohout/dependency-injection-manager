import FeatureApi
import Foundation
import Log

public final class FeatureRepositoryImpl: FeatureRepository {
    private let stringStore: any StringStore
    private let dateStore: any DateStore
    private let logger: Logging
    public init(
        stringStore: any StringStore,
        dateStore: any DateStore,
        logger: Logging
    ) {
        self.stringStore = stringStore
        self.dateStore = dateStore
        self.logger = logger
    }

    public func fetchString() -> String? {
        logger.log(message: "Did call fetchString")
        return stringStore.get()
    }

    public func fetchDate() -> Date? {
        logger.log(message: "Did call fetchDate")
        return dateStore.get()
    }
}
