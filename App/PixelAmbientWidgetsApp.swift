import SwiftUI
import PixelAmbientWidgetsShared

@main
struct PixelAmbientWidgetsApp: App {
    @StateObject private var viewModel = SceneLibraryViewModel(store: SceneSelectionStore())

    var body: some Scene {
        WindowGroup {
            SceneLibraryView(viewModel: viewModel)
                .preferredColorScheme(.dark)
        }
    }
}
