import SwiftUI
import AVFoundation

struct MeetingView: View {
    // External state dependencies
    @Binding var scrum: Scrum
    @StateObject var scrumTimer = ScrumTimer()
    
    // Internal dependencies
    private var player: AVPlayer { AVPlayer.init() }
    
    // UI
    var body: some View {
        ZStack  {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingViewHeader(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaining: scrumTimer.secondsRemaining,
                    theme: scrum.theme
                )
                Circle()
                    .strokeBorder(lineWidth: 20, antialiased: true)
                MeetingViewFooter(
                    speakers: scrumTimer.speakers){
                    scrumTimer.skipSpeaker()
                }
            }
            .padding()
        }
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            scrumTimer.reset(lengthInMinutes:scrum.duration, attendees:scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            scrumTimer.startScrum()
        }
        .onDisappear{
            scrumTimer.stopScrum()
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(Scrum.mock[2]))
    }
}
