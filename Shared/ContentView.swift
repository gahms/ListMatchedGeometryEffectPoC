import SwiftUI

struct ContentView: View {
    var data: [ItemLineModel] = [
        ItemLineModel(id: "1", items: [
            ItemModel(Icons.doc_text, "First", .blue),
            ItemModel(Icons.doc_text, "Second", .green),
            ItemModel(Icons.doc_text, "Third", .orange),
            ItemModel(Icons.doc_text, "Fourth", .blue),
        ]),
        ItemLineModel(id: "2", items: [
            ItemModel(Icons.doc_text, "Fem", .blue),
            ItemModel(Icons.doc_text, "Seks", .orange),
            ItemModel(Icons.doc_text, "Syv", .pink),
        ]),
        ItemLineModel(id: "3", items: [
            ItemModel(Icons.doc_text, "Madrid", .blue),
            ItemModel(Icons.doc_text, "Barcelona", .blue),
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
