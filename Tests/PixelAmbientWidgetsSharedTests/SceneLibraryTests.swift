import XCTest
@testable import PixelAmbientWidgetsShared

final class SceneLibraryTests: XCTestCase {
    func testLonelyNightWaterPlaybackOrderMatchesSpec() {
        let order = SceneLibrary.lonelyNightWater.frameSequence.playbackOrder
        XCTAssertEqual(order, ["frame_01", "frame_05", "frame_09", "frame_13", "frame_17", "frame_09", "frame_05"])
    }

    func testTimelineBuilderUsesDefaultDuration() {
        let start = Date(timeIntervalSince1970: 0)
        let entries = WidgetTimelineBuilder.entries(for: SceneLibrary.lonelyNightWater, startDate: start, cycles: 1)

        XCTAssertEqual(entries.count, 7)
        XCTAssertEqual(entries[1].date.timeIntervalSince1970, 1.8, accuracy: 0.0001)
        XCTAssertEqual(entries[6].frameName, "frame_05")
    }
}
