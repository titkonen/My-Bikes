import Foundation

class Checklist: ObservableObject {
  
    @Published var items: [ChecklistItem] = []
  
    
    // MARK: - Methods
    
      init() {
        print("Documents directory is: \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
        loadListItems() // Calls/Loads Property.list data
      }
    
      func printChecklistContents() {
        for item in items {
          print(item)
        }
        print("===================")
      }

      func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printChecklistContents()
        saveListItems()
      }

      func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
        saveListItems()
      }
    
      func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
      }
    
      func dataFilePath() -> URL {
        return
            documentsDirectory().appendingPathComponent("Checklist.plist")
      }
    
    // Saves data to property.list
    func saveListItems() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(items)
            
            try data.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
        }   catch {
            print("Error encoding iten array: \(error.localizedDescription)")
        }
    }

    // Loads data from property.list
    func loadListItems() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ChecklistItem].self, from: data)
            } catch {
                print("Errod decoding item array: \(error.localizedDescription)")
            }
        }
    }
        
  
}
