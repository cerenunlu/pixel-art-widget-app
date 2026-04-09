import SwiftUI
import WidgetKit
import PixelAmbientWidgetsShared

struct PixelAmbientTimelineEntry: TimelineEntry {
    let date: Date
    let frameName: String
}

struct PixelAmbientTimelineProvider: TimelineProvider {
    private let selectionStore = SceneSelectionStore()

    func placeholder(in context: Context) -> PixelAmbientTimelineEntry {
        PixelAmbientTimelineEntry(date: .now, frameName: SceneLibrary.lonelyNightWater.frameSequence.playbackOrder[0])
    }

    func getSnapshot(in context: Context, completion: @escaping (PixelAmbientTimelineEntry) -> Void) {
        completion(placeholder(in: context))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<PixelAmbientTimelineEntry>) -> Void) {
        let sceneID = selectionStore.selectedSceneID()
        let scene = SceneLibrary.scene(withId: sceneID) ?? SceneLibrary.lonelyNightWater

        let entries = WidgetTimelineBuilder.entries(for: scene, startDate: .now, cycles: 4)
            .map { PixelAmbientTimelineEntry(date: $0.date, frameName: $0.frameName) }

        let nextRefresh = entries.last?.date.addingTimeInterval(scene.frameSequence.defaultFrameDuration) ?? .now.addingTimeInterval(60)
        completion(Timeline(entries: entries, policy: .after(nextRefresh)))
    }
}

struct PixelAmbientWidgetEntryView: View {
    var entry: PixelAmbientTimelineProvider.Entry

    var body: some View {
        ZStack {
            Color.black
            Image(entry.frameName)
                .resizable()
                .scaledToFill()
                .clipped()
        }
    }
}

struct PixelAmbientWidget: Widget {
    let kind: String = "PixelAmbientWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: PixelAmbientTimelineProvider()) { entry in
            PixelAmbientWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Pixel Ambient")
        .description("Calm pixel-art ambient animation.")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabled()
    }
}

#Preview(as: .systemSmall) {
    PixelAmbientWidget()
} timeline: {
    PixelAmbientTimelineEntry(date: .now, frameName: "frame_01")
    PixelAmbientTimelineEntry(date: .now.addingTimeInterval(1.8), frameName: "frame_05")
}
