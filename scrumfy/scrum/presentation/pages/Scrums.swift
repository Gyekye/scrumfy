import SwiftUI


struct Scrums: View {
    // External dependencies
    @Binding var scrums: [Scrum]
    
    // Internal dependencies
    @State private var isPresentingNewScrumView = false
    
    // UI
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: ScrumDetail(scrum: $scrum)) {
                    ScrumCard(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Create New Scrum")
                .sheet(isPresented: $isPresentingNewScrumView) {
                    ScrumCreate(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
                }
            }
        }
    }
}

struct Scrums_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Scrums(scrums: .constant(Scrum.mock))
        }
    }
}
