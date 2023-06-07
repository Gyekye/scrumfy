import SwiftUI


struct ThemePicker: View {
    // Internal state dependencies
    @Binding var selection: Theme
    
    // UI
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeCard(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.lavender))
    }
}
