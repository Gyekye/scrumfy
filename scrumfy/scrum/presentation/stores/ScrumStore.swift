import Foundation


class ScrumStore: ObservableObject {
    @Published var scrums: [Scrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        .appending(component: "scrums.data")
    }
    
    
    func load() async throws {
        let task = Task<[Scrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let scrums = try JSONDecoder().decode([Scrum].self, from: data)
            return scrums
        }
        
        let result = try await task.value
        self.scrums = result
    }
    
    func save(scrums: [Scrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
