import SwiftUI

struct ScrumDetail: View {
    
    // Internal state dependencies
    @State private var showEditScrumSheet = false
    @State private var editingScrum = Scrum.emptyScrum
    
    // External view dependencies
    @Binding var scrum: Scrum
    
    // UI
    var body: some View {
        List {
            Section("Meeting Info") {
                NavigationLink(destination: MeetingView(scrum: $scrum)){
                    Label("Start Meeting", systemImage: "timer")
                }
                .font(.headline)
                .foregroundColor(.accentColor)
                HStack {
                    Label("Duration", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.duration) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(6)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section("Attendees") {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                showEditScrumSheet = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $showEditScrumSheet) {
            NavigationStack {
                ScrumEdit(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                         ToolbarItem(placement: .cancellationAction) {
                             Button("Cancel") {
                                 showEditScrumSheet = false
                             }
                         }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                scrum = editingScrum
                                showEditScrumSheet = false
                        }
                    }
                }
            }
        }
    }
}

struct ScrumDetail_Previews: PreviewProvider {
    static var previews: some View {
        ScrumDetail(scrum: .constant(Scrum.mock[3]))
    }
}
