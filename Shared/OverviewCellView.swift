import SwiftUI

struct OverviewCellView: View {
    var line: ItemLineModel
    @Binding var selectedLine: ItemLineModel?
    var lineAnimation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                withAnimation {
                    selectedLine = line
                }
            }
            label: {
                HStack {
                    // The items needs to disappear when selected to make hero
                    // animation work. Otherwise SwiftUI will complain that multiple
                    // equal id's with isSource == true exists.
                    if selectedLine?.id == line.id {
                        OverviewItemView(item: ItemModel(Icons.doc_text, "Barcelona", .blue), lineAnimation: lineAnimation)
                            .hidden()
                    }
                    else {
                        ForEach(line.items) { item in
                            OverviewItemView(
                                item: item,
                                lineAnimation: lineAnimation)
                        }
                    }
                    Spacer()
                }
                .padding(8)
                // need to set background color to have all of width be touch
                // area
                .background(Color(UIColor.systemBackground))
            }
            .buttonStyle(PlainButtonStyle())
            Hairline()
        }
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

