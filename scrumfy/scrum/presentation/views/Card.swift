import SwiftUI


struct ScrumCard: View {
    // External view dependencies
    let scrum: Scrum
    
    // UI
    var body: some View {
        VStack(alignment: .leading){
            Text(scrum.title)
                .font(.title3)
                .accessibilityAddTraits(.isHeader)
            HStack{
                Label(String(scrum.attendees.count), systemImage: "person.3.fill")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label(String(scrum.duration), systemImage: "clock.badge.fill")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.duration) minute meeting")
            }
            .padding([.top], 2)
            .font(.headline)
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Scrum Card")
        .foregroundColor(scrum.theme.accentColor)
        
    }
}

struct ScrumCard_Previews: PreviewProvider {
    static var scrum = Scrum.mock[0]
    static var previews: some View {
        ScrumCard(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: .infinity, height: 60))
    }
}
