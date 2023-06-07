import Foundation


/// Model for a scrum
struct Scrum: Identifiable {
    /// Id of Scrum
    let id: UUID
    /// Title of scrum
    var title: String
    
    /// Attendees of the scrum
    var attendees: [Attendee]
    
    /// Duration of the scrum ( in minutes )
    var duration: Int
    
    ///  Scrum duration as double from slider
    var durationAsDouble: Double {
        get {
            Double(duration)
        }
        set {
            duration = Int(newValue)
        }
    }
    
    /// Color theme of scrum
    var theme: Theme
    
    
    /// Populate the id field on init
    init(id: UUID = UUID(), title: String, attendees: [String], duration: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0)}
        self.duration = duration
        self.theme = theme
    }
}

/// Extension to model an attendee entity into Scrum
extension Scrum {
    struct Attendee: Identifiable {
        /// Attendee Id
        let id: UUID
        
        /// Name of attendee
        var name: String
        
        
        /// Populate the id field on init
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    /// Initial data of Scrum
    static var emptyScrum: Scrum {
        Scrum(title: "", attendees: [], duration: 5, theme: .navy)
     }
}

/// Extension to provide our previews with mock data
extension Scrum {
    static let mock: [Scrum] =
    [
        Scrum(
            title: "Design",
            attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
            duration: 10,
            theme: .oxblood
        ),
        Scrum(
            title: "App Dev",
            attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
            duration: 5,
            theme: .periwinkle
        ),
        Scrum(
            title: "Web Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
            duration: 5,
            theme: .seafoam
        ),
        Scrum(
            title: "Backend Dev",
            attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
            duration: 20,
            theme: .tan
        )
    ]
}
