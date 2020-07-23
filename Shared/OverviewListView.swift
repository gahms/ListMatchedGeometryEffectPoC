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
            ItemModel(Icons.doc_text, "First"),
            ItemModel(Icons.doc_text, "Second"),
            ItemModel(Icons.doc_text, "Third"),
            ItemModel(Icons.doc_text, "Fourth"),
        ]),
        ItemLineModel(id: "2", items: [
            ItemModel(Icons.doc_text, "Fem"),
            ItemModel(Icons.doc_text, "Seks"),
            ItemModel(Icons.doc_text, "Syv"),
        ]),
        ItemLineModel(id: "3", items: [
            ItemModel(Icons.doc_text, "Madrid"),
            ItemModel(Icons.doc_text, "Barcelona"),
        ]),
    ]
    @Namespace static var previewAnimation
    
    static var previews: some View {
        OverviewListView(lines: previewData, selectedLine: .constant(nil),
                         lineAnimation: previewAnimation)
    }
}
