import SwiftUI

struct ItemModel: Identifiable {
    var id: UUID
    var icon: Image
    var text: String
}

extension ItemModel {
    init(_ icon: Image, _ text: String) {
        id = UUID()
        self.icon = icon
        self.text = text
    }
}
