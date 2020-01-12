import SwiftUI

struct ChecklistView: View {
  
  // Properties
  // ==========
    @State var newChecklistItemViewIsVisible = false
    @ObservedObject var checklist = Checklist()
  
  // User interface content and layout
  var body: some View {
    NavigationView {
      List {
        ForEach(checklist.items) { index in
            RowView(checklistItem: self.$checklist.items[index])
        }
//          HStack {
//            Text(checklistItem.name)
//            Spacer()
//            Text(checklistItem.isChecked ? "✅" : "🔲")
//          }
//          .background(Color.white) // This makes the entire row clickable
//          .onTapGesture {
//            if let matchingIndex =
//              self.checklist.items.firstIndex(where: { $0.id == checklistItem.id }) {
//              self.checklist.items[matchingIndex].isChecked.toggle()
//            }
//            self.checklist.printChecklistContents()
//          }
        
        .onDelete(perform: checklist.deleteListItem)
        .onMove(perform: checklist.moveListItem)
      }
      .navigationBarItems(
        leading: Button(action: { self.newChecklistItemViewIsVisible = true }) {
            Image(systemName: "plus")
        },
        trailing: EditButton()
      )
      .navigationBarTitle("Checklist") 
      .onAppear() {
        self.checklist.printChecklistContents()
        self.checklist.saveListItems()
      }
    }
    
    .sheet(isPresented: $newChecklistItemViewIsVisible) {
        NewChecklistItemView(checklist: self.checklist)
    }
    
  }
  
  
  // Methods
  // =======
  
}


// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
