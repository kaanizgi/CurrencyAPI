//
//  DoubleFormatter.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import Foundation
extension Double {
    
    
    private var currencyFormatter:NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$No data"
    }
}






