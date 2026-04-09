import Foundation

public enum SceneCategory: String, Codable, CaseIterable, Sendable {
    case ambientNight
    case rainy
    case interior
    case seasonal
}

public enum WidgetAnimationStyle: String, Codable, Sendable {
    case pingPong
    case loop
}

public struct SceneFrameSequence: Codable, Equatable, Sendable {
    public let allFrames: [String]
    public let playbackOrder: [String]
    public let defaultFrameDuration: TimeInterval
    public let animationStyle: WidgetAnimationStyle

    public init(
        allFrames: [String],
        playbackOrder: [String],
        defaultFrameDuration: TimeInterval,
        animationStyle: WidgetAnimationStyle
    ) {
        self.allFrames = allFrames
        self.playbackOrder = playbackOrder
        self.defaultFrameDuration = defaultFrameDuration
        self.animationStyle = animationStyle
    }
}

public struct Scene: Identifiable, Codable, Equatable, Sendable {
    public let id: String
    public let displayName: String
    public let previewImageName: String
    public let frameSequence: SceneFrameSequence
    public let isPremium: Bool
    public let tags: [String]
    public let category: SceneCategory

    public init(
        id: String,
        displayName: String,
        previewImageName: String,
        frameSequence: SceneFrameSequence,
        isPremium: Bool,
        tags: [String],
        category: SceneCategory
    ) {
        self.id = id
        self.displayName = displayName
        self.previewImageName = previewImageName
        self.frameSequence = frameSequence
        self.isPremium = isPremium
        self.tags = tags
        self.category = category
    }
}

public enum AppTheme: String, Codable, Sendable {
    case midnight
}
