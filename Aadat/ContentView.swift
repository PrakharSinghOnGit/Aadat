import SwiftUI

struct ContentView: View {
    // @State acts just like useState in React. It tells the UI to update when this changes.
    @State private var habitCount = 0
    
    var body: some View {
        VStack(spacing: 40) {
            
            // Header
            VStack(spacing: 8) {
                Text("Gandi Aadat")
                    .font(.system(size: 56, weight: .heavy, design: .rounded))
                
                Text("Daily Goal Tracker")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            // The Counter Display
            Text("\(habitCount)")
                .font(.system(size: 80, weight: .bold, design: .rounded))
                .foregroundColor(.blue)
                .frame(width: 200, height: 200)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            
            // The Action Button
            Button(action: {
                // Haptic feedback for a native feel
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                habitCount += 1
            }) {
                Text("Log Activity")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 250)
                    .background(Color.blue)
                    .cornerRadius(16)
                    // Adds a subtle shadow
                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            
            // Reset Button
            Button(action: {
                habitCount = 0
            }) {
                Text("Reset")
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
