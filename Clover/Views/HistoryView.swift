//
//  HistoryView.swift
//  Clover
//
//  Created by Elisabeth Everhart on 5/20/26.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Query(sort: \CloversFind.date, order: .reverse) var clovers: [CloversFind]

    var body: some View {
        List {
            ForEach(clovers) { clover in
                VStack(alignment: .leading) {
                    Text("\(clover.leafCount)-leaf Clover")
                        .font(.headline)
                    Text("Quantity: \(clover.quantity)")
                    Text("Date: \(clover.date, formatter: dateFormatter)")
                    if let notes = clover.notes {
                        Text("Notes: \(notes)")
                            .italic()
                    }
                }
                .padding(.vertical, 4)
            }
            .onDelete(perform: deleteFind)
        }
        .navigationTitle("History")
    }

    private func deleteFind(at offsets: IndexSet) {
        for index in offsets {
            let clover = clovers[index]
            clover.delete()
        }
        try? clovers.modelContext?.save()
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    HistoryView()
}