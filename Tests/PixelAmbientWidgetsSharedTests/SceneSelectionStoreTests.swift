import XCTest
@testable import PixelAmbientWidgetsShared

final class SceneSelectionStoreTests: XCTestCase {
    func testSelectedScenePersists() {
        let suiteName = "test.pixelambientwidgets.\(UUID().uuidString)"
        let defaults = UserDefaults(suiteName: suiteName)!
        let store = SceneSelectionStore(userDefaults: defaults)

        XCTAssertEqual(store.selectedSceneID(), SceneLibrary.lonelyNightWater.id)

        store.setSelectedSceneID("lonely_night_water")
        XCTAssertEqual(store.selectedSceneID(), "lonely_night_water")

        defaults.removePersistentDomain(forName: suiteName)
    }
}
