import Foundation

public protocol SceneSelectionStoring: Sendable {
    func selectedSceneID() -> String
    func setSelectedSceneID(_ id: String)
}

public final class SceneSelectionStore: SceneSelectionStoring, @unchecked Sendable {
    private let defaults: UserDefaults

    public init(userDefaults: UserDefaults? = UserDefaults(suiteName: AppGroupConfig.suiteName)) {
        self.defaults = userDefaults ?? .standard
    }

    public func selectedSceneID() -> String {
        defaults.string(forKey: AppGroupConfig.selectedSceneKey) ?? SceneLibrary.lonelyNightWater.id
    }

    public func setSelectedSceneID(_ id: String) {
        defaults.set(id, forKey: AppGroupConfig.selectedSceneKey)
    }
}
