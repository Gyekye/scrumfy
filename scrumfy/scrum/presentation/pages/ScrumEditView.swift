import SwiftUI


struct ScrumEdit: View {
    
    // Internal state dependencies
    @Binding var scrum: Scrum
    @State private var attendeeName = ""
    
    // UI
    var body: some View {
        Form {
            Section("Meeting Info") {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.durationAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.duration) minutes")
                    Spacer()
                    Text("\(scrum.duration) minutes")
                        .accessibilityHidden(true)
                }
            }
            Section("Attendees") {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
                .onDelete { item in
                    scrum.attendees.remove(atOffsets: item)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation(.easeInOut) {
                            let attendee = Scrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add new attendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
                ThemePicker(selection: $scrum.theme)
            }
        }
    }
}

struct ScrumEditView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumEdit(scrum: .constant(Scrum.mock[3]))
    }
}
