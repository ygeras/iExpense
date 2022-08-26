//
//  ContentView.swift
//  iExpense
//
//  Created by Yuri Gerasimchuk on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    private var totalAmount: Double {
        expenses.items.reduce(0.0) { partialResult, item in
            partialResult + item.amount
            // also can be expressed as { $0 + $1.amount }
        }
    }
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationView {
                List {
                    ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                    
                    ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                    
                }
                .listStyle(.grouped)
                .safeAreaInset(edge: .bottom, content: {
                    VStack(spacing: 10) {
                        Divider()
                        HStack {
                            Text("Total amount:")
                            Text(totalAmount, format: .localCurrency)
                        }
                    }
                    .background(.ultraThinMaterial)
                })
                .navigationTitle("iExpense")
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
            }
            
            Button {
                showingAddExpense = true
                animationAmount = 2
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .padding()
            }
            .tint(.white)
            .background(Circle().fill(.teal))
            .shadow(radius: 5, x: 2, y: 2)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 50, trailing: 10))
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
