import FeatureApi
import Foundation

final class OtherRepositoryImpl: OtherRepository {
    private let stringStore: any StringStore
    private let dateStore: any DateStore

    public init(
        stringStore: any StringStore,
        dateStore: any DateStore
    ) {
        self.stringStore = stringStore
        self.dateStore = dateStore
    }
}
