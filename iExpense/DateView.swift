//
//  DateView.swift
//  iExpense
//
//  Created by Yuri Gerasimchuk on 25.05.2022.
//

import SwiftUI

struct DateView: View {
    var date: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(date.formatted(.dateTime.weekday()))
            Text(date.formatted(date: .numeric, time: .omitted))
            Text(date.formatted(date: .omitted, time: .shortened))
        }
        .font(.system(size: 11))
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: Date())
            .previewLayout(.sizeThatFits)
    }
}
