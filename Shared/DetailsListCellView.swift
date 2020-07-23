import SwiftUI

struct DetailsListCellView: View {
    var item: ItemModel
    var lineAnimation: Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                item.icon
                    .matchedGeometryEffect(id: "\(item.id).icon", in: lineAnimation)
                Text(item.text)
                    .matchedGeometryEffect(id: "\(item.id).text", in: lineAnimation)
                Spacer()
            }
            .padding()
            Hairline()
        }
    }
}

struct DetailsListCellView_Previews: PreviewProvider {
    @Namespace static var previewAnimation
    
    static var previews: some View {
        DetailsListCellView(item: ItemModel(Icons.doc_text, "First"),
                            lineAnimation: previewAnimation)
    }
}
