import SwiftUI


struct ContentView: View {
    
    // UI
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 20)
            HStack{
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            Circle()
                .strokeBorder(lineWidth: 20, antialiased: true)
            HStack{
                Text("Speaker 1 of 3")
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Next Speaker")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
