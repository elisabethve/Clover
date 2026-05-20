//
//  CloversFind.swift
//  Clover
//
//  Created by Elisabeth Everhart on 5/20/26.
//

import Foundation
import SwiftData

@Model
class CloversFind {
    @Attribute(.unique) var id: UUID
    var date: Date
    var leafCount: Int // 4, 5, or 6
    var quantity: Int
    var notes: String?

    init(id: UUID = UUID(), date: Date, leafCount: Int, quantity: Int, notes: String? = nil) {
        self.id = id
        self.date = date
        self.leafCount = leafCount
        self.quantity = quantity
        self.notes = notes
    }
}