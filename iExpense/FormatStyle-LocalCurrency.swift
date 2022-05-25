//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Yuri Gerasimchuk on 25.05.2022.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
