import SwiftUI

struct ContentView: View {
    var data: [ItemLineModel] = [
        ItemLineModel(id: "1", items: [
            ItemModel(Icons.doc_text, "First", .blue),
            ItemModel(Icons.bolt_circle, "Second", .green),
            ItemModel(Icons.moon, "Third", .orange),
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
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            NavigationView {
                OverviewListView(lines: data,
                                 selectedLine: $selectedLine,
                                 lineAnimation: lineAnimation)
                    .navigationBarTitle("Overview", displayMode: .inline)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .zIndex(1)

            if selectedLine != nil {
                Color.white.overlay(
                    DetailsListView(items: selectedLine!.items,
                                    selectedLine: $selectedLine,
                                    lineAnimation: lineAnimation)
                )
                .zIndex(3)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
