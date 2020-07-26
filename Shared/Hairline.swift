import SwiftUI

struct Hairline: View {
    var body: some View {
        Color.gray
            .frame(height: CGFloat(1.0) / ScreenHelper.scaleFactorMainScreen)
    }
}

public class ScreenHelper {
    public static var scaleFactorMainScreen: CGFloat {
        #if os(macOS)
        guard let scale = NSScreen.main?.backingScaleFactor else { return CGFloat(1.0)}
        return scale
        #else
        return UIScreen.main.scale
        #endif
    }
}

struct Hairline_Previews: PreviewProvider {
    static var previews: some View {
        Hairline()
    }
}
