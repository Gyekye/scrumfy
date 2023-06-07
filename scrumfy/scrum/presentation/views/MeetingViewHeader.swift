import SwiftUI


struct MeetingViewHeader: View {
    
    // External dependencies
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
    
    // Computed properties
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    // UI
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(theme.accentColor)
                .background(theme.mainColor)
                
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("\(minutesRemaining) minutes")
            .padding([.top, .horizontal])
        }
    }
}

struct MeetingViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        MeetingViewHeader(
            secondsElapsed: 200,
            secondsRemaining: 190,
            theme: .bubblegum
        )
        .previewLayout(.sizeThatFits)
    }
}
