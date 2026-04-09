import Foundation
import PixelAmbientWidgetsShared

final class SceneLibraryViewModel: ObservableObject {
    @Published private(set) var scenes: [Scene] = SceneLibrary.allScenes
    @Published var selectedSceneID: String

    private let store: SceneSelectionStoring

    init(store: SceneSelectionStoring) {
        self.store = store
        self.selectedSceneID = store.selectedSceneID()
    }

    var selectedScene: Scene? {
        scenes.first(where: { $0.id == selectedSceneID })
    }

    func select(scene: Scene) {
        selectedSceneID = scene.id
        store.setSelectedSceneID(scene.id)
    }
}
