import SwiftUI


struct ScrumCreate: View {
    
    // Internal dependencies
    @State private var newScrum = Scrum.emptyScrum
    @Binding var scrums: [Scrum]
    
    // External dependencies
    @Binding var isPresentingNewScrumView: Bool
    
    // UI
    var body: some View {
        NavigationStack {
            ScrumEdit(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                    }
                }
            ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        scrums.append(newScrum)
                        isPresentingNewScrumView = false
                  }
                    .disabled(newScrum.title.isEmpty)
               }
            }
        }
    }
}

struct ScrumCreate_Previews: PreviewProvider {
    static var previews: some View {
        ScrumCreate(
            scrums: .constant(Scrum.mock),
            isPresentingNewScrumView: .constant(true)
        )
    }
}
