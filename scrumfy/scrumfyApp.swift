import SwiftUI

// Entry point of application
@main
struct scrumfyApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            Scrums(scrums: $store.scrums, saveAction: {
                Task {
                       do {
                        try await store.save(scrums: store.scrums)
                       } catch {
                           errorWrapper = ErrorWrapper(
                                error: error,
                                guidance: "\(error.localizedDescription)"
                           )
                       }
                    }
                } )
                .task {
                    do {
                        try await store.load()
                    } catch {
                            errorWrapper = ErrorWrapper(
                                error: error,
                                guidance: "\(error.localizedDescription)")
                    }
                }
                .sheet(item: $errorWrapper) {
                    store.scrums = Scrum.mock
                } content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
