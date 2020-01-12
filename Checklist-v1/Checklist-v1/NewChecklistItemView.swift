//
//  NewChecklistItemView.swift
//  Checklist-v1
//
//  Created by Toni Itkonen on 8.1.2020.
//  Copyright © 2020 Toni Itkonen. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    
    var checklist: Checklist
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode // En tiedä onko tämä oikea kohta?
    
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    var newChecklistItem = ChecklistItem(name: self.newItemName)
                    self.checklist.items.append(newChecklistItem) // add a new item to the checklist.
                    self.checklist.printChecklistContents() // Confirms that app is adding new line
                    self.checklist.saveListItems()
                    self.presentationMode.wrappedValue.dismiss() //Dismiss sheet after user is tapped "Add new item" button
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
                .disabled(newItemName.count == 0) // Makes sure that user can't add empty task to the list.
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
