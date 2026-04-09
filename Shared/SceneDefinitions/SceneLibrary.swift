import Foundation

public enum SceneLibrary {
    public static let lonelyNightWater = Scene(
        id: "lonely_night_water",
        displayName: "Lonely Night Water",
        previewImageName: "lonely_night_water_preview",
        frameSequence: SceneFrameSequence(
            allFrames: ["frame_01", "frame_05", "frame_09", "frame_13", "frame_17"],
            playbackOrder: ["frame_01", "frame_05", "frame_09", "frame_13", "frame_17", "frame_09", "frame_05"],
            defaultFrameDuration: 1.8,
            animationStyle: .pingPong
        ),
        isPremium: false,
        tags: ["calm", "night", "water", "monochrome", "lofi"],
        category: .ambientNight
    )

    public static let allScenes: [Scene] = [
        lonelyNightWater
    ]

    public static func scene(withId id: String) -> Scene? {
        allScenes.first(where: { $0.id == id })
    }
}
