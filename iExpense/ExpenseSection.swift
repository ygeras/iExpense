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
    private var totalPerSection: Double {
        expenses.reduce(0.0) { partialResult, item in
            partialResult + item.amount
            // also can be expressed as { $0 + $1.amount }
        }
    }
    
    var body: some View {
        Section(header: Text(title), footer: Text(totalPerSection, format: .localCurrency)) {
            ForEach(expenses) { item in
                HStack {
                    // Date and time info
                    DateView(date: item.date)
                    
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
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Expense item: \(item.name)")
                .accessibilityValue("Amount: \(Text(item.amount, format: .localCurrency))")
                .accessibilityHint("Category: \(item.type)")
                
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: [], deleteItems: {_ in })
            .previewLayout(.sizeThatFits)
    }
}
