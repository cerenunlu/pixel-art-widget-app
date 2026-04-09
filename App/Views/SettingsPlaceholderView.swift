import SwiftUI

struct SettingsPlaceholderView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 16) {
                Text("Settings")
                    .font(.system(.title2, design: .rounded, weight: .semibold))
                    .foregroundStyle(.white)

                Text("Future packs, premium upgrades, and personalization controls will appear here.")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
    }
}
