import SwiftUI

// Entry point of application
@main
struct scrumfyApp: App {
    @State private var scrums = Scrum.mock
    
    var body: some Scene {
        WindowGroup {
            Scrums(scrums: $scrums )
        }
    }
}
