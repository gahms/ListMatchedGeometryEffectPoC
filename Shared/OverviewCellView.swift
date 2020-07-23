import SwiftUI

struct OverviewCellView: View {
    var line: ItemLineModel
    @Binding var selectedLine: ItemLineModel?
    var lineAnimation: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation {
                selectedLine = line
            }
        }
        label: {
            VStack(spacing: 0) {
                HStack {
                    ForEach(line.items) { item in
                        OverviewItemView(item: item, lineAnimation: lineAnimation)
                    }
                    Spacer()
                }
                .padding(8)
                Hairline()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct OverviewCellView_Previews: PreviewProvider {
    static var previewData: ItemLineModel = ItemLineModel(id: "2", items: [
        ItemModel(Icons.doc_text, "First", .blue),
        ItemModel(Icons.doc_text, "Second", .blue),
        ItemModel(Icons.doc_text, "Third", .blue),
        ItemModel(Icons.doc_text, "Fourth", .blue),
    ])
    @Namespace static var previewAnimation
    
    static var previews: some View {
        OverviewCellView(line: previewData, selectedLine: .constant(nil),
                         lineAnimation: previewAnimation)
            .previewLayout(.sizeThatFits)
    }
}

