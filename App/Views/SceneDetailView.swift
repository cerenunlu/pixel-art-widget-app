import SwiftUI
import PixelAmbientWidgetsShared

struct SceneDetailView: View {
    let scene: Scene
    let isSelected: Bool
    let onUseForWidget: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Image(scene.previewImageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                Text(scene.displayName)
                    .font(.system(.title2, design: .rounded, weight: .semibold))
                    .foregroundStyle(.white)

                Text(scene.tags.joined(separator: " • "))
                    .font(.footnote)
                    .foregroundStyle(.gray)

                Button(action: onUseForWidget) {
                    HStack {
                        Spacer()
                        Text(isSelected ? "Active in Widget" : "Use for Widget")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                    .background(isSelected ? Color.gray.opacity(0.35) : Color.white)
                    .foregroundStyle(isSelected ? .white : .black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .disabled(isSelected)

                Spacer()
            }
            .padding()
        }
    }
}
