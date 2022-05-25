//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Yuri Gerasimchuk on 25.05.2022.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    // Date and time info
                    VStack(alignment: .leading) {
                        Text(item.date.formatted(.dateTime.weekday()))
                        Text(item.date.formatted(date: .numeric, time: .omitted))
                        Text(item.date.formatted(date: .omitted, time: .shortened))
                    }
                    .font(.system(size: 11))
                    
                    // Body of transaction
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    // Amount in currency
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
                
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in }
    }
}
