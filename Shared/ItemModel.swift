import SwiftUI

struct ItemModel: Identifiable {
    var id: UUID
    var icon: Image
    var text: String
    var color: Color
}

extension ItemModel {
    init(_ icon: Image, _ text: String, _ color: Color) {
        id = UUID()
        self.icon = icon
        self.text = text
        self.color = color
    }
}
