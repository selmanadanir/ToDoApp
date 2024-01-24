//
//  AddView.swift
//  ToDoList
//
//  Created by Selman Adanır on 17.12.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .foregroundStyle(Color.black)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(Color.gray.opacity(0.2))
                
                Button(action: {
                    tappedSaveButton()
                }, label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item  🖋️")
    }
    
    private func tappedSaveButton() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss.callAsFunction()
        } else {
            showAlert.toggle()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
