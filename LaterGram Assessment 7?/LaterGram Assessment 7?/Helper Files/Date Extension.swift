//
//  Date Extension.swift
//  LaterGram Assessment 7?
//
//  Created by Chase on 3/13/23.
//

import Foundation

extension Date {
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short // I assume we will want time stamps as well as date.
        return formatter.string(from: self)
    }
}
