//
//  LogFindView.swift
//  Clover
//
//  Created by Elisabeth Everhart on 5/20/26.
//

import SwiftUI
import SwiftData

struct LogFindView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var leafCount: Int = 4
    @State private var quantity: Int = 1
    @State private var date: Date = Date()
    @State private var notes: String = ""

    var body: some View {
        Form {
            Section(header: Text("Clover Details")) {
                Picker("Clover Type", selection: $leafCount) {
                    Text("4-leaf").tag(4)
                    Text("5-leaf").tag(5)
                    Text("6-leaf").tag(6)
                }
                .pickerStyle(SegmentedPickerStyle())

                Stepper(value: $quantity, in: 1...100) {
                    Text("Quantity: \(quantity)")
                }

                DatePicker("Date", selection: $date, displayedComponents: .date)

                TextField("Notes (optional)", text: $notes)
            }

            Button(action: saveFind) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Log a Find")
    }

    private func saveFind() {
        let newFind = CloversFind(date: date, leafCount: leafCount, quantity: quantity, notes: notes.isEmpty ? nil : notes)
        modelContext.insert(newFind)
        try? modelContext.save()
    }
}

#Preview {
    LogFindView()
}