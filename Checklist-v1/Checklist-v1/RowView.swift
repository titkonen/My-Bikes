//
//  RowView is

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)) { // creates link between the view
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "🔲")
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
