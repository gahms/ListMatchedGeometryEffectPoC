import SwiftUI

struct OverviewItemView: View {
    var item: ItemModel
    var lineAnimation: Namespace.ID
    
    var body: some View {
        HStack {
            item.icon
                .matchedGeometryEffect(id: "\(item.id).icon", in: lineAnimation)
                
            Text(item.text)
                .matchedGeometryEffect(id: "\(item.id).text", in: lineAnimation)
        }
        .padding(4)
        .background(RoundedRectangle(cornerRadius: 8)
                        .matchedGeometryEffect(id: "\(item.id).color", in: lineAnimation)
                        .foregroundColor(item.color)
        )
        .foregroundColor(Color.white)
    }
}

struct OverviewItemView_Previews: PreviewProvider {
    @Namespace static var previewAnimation
    
    static var previews: some View {
        OverviewItemView(item: ItemModel(Icons.doc_text, "Barcelona", .blue),
                         lineAnimation: previewAnimation)
    }
}
