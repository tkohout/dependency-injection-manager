import Foundation

public protocol FeatureRepository {
    func fetchString() -> String?
    func fetchDate() -> Date?
}
