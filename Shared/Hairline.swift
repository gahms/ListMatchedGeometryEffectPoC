import SwiftUI

struct Hairline: View {
    var body: some View {
        Color.gray
            .frame(height: CGFloat(1.0) / UIScreen.main.scale)
    }
}

struct Hairline_Previews: PreviewProvider {
    static var previews: some View {
        Hairline()
    }
}
