//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Yuri Gerasimchuk on 24.05.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let date: Date
}
