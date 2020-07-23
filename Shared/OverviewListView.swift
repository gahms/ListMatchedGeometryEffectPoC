import SwiftUI

struct OverviewListView: View {
    var lines: [ItemLineModel]
    @Binding var selectedLine: ItemLineModel?
    var lineAnimation: Namespace.ID
    
    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(lines) { line in
                OverviewCellView(line: line,
                                 selectedLine: $selectedLine,
                                 lineAnimation: lineAnimation)
            }
        }
    }
}

struct OverviewListView_Previews: PreviewProvider {
    static var previewData: [ItemLineModel] = [
        ItemLineModel(id: "1", items: [
            ItemModel(Icons.doc_text, "First", .blue),
            ItemModel(Icons.doc_text, "Second", .blue),
            ItemModel(Icons.doc_text, "Third", .green),
            ItemModel(Icons.doc_text, "Fourth", .orange),
        ]),
        ItemLineModel(id: "2", items: [
            ItemModel(Icons.doc_text, "Fem", .blue),
            ItemModel(Icons.doc_text, "Seks", .blue),
            ItemModel(Icons.doc_text, "Syv", .blue),
        ]),
        ItemLineModel(id: "3", items: [
            ItemModel(Icons.doc_text, "Madrid", .blue),
            ItemModel(Icons.doc_text, "Barcelona", .blue),
        ]),
    ]
    @Namespace static var previewAnimation
    
    static var previews: some View {
        OverviewListView(lines: previewData, selectedLine: .constant(nil),
                         lineAnimation: previewAnimation)
    }
}
