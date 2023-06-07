import SwiftUI


struct MeetingViewFooter: View {
    
    // External dependencies
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    
    // Computed Properties
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    // UI
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .tint(.green)
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal], 2)
    }
}

struct MeetingViewFooter_Previews: PreviewProvider {
    static var previews: some View {
        MeetingViewFooter(
            speakers: Scrum.mock[0].attendees.speakers,
            skipAction: {})
        .previewLayout(.sizeThatFits)
    }
}
