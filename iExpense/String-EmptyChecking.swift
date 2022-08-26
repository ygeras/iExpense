//
//  String-EmptyChecking.swift
//  Bookworm
//
//  Created by Yuri Gerasimchuk on 13.06.2022.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
