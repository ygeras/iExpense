//
//  View-ExpenseStyle.swift
//  iExpense
//
//  Created by Yuri Gerasimchuk on 25.05.2022.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.foregroundColor(.green)
        } else if item.amount < 100 {
            return self.foregroundColor(.yellow)
        } else {
            return self.foregroundColor(.red)
        }
    }
}
