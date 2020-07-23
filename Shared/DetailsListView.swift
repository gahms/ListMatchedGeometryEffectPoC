import SwiftUI

struct DetailsListView: View {
    var items: [ItemModel]
    @Binding var selectedLine: ItemLineModel?
    var lineAnimation: Namespace.ID
    @State var showHeading = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if showHeading {
                heading
                    .transition(.move(edge: .trailing))
            }
            ForEach(items) { item in
                DetailsListCellView(item: item,
                                    lineAnimation: lineAnimation)
            }
        }
        .padding()
        .onAppear {
            withAnimation {
                showHeading = true
            }
        }
    }
    
    var heading: some View {
        HStack {
            Button("Back") {
                withAnimation {
                    showHeading = false
                    selectedLine = nil
                }
            }
            Spacer()
            Text("Details")
                .font(.title)
            Spacer()
        }
        .padding()
        .border(Color.gray)
    }
}

struct DetailsListView_Previews: PreviewProvider {
    static var previewItems: [ItemModel] = [
        ItemModel(Icons.doc_text, "First", .blue),
        ItemModel(Icons.doc_text, "Second", .blue),
        ItemModel(Icons.doc_text, "Third", .blue),
        ItemModel(Icons.doc_text, "Fourth", .blue),
    ]
    @Namespace static var previewAnimation

    static var previews: some View {
        DetailsListView(items: previewItems,
                        selectedLine: .constant(nil),
                        lineAnimation: previewAnimation)
    }
}
