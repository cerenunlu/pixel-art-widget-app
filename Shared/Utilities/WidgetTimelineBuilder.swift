import Foundation

public struct WidgetFrameEntry: Equatable, Sendable {
    public let date: Date
    public let sceneID: String
    public let frameName: String

    public init(date: Date, sceneID: String, frameName: String) {
        self.date = date
        self.sceneID = sceneID
        self.frameName = frameName
    }
}

public enum WidgetTimelineBuilder {
    public static func entries(
        for scene: Scene,
        startDate: Date = .now,
        cycles: Int = 3
    ) -> [WidgetFrameEntry] {
        let order = scene.frameSequence.playbackOrder
        guard !order.isEmpty, cycles > 0 else { return [] }

        var entries: [WidgetFrameEntry] = []
        entries.reserveCapacity(order.count * cycles)

        let duration = scene.frameSequence.defaultFrameDuration
        var date = startDate

        for _ in 0..<cycles {
            for frame in order {
                entries.append(WidgetFrameEntry(date: date, sceneID: scene.id, frameName: frame))
                date = date.addingTimeInterval(duration)
            }
        }

        return entries
    }
}
