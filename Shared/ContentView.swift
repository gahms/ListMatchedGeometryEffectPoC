import SwiftUI

struct ContentView: View {
    var data: [ItemLineModel] = [
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
    
    @State var selectedLine: ItemLineModel?

    @Namespace var lineAnimation
    
    var body: some View {
        VStack {
            if selectedLine == nil {
                OverviewListView(lines: data,
                                 selectedLine: $selectedLine,
                                 lineAnimation: lineAnimation)
            }
            else {
                DetailsListView(items: selectedLine!.items,
                                selectedLine: $selectedLine,
                                lineAnimation: lineAnimation)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
