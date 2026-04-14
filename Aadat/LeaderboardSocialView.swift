import SwiftUI

struct LeaderboardSocialView: View {
    private let eloScore = AppContents.Leaderboard.eloScore

    private var unlockedStyles: [String] {
        AppContents.Leaderboard.allLineStyles.filter { style in
            let threshold = AppContents.Leaderboard.unlockThresholds[style, default: Int.max]
            return eloScore >= threshold
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Progression") {
                    HStack {
                        Text("Current ELO")
                        Spacer()
                        Text("\(eloScore)")
                            .fontWeight(.semibold)
                    }

                    Text("ELO updates from your daily completion formula and drives unlock progression.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                Section("Line Style Unlocks") {
                    ForEach(AppContents.Leaderboard.allLineStyles, id: \.self) { style in
                        HStack {
                            Text(style)
                            Spacer()
                            if unlockedStyles.contains(style) {
                                Text("Unlocked")
                                    .font(.caption)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.green.opacity(0.15))
                                    .clipShape(Capsule())
                            } else {
                                Text("Locked")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Leaderboard & Social")
        }
    }
}

#Preview {
    LeaderboardSocialView()
}
