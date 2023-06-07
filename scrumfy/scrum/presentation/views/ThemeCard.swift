import SwiftUI


struct ThemeCard: View {
    // External dependencies
    let theme: Theme
    
    // UI
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct ThemeCard_Previews: PreviewProvider {
    static var previews: some View {
        ThemeCard(theme: .navy)
    }
}
