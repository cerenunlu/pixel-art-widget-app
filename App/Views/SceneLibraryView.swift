import SwiftUI
import PixelAmbientWidgetsShared

struct SceneLibraryView: View {
    @ObservedObject var viewModel: SceneLibraryViewModel

    private let columns = [GridItem(.adaptive(minimum: 160), spacing: 16)]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Pixel Ambient Widgets")
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.horizontal)

                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.scenes) { scene in
                                NavigationLink {
                                    SceneDetailView(scene: scene, isSelected: scene.id == viewModel.selectedSceneID) {
                                        viewModel.select(scene: scene)
                                    }
                                } label: {
                                    SceneCardView(scene: scene, isSelected: scene.id == viewModel.selectedSceneID)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .toolbar {
                NavigationLink("Settings") {
                    SettingsPlaceholderView()
                }
                .tint(.white)
            }
        }
    }
}

private struct SceneCardView: View {
    let scene: Scene
    let isSelected: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.sRGB, white: 0.12, opacity: 1.0))
                .overlay(
                    VStack(alignment: .leading, spacing: 10) {
                        Image(scene.previewImageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 140)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                        Text(scene.displayName)
                            .font(.system(.headline, design: .rounded))
                            .foregroundStyle(.white)
                            .lineLimit(1)
                    }
                    .padding(12)
                )

            if isSelected {
                Label("Selected", systemImage: "checkmark.circle.fill")
                    .font(.caption2.bold())
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .padding(10)
            }
        }
        .frame(height: 220)
    }
}
